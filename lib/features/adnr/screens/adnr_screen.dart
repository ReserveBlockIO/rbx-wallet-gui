import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/providers/session_provider.dart';
import 'package:rbx_wallet/features/wallet/components/wallet_selector.dart';

import '../../../core/app_constants.dart';
import '../../../core/base_screen.dart';
import '../../btc/components/btc_adnr_list.dart';
import '../../wallet/providers/wallet_list_provider.dart';
import '../components/adrn_list.dart';

class AdnrScreen extends BaseScreen {
  const AdnrScreen({Key? key}) : super(key: key);

  @override
  AppBar? appBar(BuildContext context, WidgetRef ref) {
    final isBtc = ref.watch(sessionProvider).btcSelected;

    return AppBar(
      title: Text(isBtc ? "RBX BTC Domain Service" : "RBX Domain Service"),
      backgroundColor: Colors.black12,
      shadowColor: Colors.transparent,
      actions: const [WalletSelector()],
    );
  }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    final isBtc = ref.watch(sessionProvider).btcSelected;

    if (isBtc) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  "Create an RBX BTC Domain as an alias to your BTC wallet address for receiving funds.",
                  style: TextStyle(
                    fontSize: 17,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          Expanded(
            child: BtcAdnrList(),
          )
        ],
      );
    }

    final wallets = ref.watch(walletListProvider).where((w) => !w.isReserved).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "Create an RBX Domain as an alias to your wallet's address for receiving funds.",
                style: TextStyle(
                  fontSize: 17,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 4,
              ),
              const Text(
                "RBX domains cost $ADNR_COST RBX plus the transaction fee.",
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        Expanded(child: AdnrList(wallets: wallets)),
      ],
    );
  }
}
