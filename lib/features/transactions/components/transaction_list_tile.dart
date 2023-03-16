import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rbx_wallet/core/dialogs.dart';
import 'package:rbx_wallet/features/bridge/models/log_entry.dart';
import 'package:rbx_wallet/features/bridge/providers/log_provider.dart';
import 'package:rbx_wallet/features/reserve/services/reserve_account_service.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../../../core/base_component.dart';
import '../../../core/components/buttons.dart';
import '../../../core/env.dart';
import '../../../core/theme/app_theme.dart';
import '../../../utils/toast.dart';
import '../../wallet/models/wallet.dart';
import '../../wallet/providers/wallet_list_provider.dart';
import '../models/transaction.dart';
import 'nft_data_modal.dart';

class TransactionListTile extends BaseStatefulComponent {
  final bool compact;
  final Transaction transaction;
  const TransactionListTile(
    this.transaction, {
    Key? key,
    this.compact = false,
  }) : super(key: key);

  @override
  TransactionListTileState createState() => TransactionListTileState();
}

class TransactionListTileState extends BaseComponentState<TransactionListTile> {
  bool _expanded = false;
  Future<void> _copy(String value, String name) async {
    await Clipboard.setData(
      ClipboardData(text: value),
    );
    Toast.message("$name copied to clipboard");
  }

  @override
  Widget build(BuildContext context) {
    final Wallet? toWallet = ref.read(walletListProvider.notifier).getWallet(widget.transaction.toAddress);

    final Wallet? fromWallet = ref.read(walletListProvider.notifier).getWallet(widget.transaction.fromAddress);

    final toMe = toWallet != null;
    final fromMe = fromWallet != null;

    // final bool canCallBack = widget.transaction.status == TransactionStatus.Reserved &&
    //     fromMe &&
    //     widget.transaction.amount < 0 &&
    //     (widget.transaction.unlockTime != null && widget.transaction.unlockTime! > (DateTime.now().millisecondsSinceEpoch / 1000));

    // final bool canCallBack = widget.transaction.status == TransactionStatus.Reserved && fromMe && widget.transaction.amount < 0;
    final bool canCallBack = widget.transaction.status == TransactionStatus.Reserved && fromMe;

    return Card(
      margin: widget.compact ? EdgeInsets.zero : const EdgeInsets.symmetric(vertical: 4, horizontal: 0),
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
                            "Hash: ${widget.transaction.hash}",
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
                              final url = "${Env.baseExplorerUrl}transaction/${widget.transaction.hash}";
                              await launchUrl(Uri.parse(url));
                            },
                            child: const Icon(
                              Icons.open_in_new,
                              size: 12,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      if (widget.transaction.amount != 0)
                        RichText(
                          text: TextSpan(
                            style: Theme.of(context).textTheme.bodyText2,
                            children: [
                              const TextSpan(text: "Amount: "),
                              TextSpan(
                                text: "${widget.transaction.amount} RBX",
                                style: TextStyle(
                                  color: widget.transaction.amount < 0 ? Theme.of(context).colorScheme.danger : Theme.of(context).colorScheme.success,
                                ),
                              ),
                            ],
                          ),
                        ),
                      const SizedBox(height: 4),
                      RichText(
                        text: TextSpan(
                          style: Theme.of(context).textTheme.bodyText2,
                          children: [
                            const TextSpan(text: "Type: "),
                            TextSpan(
                              text: widget.transaction.typeLabel,
                              style: const TextStyle(
                                color: Colors.white60,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 4),
                      if (widget.transaction.status != null)
                        RichText(
                          text: TextSpan(
                            style: Theme.of(context).textTheme.bodyText2,
                            children: [
                              const TextSpan(text: "Status: "),
                              TextSpan(
                                text: widget.transaction.statusLabel,
                                style: TextStyle(
                                  color: widget.transaction.statusColor(context),
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
                              SelectableText(
                                "To: ${widget.transaction.toAddress}${toWallet != null && toWallet.friendlyName != null ? ' (${toWallet.friendlyName})' : ''}",
                                style: Theme.of(context).textTheme.caption,
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              SelectableText(
                                "From: ${widget.transaction.fromAddress}${fromWallet != null && fromWallet.friendlyName != null ? ' (${fromWallet.friendlyName})' : ''}",
                                style: Theme.of(context).textTheme.caption,
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              Text(
                                "Date: ${widget.transaction.parseTimeStamp}",
                                style: Theme.of(context).textTheme.caption,
                              ),
                            ],
                          )),
                          if (widget.transaction.nftData != null)
                            Padding(
                              padding: const EdgeInsets.only(top: 6.0),
                              child: AppButton(
                                label: "View Data",
                                onPressed: () {
                                  showModalBottomSheet(
                                      context: context,
                                      builder: (context) {
                                        return NftDataModal(widget.transaction.nftData);
                                      });
                                },
                              ),
                            ),
                          if (canCallBack) Text("${widget.transaction.unlockTime}"),
                          if (canCallBack)
                            AppButton(
                              // label: "Callback (${timeago.format(DateTime.fromMillisecondsSinceEpoch((widget.transaction.unlockTime! * 1000).round()), allowFromNow: true)})",
                              label: "Callback",
                              variant: AppColorVariant.Warning,
                              type: AppButtonType.Outlined,
                              onPressed: () async {
                                final password = await PromptModal.show(
                                  title: "Callback Transaction",
                                  body: "Input your password to callback this transaction.",
                                  validator: (v) => null,
                                  lines: 1,
                                  obscureText: true,
                                  labelText: "Password",
                                );

                                if (password != null) {
                                  final hash = await ReserveAccountService().callBack(password, widget.transaction.hash);
                                  if (hash != null) {
                                    final message = "Callback TX sent with hash of $hash";
                                    Toast.message(message);
                                    ref.read(logProvider.notifier).append(
                                          LogEntry(
                                            message: message,
                                            textToCopy: hash,
                                            variant: AppColorVariant.Success,
                                          ),
                                        );
                                  }
                                }
                              },
                            )
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
                                const Text("Block Number"),
                                Text("${widget.transaction.height}"),
                              ],
                            ),
                            const Divider(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text("Fee"),
                                Text("${widget.transaction.fee}"),
                              ],
                            ),
                            const Divider(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text("Nonce"),
                                Text("${widget.transaction.nonce}"),
                              ],
                            ),
                            const Divider(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text("Data"),
                                Text("-"),
                              ],
                            ),
                            const Divider(),
                          ],
                        )
                    ],
                  ),
                ),
                if (!widget.compact)
                  Column(
                    children: [
                      IconButton(
                        icon: Icon(_expanded ? Icons.arrow_drop_up_outlined : Icons.arrow_drop_down_outlined),
                        onPressed: () {
                          setState(() {
                            _expanded = !_expanded;
                          });
                        },
                      ),
                    ],
                  )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
