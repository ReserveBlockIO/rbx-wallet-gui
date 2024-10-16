import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/components/buttons.dart';
import '../../../core/env.dart';
import '../../../core/theme/app_theme.dart';
import '../../../core/web_router.gr.dart';
import 'web_listing_detail.dart';
import 'web_listing_detail_tile.dart';
import '../models/web_listing.dart';
import '../providers/create_web_listing_provider.dart';
import '../providers/web_listing_list_provider.dart';

import '../../../core/base_component.dart';
import '../../../core/components/infinite_list.dart';
import '../../remote_shop/providers/shop_list_view_provider.dart';

class WebMyListingList extends BaseComponent {
  final int shopId;
  final int collectionId;
  const WebMyListingList(
    this.shopId,
    this.collectionId, {
    Key? key,
  }) : super(key: key);

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    final listProvider = ref.read(webListingListProvider("$shopId,$collectionId").notifier);
    final isExpanded = ref.watch(shopListViewProvider);

    return InfiniteList<WebListing>(
      pagingController: listProvider.pagingController,
      itemBuilder: (context, listing, index) => isExpanded ? WebListingDetails(listing: listing) : WebListingDetailsListTile(listing: listing),
      emptyText: "No Listings",
      emptyWidget: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // EmptyPlaceholder(title: "No Listings"),
            Text(
              "Now you can create listings for the NFTs you own.",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(
              height: 16,
            ),
            _CreateListingButton(
              buttonType: AppButtonType.Elevated,
              shopId: shopId,
              collectionId: collectionId,
            ),
          ],
        ),
      ),
      onRefresh: listProvider.refresh,
    );
  }
}

class _CreateListingButton extends BaseComponent {
  final int shopId;
  final int collectionId;
  final AppButtonType buttonType;
  const _CreateListingButton({
    required this.shopId,
    required this.collectionId,
    this.buttonType = AppButtonType.Elevated,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppButton(
      label: 'Create Listing',
      icon: Icons.add,
      type: buttonType,
      variant: AppColorVariant.Success,
      onPressed: () async {
        ref.read(createWebListingProvider.notifier).load(WebListing.empty(), collectionId, shopId);
        if (Env.isWeb) {
          AutoRouter.of(context).push(CreateWebListingScreenRoute(shopId: shopId, collectionId: collectionId));
        }
      },
    );
  }
}
