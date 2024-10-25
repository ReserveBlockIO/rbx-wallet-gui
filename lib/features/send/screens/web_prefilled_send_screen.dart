import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/providers/session_provider.dart';

import '../../../core/base_screen.dart';
import '../../../core/providers/web_session_provider.dart';
import '../../web/components/web_no_wallet.dart';
import '../components/send_form.dart';
import '../providers/send_form_provider.dart';

class WebPrefilledSendScreen extends BaseScreen {
  final String toAddress;
  final double amount;

  const WebPrefilledSendScreen({
    Key? key,
    @PathParam('toAddress') required this.toAddress,
    @PathParam('amount') required this.amount,
  }) : super(
          key: key,
          includeWebDrawer: true,
          backgroundColor: Colors.black87,
          horizontalPadding: 0,
          verticalPadding: 0,
        );

  @override
  AppBar? appBar(BuildContext context, WidgetRef ref) {
    final isBtc = ref.watch(webSessionProvider.select((v) => v.usingBtc));
    return AppBar(
      title: isBtc ? Text("Send BTC") : Text("Send VFX"),
      shadowColor: Colors.transparent,
      backgroundColor: Colors.black,
    );
  }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    ref.read(sendFormProvider.notifier).addressController.text = toAddress;
    ref.read(sendFormProvider.notifier).amountController.text = amount.toString();

    final keypair = ref.watch(webSessionProvider.select((v) => v.keypair));
    if (keypair == null) {
      return const Center(child: WebNotWallet());
    }

    return Center(child: ConstrainedBox(constraints: const BoxConstraints(maxWidth: 720), child: SendForm(keypair: keypair)));
  }
}
