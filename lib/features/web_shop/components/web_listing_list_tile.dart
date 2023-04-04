import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/app_router.gr.dart';
import 'package:rbx_wallet/core/env.dart';
import 'package:rbx_wallet/features/web_shop/models/web_listing.dart';

import '../../../core/base_component.dart';
import '../../../core/web_router.gr.dart';

class WebListingTile extends BaseComponent {
  WebListingTile(this.listing, {Key? key}) : super(key: key);
  WebListing listing;
  @override
  Widget body(BuildContext context, WidgetRef ref) {
    return Card(
      color: Theme.of(context).colorScheme.primary.withOpacity(0.5),
      child: ListTile(
        title: Text(listing.nft.name),
        subtitle: Text(listing.nft.description),
        trailing: Icon(Icons.chevron_right_outlined),
        onTap: () {
          if (Env.isWeb) {
            AutoRouter.of(context).push(WebListingDetailScreenRoute(
              shopId: listing.collection.shop.id,
              collectionId: listing.collection.id,
              listingId: listing.id,
            ));
          } else {
            AutoRouter.of(context).push(DebugWebListingDetailScreenRoute(
              shopId: listing.collection.shop.id,
              collectionId: listing.collection.id,
              listingId: listing.id,
            ));
          }
        },
      ),
    );
  }
}
