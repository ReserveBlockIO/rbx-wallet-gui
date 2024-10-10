import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rbx_wallet/core/app_constants.dart';
import 'package:rbx_wallet/core/theme/components.dart';
import '../../../core/components/badges.dart';
import '../../../core/components/buttons.dart';
import '../../../core/env.dart';
import '../../../core/theme/app_theme.dart';
import '../../../core/theme/colors.dart';
import '../models/btc_web_transaction.dart';
import '../../../utils/toast.dart';
import 'package:url_launcher/url_launcher_string.dart';

class WebBtcTransactionListTile extends StatelessWidget {
  final BtcWebTransaction transaction;
  const WebBtcTransactionListTile({
    super.key,
    required this.transaction,
  });

  @override
  Widget build(BuildContext context) {
    final tx = transaction;

    return AppCard(
      padding: 12,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              if (Env.isTestNet) {
                launchUrlString("https://mempool.space/testnet4/tx/${tx.txid}");
              } else {
                launchUrlString("https://mempool.space/tx/${tx.txid}");
              }
            },
            child: Row(
              children: [
                SizedBox(
                  width: 4,
                ),
                Text(
                  "TX ID: ",
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.white70,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  tx.txid,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.white70,
                    decoration: TextDecoration.underline,
                  ),
                ),
                SizedBox(
                  width: 4,
                ),
                Icon(
                  Icons.open_in_new,
                  size: 12,
                  color: Colors.white70,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Row(
            children: [
              Expanded(
                child: AppCard(
                  padding: 0,
                  color: AppColors.getGray(ColorShade.s100),
                  glowOpacity: 0,
                  child: ListTile(
                    title: tx.status.confirmed
                        ? Text(
                            "Confirmed",
                            style: TextStyle(color: Theme.of(context).colorScheme.success, fontWeight: FontWeight.bold),
                          )
                        : Text(
                            "Pending",
                            style: TextStyle(color: Theme.of(context).colorScheme.warning, fontWeight: FontWeight.bold),
                          ),
                    subtitle: Text("Status"),
                  ),
                ),
              ),
              SizedBox(
                width: 8,
              ),
              Expanded(
                child: AppCard(
                  padding: 0,
                  color: AppColors.getGray(ColorShade.s100),
                  glowOpacity: 0,
                  child: ListTile(
                    title: Text("${tx.fee} SATS | ${tx.feeBtc} BTC"),
                    subtitle: Text("Fee"),
                  ),
                ),
              ),
              SizedBox(
                width: 8,
              ),
              Expanded(
                child: AppCard(
                  padding: 0,
                  color: AppColors.getGray(ColorShade.s100),
                  glowOpacity: 0,
                  child: ListTile(
                    title: Text(tx.blockTimeLabel),
                    subtitle: Text("Block Time"),
                  ),
                ),
              ),
              SizedBox(
                width: 8,
              ),
              Expanded(
                child: AppCard(
                  padding: 0,
                  color: AppColors.getGray(ColorShade.s100),
                  glowOpacity: 0,
                  child: ListTile(
                    title: Text(tx.blockHeightLabel),
                    subtitle: Text("Block Height"),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 4,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Inputs:",
                        style: TextStyle(
                          color: Colors.white70,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    ...tx.vin.map((input) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 4),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.black26,
                            border: Border.all(color: Colors.white10, width: 1),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: ListTile(
                            dense: true,
                            title: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(input.prevout.scriptpubkeyAddress),
                                Padding(
                                  padding: const EdgeInsets.only(left: 4.0),
                                  child: InkWell(
                                    onTap: () async {
                                      await Clipboard.setData(ClipboardData(text: input.prevout.scriptpubkeyAddress));
                                      Toast.message("Address copied to clipboard");
                                    },
                                    child: Icon(
                                      Icons.copy,
                                      size: 12,
                                      color: Colors.white70,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            trailing: Text("${input.prevout.value * BTC_SATOSHI_MULTIPLIER} BTC"),
                          ),
                        ),
                      );
                    })
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Outputs:",
                        style: TextStyle(
                          color: Colors.white70,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    ...tx.vout.map((output) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 4),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.black26,
                            border: Border.all(color: Colors.white10, width: 1),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: ListTile(
                            dense: true,
                            title: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(output.scriptpubkeyAddress),
                                Padding(
                                  padding: const EdgeInsets.only(left: 4.0),
                                  child: InkWell(
                                    onTap: () async {
                                      await Clipboard.setData(ClipboardData(text: output.scriptpubkeyAddress));
                                      Toast.message("Address copied to clipboard");
                                    },
                                    child: Icon(
                                      Icons.copy,
                                      size: 12,
                                      color: Colors.white70,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            trailing: Text(
                              "${output.value * BTC_SATOSHI_MULTIPLIER} BTC",
                              style: TextStyle(
                                // color: isToMe ? Theme.of(context).colorScheme.success : Colors.white,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      );
                    })
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
