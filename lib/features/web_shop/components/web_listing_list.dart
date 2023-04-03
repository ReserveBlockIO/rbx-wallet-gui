import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/features/web_shop/components/web_listing_detail.dart';
import 'package:rbx_wallet/features/web_shop/components/web_listing_list_tile.dart';
import 'package:rbx_wallet/features/web_shop/models/web_listing.dart';
import 'package:rbx_wallet/features/web_shop/providers/web_listing_list_provider.dart';

import '../../../core/base_component.dart';
import '../../../core/components/infinite_list.dart';

class WebListingList extends BaseComponent {
  WebListingList(this.shopId, this.collectionId, {Key? key}) : super(key: key);
  int shopId;
  int collectionId;

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    final listProvider = ref.watch(webListingListProvider("$shopId,$collectionId").notifier);

    return InfiniteList<WebListing>(
      pagingController: listProvider.pagingController,
      itemBuilder: (context, listing, index) => WebListingDetails(listing: listing),
      emptyText: "No Collections",
      onRefresh: listProvider.refresh,
    );
  }
}
