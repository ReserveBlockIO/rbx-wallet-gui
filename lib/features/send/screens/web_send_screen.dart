import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/features/web/components/web_wallet_type_switcher.dart';

import '../../../core/base_screen.dart';
import '../../../core/providers/web_session_provider.dart';
import '../../web/components/web_no_wallet.dart';
import '../components/send_form.dart';

class WebSendScreen extends BaseScreen {
  const WebSendScreen({Key? key})
      : super(
          key: key,
          includeWebDrawer: true,
          backgroundColor: Colors.black87,
          horizontalPadding: 0,
          verticalPadding: 0,
        );

  @override
  AppBar? appBar(BuildContext context, WidgetRef ref) {
    return AppBar(
      title: const Text("Send RBX"),
      shadowColor: Colors.transparent,
      backgroundColor: Colors.black,
      actions: [
        WebWalletTypeSwitcher(),
      ],
    );
  }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    final keypair = ref.watch(webSessionProvider).keypair;
    final raKeypair = ref.watch(webSessionProvider).raKeypair;
    final wallet = ref.watch(webSessionProvider).currentWallet;

    if (keypair == null) {
      return const Center(child: WebNotWallet());
    }

    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 720),
        child: SendForm(
          keypair: keypair,
          wallet: wallet,
          raKeypair: raKeypair,
        ),
      ),
    );
  }
}
