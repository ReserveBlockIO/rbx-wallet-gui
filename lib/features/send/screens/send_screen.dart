import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/base_screen.dart';
import '../../../core/providers/session_provider.dart';
import '../../wallet/components/invalid_wallet.dart';
import '../../wallet/components/wallet_selector.dart';
import '../components/send_form.dart';

class SendScreen extends BaseScreen {
  const SendScreen({Key? key})
      : super(
          key: key,
        );

  @override
  AppBar? appBar(BuildContext context, WidgetRef ref) {
    return AppBar(
      title: const Text("Send RBX"),
      backgroundColor: Colors.black12,
      shadowColor: Colors.transparent,
      actions: const [WalletSelector()],
    );
  }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    final currentWallet = ref.watch(sessionProvider).currentWallet;
    if (currentWallet == null) {
      return const InvalidWallet(message: "No wallet selected");
    }

    return SendForm(wallet: currentWallet);
  }
}
