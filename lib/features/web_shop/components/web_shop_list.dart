import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/app_router.gr.dart';
import 'package:rbx_wallet/core/components/buttons.dart';
import 'package:rbx_wallet/core/components/empty_placeholder.dart';
import 'package:rbx_wallet/core/web_router.gr.dart';
import 'package:rbx_wallet/features/web_shop/components/web_shop_list_tile.dart';
import 'package:rbx_wallet/features/web_shop/models/web_shop.dart';

import '../../../core/base_component.dart';
import '../../../core/components/infinite_list.dart';
import '../../../core/env.dart';
import '../../../core/theme/app_theme.dart';
import '../providers/web_shop_form_provider.dart';
import '../providers/web_shop_list_provider.dart';

class WebShopList extends BaseComponent {
  final bool mine;
  const WebShopList({
    Key? key,
    this.mine = false,
  }) : super(key: key);

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    final listProvider = ref.watch(webShopListProvider(mine ? WebShopListType.mine : WebShopListType.public).notifier);
    final model = ref.watch(webShopListProvider(mine ? WebShopListType.mine : WebShopListType.public));

    return Column(
      children: [
        Expanded(
          child: InfiniteList<WebShop>(
            pagingController: listProvider.pagingController,
            itemBuilder: (context, shop, index) => WebShopTile(
              shop,
            ),
            emptyText: "No Auction Houses",
            emptyWidget: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  EmptyPlaceholder(title: "No Auction Houses"),
                  _CreateShopButton(
                    buttonType: AppButtonType.Outlined,
                  ),
                ],
              ),
            ),
            onRefresh: listProvider.refresh,
          ),
        ),
        if (mine)
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
                  _CreateShopButton(),
                ],
              ),
            ),
          ),
      ],
    );
  }
}

class _CreateShopButton extends BaseComponent {
  final AppButtonType buttonType;
  const _CreateShopButton({
    super.key,
    this.buttonType = AppButtonType.Elevated,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppButton(
      label: 'Create Auction House',
      icon: Icons.add,
      type: buttonType,
      variant: AppColorVariant.Success,
      onPressed: () async {
        ref.read(webShopFormProvider.notifier).clear();
        if (Env.isWeb) {
          AutoRouter.of(context).push(const CreateWebShopContainerScreenRoute());
        } else {
          AutoRouter.of(context).push(const DebugWebShopCreateScreenRoute());
        }
      },
    );
  }
}
