import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/base_screen.dart';
import '../../../core/breakpoints.dart';
import '../../../core/env.dart';
import '../../../core/providers/session_provider.dart';
import '../../../core/providers/web_session_provider.dart';
import '../../../core/web_router.gr.dart';
import '../../chat/services/web_chat_service.dart';
import '../components/web_listing_list.dart';
import '../providers/web_collection_detail_provider.dart';
import '../providers/web_listing_full_list_provider.dart';

import '../../../core/components/buttons.dart';
import '../../../core/dialogs.dart';
import '../../../core/theme/app_theme.dart';
import '../../../utils/toast.dart';
import '../../web/components/web_wallet_details.dart';
import '../models/web_listing.dart';
import '../providers/create_web_listing_provider.dart';
import '../providers/web_collection_form_provider.dart';
import '../providers/web_listing_list_provider.dart';
import 'my_create_collection_container_screen.dart';

class WebCollectionDetailScreen extends BaseScreen {
  final int shopId;
  final int collectionId;
  const WebCollectionDetailScreen({
    super.key,
    @PathParam("shopId") required this.shopId,
    @PathParam("collectionId") required this.collectionId,
  }) : super(horizontalPadding: 0, verticalPadding: 0);

  @override
  AppBar? appBar(BuildContext context, WidgetRef ref) {
    final data = ref.watch(webCollectionDetailProvider("$shopId,$collectionId"));
    final address =
        kIsWeb ? ref.watch(webSessionProvider.select((v) => v.keypair?.address)) : ref.watch(sessionProvider.select((v) => v.currentWallet?.address));

    return data.when(
      data: (collection) => collection != null
          ? AppBar(
              title: Text("${collection.shop?.name} > ${collection.name}"),
              centerTitle: true,
              backgroundColor: Colors.black12,
              shadowColor: Colors.transparent,
              leading: IconButton(
                icon: Icon(Icons.navigate_before),
                onPressed: () {
                  ref.read(webListingFullListProvider("$shopId,$collectionId").notifier).pauseTimer();
                  AutoRouter.of(context).pop();
                },
              ),
              actions: [
                if (collection.shop != null && address != null && !collection.shop!.isOwner(ref))
                  AppButton(
                    type: AppButtonType.Text,
                    variant: AppColorVariant.Light,
                    icon: Icons.chat_bubble_outline,
                    label: 'Chat',
                    onPressed: () async {
                      final thread = await WebChatService().getOrCreateThread(
                        shopUrl: collection.shop!.url,
                        buyerAddress: address,
                        isThirdParty: true,
                      );
                      if (thread == null) {
                        Toast.error("Could not create or get thread");
                        return;
                      }
                      AutoRouter.of(context).push(WebShopChatScreenRoute(identifier: thread.uuid));
                    },
                  ),
                AppButton(
                  label: "Share Collection",
                  icon: Icons.ios_share_rounded,
                  variant: AppColorVariant.Light,
                  type: AppButtonType.Text,
                  onPressed: () async {
                    await Clipboard.setData(
                        ClipboardData(text: "${Env.appBaseUrl}/#dashboard/p2p/shop/${collection.shop!.id}/collection/${collection.id}"));
                    Toast.message("Share url copied to clipboard");
                  },
                ),
                IconButton(
                    onPressed: () {
                      ref.read(webListingListProvider("$shopId,$collectionId").notifier).refresh();
                      ref.read(webListingFullListProvider("$shopId,$collectionId").notifier).reload();
                    },
                    icon: Icon(Icons.refresh)),
              ],
            )
          : AppBar(
              title: const Text("Error"),
              centerTitle: true,
              backgroundColor: Colors.black12,
              shadowColor: Colors.transparent,
            ),
      error: (_, __) => AppBar(
        title: const Text("Error"),
        centerTitle: true,
        backgroundColor: Colors.black12,
        shadowColor: Colors.transparent,
      ),
      loading: () => AppBar(
        title: const Text(""),
        centerTitle: true,
        backgroundColor: Colors.black12,
        shadowColor: Colors.transparent,
      ),
    );
  }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    final data = ref.watch(webCollectionDetailProvider("$shopId,$collectionId"));

    final isMobile = BreakPoints.useMobileLayout(context);
    return data.when(
      data: (collection) => collection != null
          ? Column(
              children: [
                if (!collection.shop!.isOwner(ref)) WebWalletDetails(),
                Divider(),
                Expanded(
                  child: WebListingListContainer(
                    shopId,
                    collectionId,
                    isMine: collection.shop!.isOwner(ref),
                  ),
                ),
                if (collection.shop!.isOwner(ref))
                  Container(
                    color: Colors.black,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 8.0,
                        top: 16.0,
                        right: 8.0,
                        bottom: 48.0,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          AppButton(
                            label: isMobile ? "Delete" : "Delete collection",
                            icon: Icons.delete,
                            variant: AppColorVariant.Danger,
                            onPressed: () async {
                              final confirmed = await ConfirmDialog.show(
                                title: "Are you sure you want to delete this collection?",
                                body: "This is permanent",
                                cancelText: "Cancel",
                                confirmText: "Delete",
                              );
                              if (confirmed == true) {
                                ref.read(webCollectionFormProvider.notifier).delete(context, collection);
                              }
                            },
                          ),
                          AppButton(
                            label: isMobile ? "Edit" : "Edit Collection",
                            icon: Icons.edit,
                            variant: AppColorVariant.Primary,
                            onPressed: () {
                              ref.read(webCollectionFormProvider.notifier).load(collection);
                              Navigator.of(context).push(MaterialPageRoute(builder: (_) => MyCreateCollectionContainerScreen()));
                            },
                          ),
                          AppButton(
                            label: "Create Listing",
                            icon: Icons.add,
                            variant: AppColorVariant.Success,
                            onPressed: () {
                              ref.read(createWebListingProvider.notifier).load(WebListing.empty(), collectionId, shopId);
                              if (Env.isWeb) {
                                AutoRouter.of(context).push(CreateWebListingScreenRoute(shopId: shopId, collectionId: collectionId));
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  )
              ],
            )
          : const Text("Error"),
      error: (_, __) => const Text("Error"),
      loading: () => const Text(""),
    );
  }
}
