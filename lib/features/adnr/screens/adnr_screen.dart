import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/app_constants.dart';
import '../../../core/base_screen.dart';
import '../../wallet/providers/wallet_list_provider.dart';
import '../components/adrn_list.dart';

class AdnrScreen extends BaseScreen {
  const AdnrScreen({Key? key}) : super(key: key);

  @override
  AppBar? appBar(BuildContext context, WidgetRef ref) {
    return AppBar(
      title: const Text("RBX Domain Service"),
      backgroundColor: Colors.black12,
      shadowColor: Colors.transparent,
      // actions: const [WalletSelector()],
    );
  }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    final wallets = ref.watch(walletListProvider);

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
