import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/base_screen.dart';
import 'package:rbx_wallet/core/theme/app_theme.dart';
import 'package:rbx_wallet/features/btc/components/btc_wallet_selector.dart';
import 'package:rbx_wallet/features/btc/components/send_btc_form.dart';

class BtcSendScreen extends BaseScreen {
  const BtcSendScreen({super.key})
      : super(
          backgroundColor: const Color(0xff4d4d4d),
        );

  @override
  AppBar? appBar(BuildContext context, WidgetRef ref) {
    return AppBar(
      title: const Text("Send BTC"),
      backgroundColor: Colors.transparent,
      shadowColor: Colors.transparent,
      centerTitle: true,
      actions: [
        BtcWalletSelector(),
      ],
    );
  }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    return SendBtcForm();
  }
}
