import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/app_constants.dart';
import 'package:rbx_wallet/core/app_router.gr.dart';
import 'package:rbx_wallet/core/base_screen.dart';
import 'package:rbx_wallet/core/components/buttons.dart';
import 'package:rbx_wallet/core/env.dart';
import 'package:rbx_wallet/core/providers/web_session_provider.dart';
import 'package:rbx_wallet/core/web_router.gr.dart';
import 'package:rbx_wallet/features/raw/raw_service.dart';
import 'package:rbx_wallet/features/web/utils/raw_transaction.dart';
import 'package:rbx_wallet/features/web_shop/components/web_collection_list.dart';
import 'package:rbx_wallet/features/web_shop/providers/web_collection_form_provider.dart';
import 'package:rbx_wallet/features/web_shop/providers/web_shop_form_provider.dart';
import 'package:rbx_wallet/features/web_shop/screens/my_create_collection_container_screen.dart';
import 'package:rbx_wallet/features/web_shop/services/web_shop_service.dart';
import 'package:rbx_wallet/features/web_shop/utils/shop_publishing.dart';

import '../../../core/dialogs.dart';
import '../../../core/theme/app_theme.dart';
import '../../../utils/toast.dart';
import '../providers/web_collection_list_provider.dart';
import '../providers/web_shop_detail_provider.dart';
import '../../../core/components/badges.dart';

class WebShopDetailScreen extends BaseScreen {
  WebShopDetailScreen({super.key, @PathParam("shopId") required this.shopId})
      : super(
          verticalPadding: 0,
          horizontalPadding: 0,
        );
  int shopId;
  @override
  AppBar? appBar(BuildContext context, WidgetRef ref) {
    final data = ref.watch(webShopDetailProvider(shopId));

    return data.when(
      data: (shop) => shop != null
          ? AppBar(
              title: Text(shop.name),
              centerTitle: true,
              backgroundColor: Colors.black12,
              shadowColor: Colors.transparent,
              actions: [
                AppButton(
                  label: "Share Shop",
                  icon: Icons.ios_share_rounded,
                  variant: AppColorVariant.Light,
                  type: AppButtonType.Text,
                  onPressed: () async {
                    await Clipboard.setData(ClipboardData(text: "${Env.appBaseUrl}/#dashboard/p2p/shop/${shop.id}"));
                    Toast.message("Share url copied to clipboard");
                  },
                ),
                IconButton(
                    onPressed: () {
                      ref.invalidate(webShopDetailProvider(shopId));
                      ref.watch(webCollectionListProvider(shopId).notifier).refresh();
                    },
                    icon: Icon(Icons.refresh))
              ],
            )
          : AppBar(
              centerTitle: true,
              backgroundColor: Colors.black12,
              shadowColor: Colors.transparent,
              title: const Text("Error"),
            ),
      error: (_, __) => AppBar(
        centerTitle: true,
        backgroundColor: Colors.black12,
        shadowColor: Colors.transparent,
        title: const Text("Error"),
      ),
      loading: () => AppBar(
        centerTitle: true,
        backgroundColor: Colors.black12,
        shadowColor: Colors.transparent,
        title: const Text(""),
      ),
    );
  }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    final data = ref.watch(webShopDetailProvider(shopId));

    return data.when(
      data: (shop) => shop != null
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: 600),
                    child: Text(
                      shop.description,
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: Colors.white,
                          ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Collections",
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                      ),
                      if (shop.isOwner(ref) && ref.read(webSessionProvider).keypair != null)
                        Builder(
                          builder: (context) {
                            if (shop.isPublished) {
                              return AppBadge(
                                label: "Published",
                                variant: AppColorVariant.Success,
                              );
                            }

                            return AppButton(
                              label: "Publish Shop",
                              onPressed: () async {
                                final confirmed = await ConfirmDialog.show(
                                  title: "Publish Shop?",
                                  body: "There is a cost of $SHOP_PUBLISH_COST RBX to publish your shop to the network (plus the transaction fee).",
                                  confirmText: "Publish",
                                  cancelText: "Cancel",
                                );

                                if (confirmed == true) {
                                  final success = await broadcastShopTx(ref.read(webSessionProvider).keypair!, shop, ShopPublishTxType.create);
                                  if (success) {
                                    final updatedShop = await WebShopService().saveWebShop(shop.copyWith(isPublished: true));
                                    if (updatedShop != null) {
                                      ref.invalidate(webShopDetailProvider(shop.id));
                                    }
                                  }
                                }
                              },
                            );
                          },
                        )
                    ],
                  ),
                ),
                Expanded(
                  child: WebCollectionList(shop.id),
                ),
                if (shop.isOwner(ref) && ref.read(webSessionProvider).keypair != null)
                  Container(
                    color: Colors.black,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          AppButton(
                            label: 'Delete shop',
                            icon: Icons.delete,
                            variant: AppColorVariant.Danger,
                            onPressed: () async {
                              final message = shop.isPublished
                                  ? "Are you sure you want to delete this shop? There is a cost of $SHOP_DELETE_COST RBX to delete this from the network."
                                  : "Are you sure you want to delete this shop?";

                              final confirmed = await ConfirmDialog.show(
                                title: "Delete shop?",
                                body: message,
                                cancelText: "Cancel",
                                confirmText: "Delete",
                              );

                              if (confirmed == true) {
                                final success = await broadcastShopTx(ref.read(webSessionProvider).keypair!, shop, ShopPublishTxType.delete);

                                if (success) {
                                  ref.read(webShopFormProvider.notifier).delete(context, shop);
                                }
                              }
                            },
                          ),
                          AppButton(
                            label: "Edit Shop",
                            icon: Icons.edit,
                            variant: AppColorVariant.Primary,
                            onPressed: () {
                              ref.read(webShopFormProvider.notifier).load(shop);
                              if (Env.isWeb) {
                                AutoRouter.of(context).push(CreateWebShopContainerScreenRoute());
                              } else {
                                AutoRouter.of(context).push(DebugWebShopCreateScreenRoute());
                              }
                            },
                          ),
                          AppButton(
                            label: "Create Collection",
                            icon: Icons.add,
                            variant: AppColorVariant.Success,
                            onPressed: () {
                              ref.read(webCollectionFormProvider.notifier).clear(shop);
                              Navigator.of(context).push(MaterialPageRoute(builder: (_) => MyCreateCollectionContainerScreen()));
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
