import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/app_router.gr.dart';
import 'package:rbx_wallet/core/base_component.dart';
import 'package:rbx_wallet/core/base_screen.dart';
import 'package:rbx_wallet/core/components/buttons.dart';
import 'package:rbx_wallet/core/dialogs.dart';
import 'package:rbx_wallet/core/theme/app_theme.dart';
import 'package:rbx_wallet/features/dst/components/publish_shop_button.dart';
import 'package:rbx_wallet/features/dst/components/shop_online_button.dart';
import 'package:rbx_wallet/features/dst/components/store_list.dart';
import 'package:rbx_wallet/features/dst/providers/collection_form_provider.dart';
import 'package:rbx_wallet/features/dst/providers/collection_list_provider.dart';
import 'package:rbx_wallet/features/dst/services/dst_service.dart';
import 'package:rbx_wallet/features/dsts_legacy/providers/my_store_listings_provider.dart';
import 'package:rbx_wallet/utils/toast.dart';

import '../providers/dec_shop_form_provider.dart';
import '../providers/dec_shop_provider.dart';

class MyCollectionsListScreen extends BaseScreen {
  const MyCollectionsListScreen({Key? key}) : super(key: key, verticalPadding: 0, horizontalPadding: 0);

  @override
  AppBar? appBar(BuildContext context, WidgetRef ref) {
    return AppBar(
      title: Text("My Auction House"),
    );
  }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    final collections = ref.watch(storeListProvider);

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
                              SizedBox(
                                width: 6,
                              ),
                              InkWell(
                                onTap: () async {
                                  await Clipboard.setData(ClipboardData(text: shop.url));
                                  Toast.message("URL copied to clipboard");
                                },
                                child: Icon(
                                  Icons.copy,
                                  size: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
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
          Expanded(
            child: Center(
              child: AppButton(
                label: 'Create Collection',
                icon: Icons.add,
                variant: AppColorVariant.Success,
                onPressed: () async {
                  ref.read(storeFormProvider.notifier).clear();
                  AutoRouter.of(context).push(const CreateCollectionContainerScreenRoute());
                },
              ),
            ),
          ),
        if (collections.isNotEmpty)
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: CollectionList(),
            ),
          ),
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
                  label: 'Create Collection',
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
