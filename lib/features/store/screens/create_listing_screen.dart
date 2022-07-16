import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/base_screen.dart';
import 'package:rbx_wallet/core/providers/web_session_provider.dart';
import 'package:rbx_wallet/features/store/components/create_listing_form.dart';

class CreateListingScreen extends BaseScreen {
  final int storeId;

  const CreateListingScreen({Key? key, @PathParam('storeId') required this.storeId})
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
      title: const Text("Create Listing"),
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
        child: ConstrainedBox(constraints: BoxConstraints(maxWidth: 600), child: CreateListingForm(storeId: storeId)),
      )),
    );
  }
}
