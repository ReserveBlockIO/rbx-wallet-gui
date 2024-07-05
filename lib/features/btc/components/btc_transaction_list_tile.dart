import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rbx_wallet/core/components/buttons.dart';
import 'package:rbx_wallet/core/dialogs.dart';
import 'package:rbx_wallet/features/bridge/models/log_entry.dart';
import 'package:rbx_wallet/features/bridge/providers/log_provider.dart';
import 'package:rbx_wallet/features/btc/services/btc_service.dart';
import 'package:rbx_wallet/utils/validation.dart';
import '../../../core/base_component.dart';
import '../../../core/env.dart';
import '../../../core/theme/app_theme.dart';
import '../models/btc_account.dart';
import '../models/btc_transaction.dart';
import '../providers/btc_account_list_provider.dart';
import '../../../utils/toast.dart';
import 'package:url_launcher/url_launcher_string.dart';

class BtcTransactionListTile extends BaseStatefulComponent {
  final String address;
  final BtcTransaction transaction;
  final bool compact;

  const BtcTransactionListTile({
    super.key,
    required this.address,
    required this.transaction,
    this.compact = false,
  });

  @override
  BtcTransactionListTileState createState() => BtcTransactionListTileState();
}

class BtcTransactionListTileState extends BaseComponentState<BtcTransactionListTile> {
  bool _expanded = false;
  Future<void> _copy(String value, String name) async {
    await Clipboard.setData(
      ClipboardData(text: value),
    );
    Toast.message("$name copied to clipboard");
  }

  @override
  Widget build(BuildContext context) {
    final transaction = widget.transaction;
    final address = widget.address;

    final toMe = transaction.toAddress == address;
    final fromMe = transaction.fromAddress == address;

    return Container(
      decoration: BoxDecoration(
        color: Color(0xFF050505),
        boxShadow: glowingBoxBtc,
      ),
      child: Card(
        margin: widget.compact ? EdgeInsets.zero : const EdgeInsets.symmetric(vertical: 4, horizontal: 0),
        color: Colors.white.withOpacity(0.03),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Builder(builder: (context) {
                      if (toMe && fromMe) {
                        return const Icon(Icons.refresh);
                      }
                      if (toMe) {
                        return const Icon(Icons.move_to_inbox);
                      }

                      if (fromMe) {
                        return const Icon(Icons.outbox);
                      }
                      return const Icon(Icons.star, color: Colors.transparent);
                    }),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "Hash: ${transaction.hash}",
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            InkWell(
                              onTap: () {
                                _copy(widget.transaction.hash, "Hash");
                              },
                              child: const Icon(
                                Icons.copy,
                                size: 12,
                              ),
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            InkWell(
                              onTap: () async {
                                if (Env.isTestNet) {
                                  launchUrlString("https://mempool.space/testnet4/tx/${transaction.hash}");
                                } else {
                                  launchUrlString("https://mempool.space/tx/${transaction.hash}");
                                }
                              },
                              child: const Icon(
                                Icons.open_in_new,
                                size: 12,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        RichText(
                          text: TextSpan(
                            style: Theme.of(context).textTheme.bodyText2,
                            children: [
                              const TextSpan(text: "Amount: "),
                              TextSpan(
                                text: "${transaction.amount} BTC",
                                style: TextStyle(
                                  color: Theme.of(context).colorScheme.btcOrange,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SelectableText("To: ${transaction.toAddress}", style: Theme.of(context).textTheme.caption),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  SelectableText("From: ${transaction.fromAddress}", style: Theme.of(context).textTheme.caption),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  Text(
                                    "Date: ${widget.transaction.parseTimeStamp}",
                                    style: Theme.of(context).textTheme.caption,
                                  ),
                                ],
                              ),
                            ),
                            AppButton(
                              label: "Replace By Fee",
                              onPressed: () async {
                                final feeRateStr = await PromptModal.show(
                                    title: "Fee Rate",
                                    body: "Input your desired fee rate (SATS /byte) for this transaction.",
                                    validator: (v) => formValidatorInteger(v, "Fee Rate"),
                                    labelText: "Fee Rate (SATS /byte)",
                                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                                    lines: 1,
                                    obscureText: false);

                                if (feeRateStr == null) {
                                  return;
                                }

                                final feeRate = int.tryParse(feeRateStr);

                                if (feeRate == null) {
                                  Toast.error("Invalid fee rate. Must be a whole number");
                                  return;
                                }

                                final hash = await BtcService().replaceByFee(widget.transaction.hash, feeRate);

                                if (hash != null) {
                                  final message = "Replaced by fee ($feeRate SATS /byte) TX sent. Hash: $hash";
                                  Toast.message(message);

                                  ref.read(logProvider.notifier).append(
                                        LogEntry(
                                          message: message,
                                          textToCopy: hash,
                                          variant: AppColorVariant.Btc,
                                        ),
                                      );
                                }
                              },
                              variant: AppColorVariant.Btc,
                              type: AppButtonType.Outlined,
                            ),
                            AppButton(
                              label: "Rebroadcast TX",
                              onPressed: () async {
                                final confirmed =
                                    await ConfirmDialog.show(title: "Rebroadcast TX", body: "Are you sure you want to rebroadcast this transaction?");
                                if (confirmed != true) {
                                  return;
                                }
                                final hash = await BtcService().rebroadcastTx(widget.transaction.hash);

                                if (hash != null) {
                                  final message = "Rebroadcasted TX. ($hash)";
                                  Toast.message(message);

                                  ref.read(logProvider.notifier).append(
                                        LogEntry(
                                          message: message,
                                          textToCopy: hash,
                                          variant: AppColorVariant.Btc,
                                        ),
                                      );
                                }
                              },
                              variant: AppColorVariant.Light,
                              type: AppButtonType.Outlined,
                            ),
                          ],
                        ),
                        if (_expanded)
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Divider(),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text("Fee Rate"),
                                  Text("${transaction.feeRate} SATS"),
                                ],
                              ),
                              const Divider(),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text("Fee"),
                                  Text("${transaction.fee} BTC"),
                                ],
                              ),
                              const Divider(),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const Text("Signature"),
                                  Transform.translate(
                                    offset: Offset(0, 3),
                                    child: IconButton(
                                      onPressed: () {
                                        _copy(transaction.signature, "Transaction Signature");
                                      },
                                      icon: Icon(
                                        Icons.copy,
                                        size: 14,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 6,
                              ),
                              SelectableText(
                                transaction.signature,
                                style: Theme.of(context).textTheme.caption,
                              ),
                            ],
                          ),
                      ],
                    ),
                  ),
                  IconButton(
                    icon: Icon(_expanded ? Icons.arrow_drop_up_outlined : Icons.arrow_drop_down_outlined),
                    onPressed: () {
                      setState(() {
                        _expanded = !_expanded;
                      });
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
