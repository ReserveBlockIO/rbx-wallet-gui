import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/breakpoints.dart';
import '../../web/components/web_mobile_drawer_button.dart';
import '../../web/components/web_wallet_type_switcher.dart';

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
    final isMobile = BreakPoints.useMobileLayout(context);
    final isBtc = ref.watch(webSessionProvider.select((v) => v.usingBtc));
    return AppBar(
      leading: isMobile ? WebMobileDrawerButton() : null,
      title: isBtc ? Text("Send BTC") : Text("Send VFX"),
      shadowColor: Colors.transparent,
      backgroundColor: Colors.black,
    );
  }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    final keypair = ref.watch(webSessionProvider.select((v) => v.keypair));
    final raKeypair = ref.watch(webSessionProvider.select((v) => v.raKeypair));
    final wallet = ref.watch(webSessionProvider.select((v) => v.currentWallet));
    final btcWebAccount = ref.watch(webSessionProvider.select((v) => v.btcKeypair));

    if (keypair == null && raKeypair == null && btcWebAccount == null) {
      return const Center(child: WebNotWallet());
    }

    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 720),
          child: SendForm(
            keypair: keypair,
            wallet: wallet,
            raKeypair: raKeypair,
            btcWebAccount: btcWebAccount,
          ),
        ),
      ),
    );
  }
}
