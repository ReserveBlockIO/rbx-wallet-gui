import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/breakpoints.dart';
import 'package:rbx_wallet/core/components/buttons.dart';
import 'package:rbx_wallet/core/components/empty_placeholder.dart';
import 'package:rbx_wallet/core/env.dart';
import 'package:rbx_wallet/core/theme/app_theme.dart';
import 'package:rbx_wallet/core/web_router.gr.dart';
import 'package:rbx_wallet/features/web_shop/components/web_listing_detail.dart';
import 'package:rbx_wallet/features/web_shop/components/web_listing_detail_tile.dart';
import 'package:rbx_wallet/features/web_shop/models/web_listing.dart';
import 'package:rbx_wallet/features/web_shop/providers/create_web_listing_provider.dart';
import 'package:rbx_wallet/features/web_shop/providers/web_listing_full_list_provider.dart';

import '../../../core/base_component.dart';
import '../../remote_shop/providers/shop_list_view_provider.dart';

class WebListingListContainer extends ConsumerStatefulWidget {
  final int shopId;
  final int collectionId;

  const WebListingListContainer(
    this.shopId,
    this.collectionId, {
    Key? key,
  }) : super(key: key);

  @override
  _WebListingListContainerState createState() => _WebListingListContainerState();
}

class _WebListingListContainerState extends ConsumerState<WebListingListContainer> {
  late final int shopId;
  late final int collectionId;

  @override
  void initState() {
    shopId = widget.shopId;
    collectionId = widget.collectionId;
    super.initState();

    ref.read(webListingFullListProvider("$shopId,$collectionId").notifier).init();
  }

  @override
  Widget build(BuildContext context) {
    return WebListingList(
      widget.shopId,
      widget.collectionId,
    );
  }
}

class WebListingList extends BaseComponent {
  final int shopId;
  final int collectionId;
  const WebListingList(
    this.shopId,
    this.collectionId, {
    Key? key,
  }) : super(key: key);

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    // final listProvider = ref.read(webListingListProvider("$shopId,$collectionId").notifier);
    final isExpanded = ref.watch(shopListViewProvider);
    final listModeProvider = ref.read(shopListViewProvider.notifier);
    final isMobile = BreakPoints.useMobileLayout(context);

    final listings = ref.watch(webListingFullListProvider("$shopId,$collectionId"));

    if (listings.isEmpty) {
      return SizedBox();
    }

    return ListView.builder(
        itemCount: listings.length,
        itemBuilder: (context, index) {
          final listing = listings[index];

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
        });
  }
}
