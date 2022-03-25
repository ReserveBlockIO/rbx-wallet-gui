import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rbx_wallet/core/base_component.dart';
import 'package:rbx_wallet/core/components/badges.dart';
import 'package:rbx_wallet/core/theme/app_theme.dart';
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
  _TransactionListTileState createState() => _TransactionListTileState();
}

class _TransactionListTileState
    extends BaseComponentState<TransactionListTile> {
  bool _expanded = false;
  Future<void> _copy(String value, String name) async {
    await Clipboard.setData(
      ClipboardData(text: value),
    );
    Toast.message("$name copied to clipboard");
  }

  @override
  Widget build(BuildContext context) {
    final Wallet? toWallet = ref
        .read(walletListProvider.notifier)
        .getWallet(widget.transaction.toAddress);

    final Wallet? fromWallet = ref
        .read(walletListProvider.notifier)
        .getWallet(widget.transaction.fromAddress);

    final toMe = toWallet != null;
    final fromMe = fromWallet != null;

    return Card(
      margin: widget.compact
          ? EdgeInsets.zero
          : EdgeInsets.symmetric(vertical: 4, horizontal: 0),
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
                      return Icon(Icons.refresh);
                    }

                    if (toMe) {
                      return Icon(Icons.move_to_inbox);
                    }

                    if (fromMe) {
                      return Icon(Icons.outbox);
                    }

                    return Icon(Icons.star, color: Colors.transparent);
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
                          SizedBox(
                            width: 4,
                          ),
                          InkWell(
                            onTap: () {
                              _copy(widget.transaction.hash, "Hash");
                            },
                            child: Icon(
                              Icons.copy,
                              size: 12,
                            ),
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          InkWell(
                            onTap: () async {
                              final url =
                                  "https://rbx.network/transaction/${widget.transaction.hash}";
                              await launch(url);
                            },
                            child: Icon(
                              Icons.open_in_new,
                              size: 12,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      RichText(
                        text: TextSpan(
                          style: Theme.of(context).textTheme.bodyText2,
                          children: [
                            TextSpan(text: "Amount: "),
                            TextSpan(
                              text: "${widget.transaction.amount} RBX",
                              style: TextStyle(
                                color: widget.transaction.amount < 0
                                    ? Theme.of(context).colorScheme.danger
                                    : Theme.of(context).colorScheme.success,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(),
                      Text(
                        "To: ${widget.transaction.toAddress}${toWallet != null && toWallet.friendlyName != null ? ' (${toWallet.friendlyName})' : ''}",
                        style: Theme.of(context).textTheme.caption,
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        "From: ${widget.transaction.fromAddress}${fromWallet != null && fromWallet.friendlyName != null ? ' (${fromWallet.friendlyName})' : ''}",
                        style: Theme.of(context).textTheme.caption,
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        "Date: ${widget.transaction.parseTimeStamp}",
                        style: Theme.of(context).textTheme.caption,
                      ),
                      if (_expanded)
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Divider(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Block Number"),
                                Text("${widget.transaction.height}"),
                              ],
                            ),
                            Divider(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Fee"),
                                Text("${widget.transaction.fee}"),
                              ],
                            ),
                            Divider(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Nonce"),
                                Text("${widget.transaction.nonce}"),
                              ],
                            ),
                            Divider(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Data"),
                                Text("-"),
                              ],
                            ),
                            Divider(),
                          ],
                        )
                    ],
                  ),
                ),
                if (!widget.compact)
                  Column(
                    children: [
                      IconButton(
                        icon: Icon(_expanded
                            ? Icons.arrow_drop_up_outlined
                            : Icons.arrow_drop_down_outlined),
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
