import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/app_constants.dart';
import 'package:rbx_wallet/core/app_router.gr.dart';
import 'package:rbx_wallet/core/base_component.dart';
import 'package:rbx_wallet/core/base_screen.dart';
import 'package:rbx_wallet/core/components/buttons.dart';
import 'package:rbx_wallet/core/components/centered_loader.dart';
import 'package:rbx_wallet/core/dialogs.dart';
import 'package:rbx_wallet/core/providers/session_provider.dart';
import 'package:rbx_wallet/core/theme/app_theme.dart';
import 'package:rbx_wallet/features/bridge/providers/wallet_info_provider.dart';
import 'package:rbx_wallet/features/dst/components/publish_shop_button.dart';
import 'package:rbx_wallet/features/dst/components/shop_online_button.dart';
import 'package:rbx_wallet/features/dst/components/collection_list.dart';
import 'package:rbx_wallet/features/dst/providers/collection_form_provider.dart';
import 'package:rbx_wallet/features/dst/providers/collection_list_provider.dart';
import 'package:rbx_wallet/features/dst/services/dst_service.dart';
import 'package:rbx_wallet/features/dsts_legacy/providers/my_store_listings_provider.dart';
import 'package:rbx_wallet/features/global_loader/global_loading_provider.dart';
import 'package:rbx_wallet/utils/toast.dart';

import '../providers/dec_shop_form_provider.dart';
import '../providers/dec_shop_provider.dart';

class MyCollectionsListScreen extends BaseScreen {
  const MyCollectionsListScreen({Key? key}) : super(key: key, verticalPadding: 0, horizontalPadding: 0);

  @override
  AppBar? appBar(BuildContext context, WidgetRef ref) {
    return AppBar(
      title: Text("My Auction House"),
      actions: [
        AppButton(
          type: AppButtonType.Text,
          variant: AppColorVariant.Light,
          icon: Icons.chat_bubble_outline,
          label: 'Chat',
          onPressed: () {
            AutoRouter.of(context).push(SellerChatThreadListScreenRoute());
          },
        ),
      ],
    );
  }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    final collections = ref.watch(collectionListProvider);

