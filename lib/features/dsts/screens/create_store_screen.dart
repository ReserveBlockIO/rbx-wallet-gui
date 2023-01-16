import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/base_screen.dart';
import '../../../core/providers/web_session_provider.dart';
import '../components/create_store_form.dart';

class CreateStoreScreen extends BaseScreen {
  final String accountId;

  const CreateStoreScreen({
    Key? key,
    @PathParam('accountId') required this.accountId,
  }) : super(
          key: key,
          includeWebDrawer: true,
          backgroundColor: Colors.black87,
          horizontalPadding: 0,
          verticalPadding: 0,
        );

  @override
  AppBar? appBar(BuildContext context, WidgetRef ref) {
    return AppBar(
      title: const Text("Create Store"),
      backgroundColor: Colors.black,
      shadowColor: Colors.transparent,
    );
  }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    final address = ref.read(webSessionProvider).keypair?.public;

    if (address == null) {
      return const Center(
        child: Text("No Wallet"),
      );
    }
    return Center(
      child: Card(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 600),
            child: CreateStoreForm(
              accountId: accountId,
            )),
      )),
    );
  }
}
