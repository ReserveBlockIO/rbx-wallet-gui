import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/app_router.gr.dart';
import 'package:rbx_wallet/features/web_shop/models/web_listing.dart';

import '../../../core/base_component.dart';
import '../models/web_collection.dart';

class WebListingTile extends BaseComponent {
  WebListingTile(this.listing, {Key? key}) : super(key: key);
  WebListing listing;
  @override
  Widget body(BuildContext context, WidgetRef ref) {
    return Card(
      child: ListTile(
        title: Text(listing.nft.name),
        subtitle: Text(listing.nft.description),
        trailing: Icon(Icons.chevron_right_outlined),
        onTap: () {
          print("this the listing");
        },
      ),
    );
  }
}
