import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/app_constants.dart';
import '../../../core/app_router.gr.dart';
import '../../../core/base_screen.dart';
import '../../../core/components/buttons.dart';
import '../../../core/env.dart';
import '../../../core/providers/session_provider.dart';
import '../../../core/providers/web_session_provider.dart';
import '../../../core/web_router.gr.dart' as web_router;
import '../../chat/services/web_chat_service.dart';
import '../../global_loader/global_loading_provider.dart';
import '../components/web_collection_list.dart';
import '../components/web_my_collection_list.dart';
import '../providers/web_collection_form_provider.dart';
import '../providers/web_shop_form_provider.dart';
import 'my_create_collection_container_screen.dart';
import '../services/web_shop_service.dart';
import '../utils/shop_publishing.dart';

import '../../../core/breakpoints.dart';
import '../../../core/dialogs.dart';
import '../../../core/theme/app_theme.dart';
import '../../../utils/toast.dart';
import '../providers/web_collection_list_provider.dart';
import '../providers/web_collection_full_list_provider.dart';
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
    final address =
        kIsWeb ? ref.watch(webSessionProvider.select((v) => v.keypair?.address)) : ref.watch(sessionProvider.select((v) => v.currentWallet?.address));

    return data.when(
      data: (shop) => shop != null
          ? AppBar(
              title: Text(shop.name),
              centerTitle: true,
              backgroundColor: Colors.black12,
              shadowColor: Colors.transparent,
              leading: IconButton(
                icon: Icon(
                  Icons.navigate_before,
                  size: 32,
                ),
                onPressed: () {
                  ref.read(webCollectionFullListProvider(shopId).notifier).pauseTimer();
                  AutoRouter.of(context).pop();
                },
              ),
              actions: [
                if (address != null)
                  AppButton(
                    type: AppButtonType.Text,
                    variant: AppColorVariant.Light,
                    icon: Icons.chat_bubble_outline,
                    label: 'Chat',
                    onPressed: () async {
                      if (shop.isOwner(ref)) {
                        AutoRouter.of(context).push(web_router.WebSellerChatThreadListScreenRoute(shopId: shop.id));
                      } else {
                        final thread = await WebChatService().getOrCreateThread(
                          shopUrl: shop.url,
                          buyerAddress: address,
                          isThirdParty: true,
                        );
                        if (thread == null) {
                          Toast.error("Could not create or get thread");
                          return;
                        }

                        if (kIsWeb) {
                          AutoRouter.of(context).push(web_router.WebShopChatScreenRoute(identifier: thread.uuid));
                        } else {
                          AutoRouter.of(context).push(WebShopChatScreenRoute(identifier: thread.uuid));
                        }
                      }
                    },
                  ),
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
                      ref.read(webCollectionListProvider(shopId).notifier).refresh();
                      ref.read(webCollectionFullListProvider(shopId).notifier).reload();
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
    final isMobile = BreakPoints.useMobileLayout(context);

    return data.when(
      data: (shop) => shop != null
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Poller(
                //   callOnInit: false,
                //   pollFunction: () {
                //     ref.read(webCollectionListProvider(shopId).notifier).refresh();
                //   },
                // ),
                Center(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: 600),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        shop.description,
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              color: Colors.white,
                            ),
                        textAlign: TextAlign.center,
                      ),
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
                                  body: "There is a cost of $SHOP_PUBLISH_COST VFX to publish your shop to the network (plus the transaction fee).",
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
                  child: shop.isOwner(ref)
                      ? WebMyCollectionList(
                          shop.id,
                        )
                      : WebCollectionListContainer(
                          shop.id,
                        ),
                ),
                if (shop.isOwner(ref) && ref.read(webSessionProvider).keypair != null)
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
                            label: isMobile ? 'Delete' : 'Delete shop',
                            icon: Icons.delete,
                            variant: AppColorVariant.Danger,
                            onPressed: () async {
                              final message = shop.isPublished
                                  ? "Are you sure you want to delete this shop? There is a cost of $SHOP_DELETE_COST VFX to delete this from the network."
                                  : "Are you sure you want to delete this shop?";

                              final confirmed = await ConfirmDialog.show(
                                title: "Delete shop?",
                                body: message,
                                cancelText: "Cancel",
                                confirmText: "Delete",
                              );

                              if (confirmed == true) {
                                bool success = true;
                                if (shop.isPublished) {
                                  ref.read(globalLoadingProvider.notifier).start();
                                  success = await broadcastShopTx(ref.read(webSessionProvider).keypair!, shop, ShopPublishTxType.delete);
                                }

                                if (success) {
                                  ref.read(webShopFormProvider.notifier).delete(context, shop);
                                  AutoRouter.of(context).pop();
                                }
                                ref.read(globalLoadingProvider.notifier).complete();
                              }
                            },
                          ),
                          AppButton(
                            label: isMobile ? "Edit" : "Edit Auction House",
                            icon: Icons.edit,
                            variant: AppColorVariant.Light,
                            onPressed: () {
                              ref.read(webShopFormProvider.notifier).load(shop);
                              if (Env.isWeb) {
                                AutoRouter.of(context).push(web_router.CreateWebShopContainerScreenRoute());
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
