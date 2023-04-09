import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/features/web_shop/components/web_shop_list_tile.dart';
import 'package:rbx_wallet/features/web_shop/models/web_shop.dart';

import '../../../core/base_component.dart';
import '../../../core/components/infinite_list.dart';
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

    return InfiniteList<WebShop>(
      pagingController: listProvider.pagingController,
      itemBuilder: (context, shop, index) => WebShopTile(
        shop,
      ),
      emptyText: "No Shops",
      onRefresh: listProvider.refresh,
    );
  }
}
