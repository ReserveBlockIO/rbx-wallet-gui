import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/base_screen.dart';
import 'package:rbx_wallet/core/providers/session_provider.dart';
import 'package:rbx_wallet/core/providers/web_session_provider.dart';
import 'package:rbx_wallet/features/token/components/token_form.dart';

class WebTokenCreateScreen extends BaseScreen {
  const WebTokenCreateScreen({super.key});

  @override
  AppBar? appBar(BuildContext context, WidgetRef ref) {
    return AppBar(
      backgroundColor: Colors.black54,
      title: Text("Create Fungible Token"),
    );
  }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    final keypair = ref.watch(webSessionProvider.select((value) => value.keypair));
    if (keypair == null) {
      return Center(
        child: Text("Address Required"),
      );
    }

    return SingleChildScrollView(
      child: TokenForm(),
    );
  }
}
