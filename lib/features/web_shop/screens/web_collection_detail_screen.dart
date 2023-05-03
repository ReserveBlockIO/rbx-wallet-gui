import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/app_router.gr.dart';
import 'package:rbx_wallet/core/base_screen.dart';
import 'package:rbx_wallet/core/env.dart';
import 'package:rbx_wallet/core/web_router.gr.dart';
import 'package:rbx_wallet/features/web_shop/components/web_listing_list.dart';
import 'package:rbx_wallet/features/web_shop/providers/web_collection_detail_provider.dart';

import '../../../core/components/buttons.dart';
import '../../../core/dialogs.dart';
import '../../../core/theme/app_theme.dart';
import '../../../utils/toast.dart';
import '../../web/components/web_wallet_details.dart';
import '../models/web_listing.dart';
import '../providers/create_web_listing_provider.dart';
import '../providers/web_collection_form_provider.dart';
import '../providers/web_listing_list_provider.dart';
import '../providers/web_shop_form_provider.dart';
import 'my_create_collection_container_screen.dart';

class WebCollectionDetailScreen extends BaseScreen {
  WebCollectionDetailScreen({
    super.key,
    @PathParam("shopId") required this.shopId,
    @PathParam("collectionId") required this.collectionId,
  }) : super(horizontalPadding: 0, verticalPadding: 0);

  int shopId;
  int collectionId;
  @override
  AppBar? appBar(BuildContext context, WidgetRef ref) {
    final data = ref.watch(webCollectionDetailProvider("$shopId,$collectionId"));

    return data.when(
      data: (collection) => collection != null
          ? AppBar(
              title: Text("${collection.shop?.name} > ${collection.name}"),
              centerTitle: true,
              backgroundColor: Colors.black12,
              shadowColor: Colors.transparent,
              actions: [
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
        title: const Text("loading"),
        centerTitle: true,
        backgroundColor: Colors.black12,
        shadowColor: Colors.transparent,
      ),
    );
  }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    final data = ref.watch(webCollectionDetailProvider("$shopId,$collectionId"));

    return data.when(
      data: (collection) => collection != null
          ? Column(
              children: [
                if (!collection.shop!.isOwner(ref)) WebWalletDetails(),
                Padding(
                  padding: const EdgeInsets.only(top: 15, bottom: 8),
                  child: Center(
                    child: ConstrainedBox(
                      constraints: BoxConstraints(maxWidth: 600),
                      child: Text(
                        collection.description,
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              color: Colors.white,
                            ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                Divider(),
                Expanded(
                  child: WebListingList(
                    shopId,
                    collectionId,
                    isMine: collection.shop!.isOwner(ref),
                  ),
                ),
                if (collection.shop!.isOwner(ref))
                  Container(
                    color: Colors.black,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          AppButton(
                            label: 'Delete collection',
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
                            label: "Edit Collection",
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
      loading: () => const Text("Loading"),
    );
  }
}
