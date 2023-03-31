import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/features/web_shop/components/web_collection_list_tile.dart';

import '../../../core/base_component.dart';
import '../../../core/components/infinite_list.dart';
import '../models/web_collection.dart';
import '../providers/web_collection_list_provider.dart';

class WebCollectionList extends BaseComponent {
  WebCollectionList(this.shopId, {Key? key}) : super(key: key);
  int shopId;

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    final listProvider = ref.watch(webCollectionListProvider(shopId).notifier);

    return InfiniteList<WebCollection>(
      pagingController: listProvider.pagingController,
      itemBuilder: (context, collection, index) => WebCollectionTile(
        collection,
      ),
      emptyText: "No Collections",
      onRefresh: listProvider.refresh,
    );
  }
}
