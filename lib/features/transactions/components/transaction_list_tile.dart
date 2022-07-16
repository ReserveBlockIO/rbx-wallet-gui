import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rbx_wallet/core/app_constants.dart';
import 'package:rbx_wallet/core/base_component.dart';
import 'package:rbx_wallet/core/components/buttons.dart';
import 'package:rbx_wallet/core/theme/app_theme.dart';
import 'package:rbx_wallet/features/transactions/components/nft_data_modal.dart';
import 'package:rbx_wallet/features/transactions/models/transaction.dart';
import 'package:rbx_wallet/features/wallet/models/wallet.dart';
import 'package:rbx_wallet/features/wallet/providers/wallet_list_provider.dart';
import 'package:rbx_wallet/utils/toast.dart';
import 'package:url_launcher/url_launcher.dart';

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
                              final url = "https://rbx.network/transaction/${widget.transaction.hash}";
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
                      if (widget.transaction.type == TxType.rbxTransfer)
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
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.warning,
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
                              Text(
                                "To: ${widget.transaction.toAddress}${toWallet != null && toWallet.friendlyName != null ? ' (${toWallet.friendlyName})' : ''}",
                                style: Theme.of(context).textTheme.caption,
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              Text(
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
