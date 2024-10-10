import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../core/components/buttons.dart';
import '../../../core/env.dart';
import '../../../core/theme/app_theme.dart';
import '../models/btc_web_transaction.dart';
import '../../../utils/toast.dart';
import 'package:url_launcher/url_launcher_string.dart';

class WebBtcTransactionListTile extends StatefulWidget {
  final String address;
  final BtcWebTransaction transaction;
  const WebBtcTransactionListTile({
    super.key,
    required this.address,
    required this.transaction,
  });

  @override
  State<WebBtcTransactionListTile> createState() => _WebBtcTransactionListTileState();
}

class _WebBtcTransactionListTileState extends State<WebBtcTransactionListTile> {
  bool expanded = false;

  @override
  Widget build(BuildContext context) {
    final tx = widget.transaction;

    late final String subtitle;

    if (tx.received != null) {
      subtitle = "Received @ ${tx.receivedLabel} | (${tx.confirmations} Confirmations)";
    } else if (tx.status.confirmed) {
      subtitle = "Confirmed @ ${tx.confirmedLabel} | (${tx.confirmations} Confirmations)";
    } else {
      subtitle = "${tx.confirmations} Confirmations";
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: glowingBoxBtc,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Card(
              color: Colors.black,
              child: ListTile(
                leading: Icon(FontAwesomeIcons.btc),
                isThreeLine: true,
                title: Text("${tx.totalBtc} BTC"),
                subtitle: Text("${tx.otherAddresses(widget.address).join(', ')}\n$subtitle"),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AppButton(
                      variant: AppColorVariant.Btc,
                      label: expanded ? "Hide Details" : "Show Details",
                      onPressed: () {
                        setState(() {
                          expanded = !expanded;
                        });
                      },
                    ),
                    IconButton(
                      onPressed: () {
                        if (Env.isTestNet) {
                          launchUrlString("https://mempool.space/testnet4/tx/${tx.hash}");
                        } else {
                          launchUrlString("https://mempool.space/tx/${tx.hash}");
                        }
                      },
                      icon: Icon(Icons.open_in_new),
                    ),
                  ],
                ),
              ),
            ),
            if (expanded)
              Card(
                color: Colors.black,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 40),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _DetailRow(
                        label: "Hash",
                        value: tx.hash,
                      ),
                      _DetailRow(
                        label: "Block Hash",
                        value: tx.blockHash != null ? tx.blockHash! : "-",
                        withCopy: tx.blockHash != null,
                      ),
                      _DetailRow(
                        label: "Block Height",
                        value: tx.blockHeight.toString(),
                        withCopy: false,
                      ),
                      _DetailRow(
                        label: "Total",
                        value: "${tx.totalBtc} BTC | ${tx.total} SATS",
                        withCopy: false,
                      ),
                      _DetailRow(
                        label: "Total Fees",
                        value: "${tx.feesBtc} BTC | ${tx.fees} SATS",
                        withCopy: false,
                      ),
                      _DetailRow(
                        label: "Confirmations",
                        value: "${tx.confirmations}",
                        withCopy: false,
                      ),
                      _DetailRow(
                        label: "Confirmed",
                        value: tx.confirmedLabel,
                        withCopy: false,
                      ),
                      _DetailRow(
                        label: "Received",
                        value: tx.receivedLabel,
                        withCopy: false,
                      ),
                      _DetailRow(
                        label: "Relayed By",
                        value: tx.relayedBy ?? "-",
                        withCopy: false,
                      ),
                      Divider(),
                      Text(
                        "Inputs:",
                        style: TextStyle(decoration: TextDecoration.underline),
                      ),
                      ...tx.inputs.map((input) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              _DetailRow(label: "Previous Hash", value: input.prevHash),
                              _DetailRow(label: "Output Index", value: input.outputIndex.toString()),
                              _DetailRow(label: "Output Value", value: input.outputValue.toString()),
                              _DetailRow(label: "Sequence", value: input.sequence.toString()),
                              _DetailRow(label: "Addresses", value: input.addresses.join(", ")),
                              _DetailRow(label: "Script Type", value: input.scriptType),
                              _DetailRow(label: "Age", value: input.age.toString()),
                            ],
                          ),
                        );
                      }).toList(),
                      Text(
                        "Outputs:",
                        style: TextStyle(decoration: TextDecoration.underline),
                      ),
                      ...tx.outputs.map((output) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              _DetailRow(label: "Value", value: output.value.toString()),
                              _DetailRow(label: "Script", value: output.script),
                              _DetailRow(label: "Addresses", value: output.addresses.join(", ")),
                              _DetailRow(label: "Script Type", value: output.scriptType),
                            ],
                          ),
                        );
                      }).toList()
                    ],
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}

class _DetailRow extends StatelessWidget {
  final String label;
  final String value;
  final bool withCopy;

  const _DetailRow({
    required this.label,
    required this.value,
    this.withCopy = true,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text("$label: $value"),
          if (withCopy)
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: InkWell(
                onTap: () async {
                  await Clipboard.setData(ClipboardData(text: value));
                  Toast.message("$label copied to clipboard");
                },
                child: Icon(
                  Icons.copy,
                  size: 14,
                ),
              ),
            )
        ],
      ),
    );
  }
}