    return Column(
      children: [
        Builder(
          builder: (context) {
            final data = ref.watch(decShopProvider);

            return data.when(
              error: (_, __) => SizedBox(),
              loading: () => SizedBox(),
              data: (shop) {
                if (shop == null) {
                  return SizedBox();
                }

                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        shop.name,
                        style: Theme.of(context).textTheme.headlineMedium!.copyWith(color: Colors.white),
                      ),
                      // SizedBox(
                      //   height: 4,
                      // ),
                      // Text(
                      //   shop.description,
                      //   maxLines: 3,
                      //   overflow: TextOverflow.ellipsis,
                      // ),
                      SizedBox(
                        height: 12,
                      ),
                      Container(
                        decoration: BoxDecoration(color: Colors.black38, borderRadius: BorderRadius.circular(4.0)),
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 10,
                            right: 10,
                            top: 8,
                            bottom: 8,
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "URL: ${shop.url}",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              // SizedBox(
                              //   width: 6,
                              // ),
                              // AppButton(
                              //   label: "Copy Shop URL",
                              //   icon: Icons.copy,
                              //   type: AppButtonType.Outlined,
                              //   variant: AppColorVariant.Light,
                              //   onPressed: () async {
                              //     await Clipboard.setData(ClipboardData(text: shop.url));
                              //     Toast.message("URL copied to clipboard");
                              //   },
                              // ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 8),
                      AppButton(
                        label: "Copy Shop URL",
                        icon: Icons.copy,
                        type: AppButtonType.Outlined,
                        variant: AppColorVariant.Light,
                        onPressed: () async {
                          await Clipboard.setData(ClipboardData(text: shop.url));
                          Toast.message("Shop URL copied to clipboard");
                        },
                      ),
                      SizedBox(height: 16),

                      Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          if (shop.isPublished) ShopOnlineButton(),
                          AppButton(
                            variant: AppColorVariant.Primary,
                            label: "Edit Details",
                            icon: Icons.edit,
                            onPressed: () {
                              ref.read(decShopFormProvider.notifier).load(shop);
                              AutoRouter.of(context).push(const CreateDecShopContainerScreenRoute());
                            },
                          ),
                          DecPublishShopButton(),
                          if (!shop.isPublished)
                            AppButton(
                              variant: AppColorVariant.Danger,
                              label: "Delete Shop",
                              icon: Icons.delete,
                              onPressed: () async {
                                final confirmed = await ConfirmDialog.show(
                                  title: "Delete Shop",
                                  body: "Are you sure you want to delete your unpublished shop?",
                                  destructive: true,
                                  confirmText: "Delete",
                                  cancelText: "Cancel",
                                );

                                if (confirmed == true) {
                                  final success = await DstService().deleteShopLocally();
                                  if (success) {
                                    ref.invalidate(decShopProvider);
                                    Toast.message("Shop Deleted");
                                  }
                                }
                              },
                            ),
                          if (shop.isPublished)
                            AppButton(
                              variant: AppColorVariant.Danger,
                              label: "Delete Shop",
                              icon: Icons.delete,
                              onPressed: () async {
                                final confirmed = await ConfirmDialog.show(
                                  title: "Delete Shop",
                                  body:
                                      "Are you sure you want to delete this shop from the network? There is a cost of 1 RBX plus TX fee to perform this operation.",
                                  destructive: true,
                                  confirmText: "Delete",
                                  cancelText: "Cancel",
                                );

                                if (confirmed == true) {
                                  final successRemote = await DstService().deleteShop();
                                  if (successRemote) {
                                    Toast.message("Delete TX broadcasted. Deleting locally now.");

                                    final success = await DstService().deleteShopLocally();
                                    if (success) {
                                      ref.invalidate(decShopProvider);
                                      ref.invalidate(collectionListProvider);
                                      Toast.message("Shop Deleted");
                                      // Navigator.of(context).pop();
                                      // ref.read(globalLoadingProvider.notifier).start();
                                      // ref.read(sessionProvider.notifier).restartCli();
                                      // ref.read(globalLoadingProvider.notifier).complete();
                                    }
                                  }
                                }
                              },
                            ),
                        ],
                      ),
                      Divider(),
                    ],
                  ),
                );
              },
            );
          },
        ),
        if (collections.isEmpty)
          Builder(builder: (context) {
            final data = ref.watch(decShopProvider);

            return data.when(
              loading: () => CenteredLoader(),
              error: (_, __) => Text(""),
              data: (shop) {
                return Expanded(
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (shop == null) ...[
                          Text(
                            "First, setup your shop.\nThen you'll be able to create collections and add listings to them.",
                            style: TextStyle(
                              fontSize: 18,
                              height: 1.5,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            height: 32,
                          )
                        ],
                        if (shop != null && shop.isPublished && collections.isEmpty) ...[
                          Text(
                            "Now you can create a collections and then add listings to them.",
                            style: TextStyle(
                              fontSize: 18,
                              height: 1.5,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            height: 32,
                          )
                        ],
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            DecShopButton(),
                            if (shop != null && shop.isPublished)
                              AppButton(
                                label: 'Create New Collection',
                                icon: Icons.add,
                                variant: AppColorVariant.Success,
                                onPressed: () async {
                                  ref.read(storeFormProvider.notifier).clear();
                                  AutoRouter.of(context).push(const CreateCollectionContainerScreenRoute());
                                },
                              )
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }),
        if (collections.isNotEmpty)
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: CollectionList(),
            ),
          ),
        if (collections.isNotEmpty)
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Color(0xFF040f26),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  DecShopButton(),
                  AppButton(
                    label: 'Create New Collection',
                    icon: Icons.add,
                    variant: AppColorVariant.Success,
                    onPressed: () async {
                      ref.read(storeFormProvider.notifier).clear();
                      AutoRouter.of(context).push(const CreateCollectionContainerScreenRoute());
                    },
                  )
                ],
              ),
            ),
          ),
      ],
    );
  }
}

class DecShopButton extends BaseComponent {
  const DecShopButton({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(decShopProvider);

    return data.when(
      loading: () => SizedBox(),
      error: (_, __) => SizedBox(),
      data: (shop) {
        if (shop == null) {
          return AppButton(
            label: 'Setup Auction House',
            icon: Icons.store,
            variant: AppColorVariant.Light,
            onPressed: () async {
              ref.read(decShopFormProvider.notifier).clear();
              AutoRouter.of(context).push(const CreateDecShopContainerScreenRoute());
            },
          );
        }

        return AppButton(
          label: 'Edit Auction House',
          icon: Icons.store,
          variant: AppColorVariant.Light,
          onPressed: () async {
            ref.read(decShopFormProvider.notifier).load(shop);
            AutoRouter.of(context).push(const CreateDecShopContainerScreenRoute());
          },
        );
      },
    );
  }
}
