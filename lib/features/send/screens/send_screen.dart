import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/components/buttons.dart';
import 'package:rbx_wallet/core/theme/app_theme.dart';

import '../../../core/base_screen.dart';
import '../../../core/components/currency_segmented_button.dart';
import '../../../core/providers/currency_segmented_button_provider.dart';
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
    final isBtc = ref.watch(sessionProvider).btcSelected;

    return AppBar(
      title: Text("Send ${isBtc ? 'BTC' : 'VFX'}"),
      backgroundColor: Colors.black12,
      shadowColor: Colors.transparent,
      actions: const [WalletSelector()],
    );
  }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    final isBtc = ref.watch(sessionProvider).btcSelected;

    final currentWallet =
        !isBtc ? ref.watch(sessionProvider).currentWallet : null;
    final currentBtcAccount =
        isBtc ? ref.watch(sessionProvider).currentBtcAccount : null;
    if (currentWallet == null && currentBtcAccount == null) {
      return const InvalidWallet(message: "No wallet selected");
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: CurrencySegementedButton(family: "SEND"),
        ),
        SendForm(
          wallet: currentWallet,
          btcAccount: currentBtcAccount,
        ),
      ],
    );
  }
}
