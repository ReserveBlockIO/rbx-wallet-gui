import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/theme/app_theme.dart';

import '../../../core/base_screen.dart';
import '../../../core/dialogs.dart';
import '../../../core/providers/session_provider.dart';
import '../../../core/providers/web_session_provider.dart';
import '../components/create_web_listing_form.dart';
import '../providers/create_web_listing_provider.dart';

class CreateWebListingScreen extends BaseScreen {
  final int shopId;
  final int collectionId;

  const CreateWebListingScreen({
    Key? key,
    @PathParam('shopId') required this.shopId,
    @PathParam('collectionId') required this.collectionId,
  }) : super(
          key: key,
          includeWebDrawer: true,
          horizontalPadding: 0,
          verticalPadding: 0,
        );

  @override
  AppBar? appBar(BuildContext context, WidgetRef ref) {
    final provider = ref.read(createWebListingProvider.notifier);
    final model = ref.watch(createWebListingProvider);

    return AppBar(
      backgroundColor: Colors.black,
      title: Text(model.id == 0 ? "Create Listing" : "Edit Listing"),
      leading: IconButton(
        onPressed: () async {
          final confirmed = await ConfirmDialog.show(
            title: "Are you sure you want to close the listing ${model.id != 0 ? 'editing' : 'creation'} screen?",
            body: "All unsaved changes will be lost.",
            cancelText: "Cancel",
            confirmText: "Continue",
          );

          if (confirmed == true) {
            AutoRouter.of(context).pop();
            provider.clear();
            ref.invalidate(createWebListingProvider);
          }
        },
        icon: const Icon(Icons.close),
      ),
    );
  }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    final address = kIsWeb ? ref.read(webSessionProvider).keypair?.address : ref.read(sessionProvider).currentWallet?.address;

    if (address == null) {
      return const Center(
        child: Text("No Account"),
      );
    }
    return Center(
      child: Container(
        decoration: BoxDecoration(boxShadow: glowingBox),
        child: Card(
            color: Colors.black,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 600),
                  child: CreateListingFormGroup(
                    store: shopId,
                    collection: collectionId,
                  )),
            )),
      ),
    );
  }
}
