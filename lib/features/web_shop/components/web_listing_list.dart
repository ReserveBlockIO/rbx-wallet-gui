import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/app_router.gr.dart';
import 'package:rbx_wallet/core/breakpoints.dart';
import 'package:rbx_wallet/core/components/buttons.dart';
import 'package:rbx_wallet/core/components/empty_placeholder.dart';
import 'package:rbx_wallet/core/env.dart';
import 'package:rbx_wallet/core/theme/app_theme.dart';
import 'package:rbx_wallet/core/web_router.gr.dart';
import 'package:rbx_wallet/features/web_shop/components/web_listing_detail.dart';
import 'package:rbx_wallet/features/web_shop/components/web_listing_detail_tile.dart';
import 'package:rbx_wallet/features/web_shop/components/web_listing_list_tile.dart';
import 'package:rbx_wallet/features/web_shop/models/web_listing.dart';
import 'package:rbx_wallet/features/web_shop/providers/create_web_listing_provider.dart';
import 'package:rbx_wallet/features/web_shop/providers/web_collection_list_provider.dart';
import 'package:rbx_wallet/features/web_shop/providers/web_listing_list_provider.dart';
import 'package:rbx_wallet/features/web_shop/providers/web_shop_detail_provider.dart';

import '../../../core/base_component.dart';
import '../../../core/components/infinite_list.dart';
import '../../remote_shop/providers/shop_list_view_provider.dart';

class WebListingList extends BaseComponent {
  final int shopId;
  final int collectionId;
  final bool isMine;
  const WebListingList(
    this.shopId,
    this.collectionId, {
    Key? key,
    this.isMine = false,
  }) : super(key: key);

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    final listProvider = ref.watch(webListingListProvider("$shopId,$collectionId").notifier);
    final isExpanded = ref.watch(shopListViewProvider);
    final listModeProvider = ref.read(shopListViewProvider.notifier);
    final isMobile = BreakPoints.useMobileLayout(context);

    return InfiniteList<WebListing>(
      pagingController: listProvider.pagingController,
      itemBuilder: (context, listing, index) {
        return Column(
          children: [
            if (index == 0)
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 15, bottom: 8),
                      child: ConstrainedBox(
                        constraints: BoxConstraints(maxWidth: 600),
                        child: Text(
                          listing.collection.description,
                          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                                color: Colors.white,
                              ),
                          textAlign: !isMobile ? TextAlign.center : TextAlign.left,
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      IconButton(
                        onPressed: () {
                          listModeProvider.setExpanded();
                        },
                        icon: Icon(
                          Icons.grid_on,
                          color: isExpanded ? Colors.white : Colors.white38,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          listModeProvider.setCondensed();
                        },
                        icon: Icon(
                          Icons.list_outlined,
                          color: !isExpanded ? Colors.white : Colors.white38,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            isExpanded ? WebListingDetails(listing: listing) : WebListingDetailsListTile(listing: listing),
          ],
        );
      },
      emptyText: "No Listings",
      emptyWidget: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            EmptyPlaceholder(title: "No Listings"),
            if (isMine)
              _CreateListingButton(
                buttonType: AppButtonType.Outlined,
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
    super.key,
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
