import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/base_screen.dart';
import 'package:rbx_wallet/core/providers/web_session_provider.dart';
import 'package:rbx_wallet/features/send/components/send_form.dart';

class WebSendScreen extends BaseScreen {
  const WebSendScreen({Key? key})
      : super(
          key: key,
          includeWebDrawer: true,
        );

  @override
  AppBar? appBar(BuildContext context, WidgetRef ref) {
    return AppBar(
      title: const Text("Send RBX"),
      shadowColor: Colors.transparent,
      backgroundColor: Colors.black,
    );
  }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    final keypair = ref.watch(webSessionProvider).keypair;
    if (keypair == null) {
      return const Text("No wallet found.");
    }

    return SendForm(keypair: keypair);
  }
}
