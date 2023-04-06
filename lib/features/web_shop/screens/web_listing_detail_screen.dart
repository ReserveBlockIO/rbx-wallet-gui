import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/base_screen.dart';
import 'package:rbx_wallet/features/web_shop/components/web_listing_detail.dart';
import 'package:rbx_wallet/features/web_shop/components/web_listing_list.dart';
import 'package:rbx_wallet/features/web_shop/providers/web_collection_detail_provider.dart';

import '../providers/web_listing_detail_provider.dart';

class WebListingDetailScreen extends BaseScreen {
  WebListingDetailScreen({
    super.key,
    @PathParam("shopId") required this.shopId,
    @PathParam("collectionId") required this.collectionId,
    @PathParam("listingId") required this.listingId,
  }) : super(
          backgroundColor: const Color(0xFF010715),
        );
  int shopId;
  int collectionId;
  int listingId;
  @override
  AppBar? appBar(BuildContext context, WidgetRef ref) {
    final data = ref.watch(webListingDetailProvider("$shopId,$collectionId,$listingId"));
    return data.when(
      data: (listing) => listing != null
          ? AppBar(
              centerTitle: true,
              backgroundColor: Colors.black12,
              shadowColor: Colors.transparent,
            )
          : AppBar(
              title: const Text("Error"),
            ),
      error: (_, __) => AppBar(
        title: const Text("Error"),
      ),
      loading: () => AppBar(
        title: const Text("loading"),
      ),
    );
  }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    final data = ref.watch(webListingDetailProvider("$shopId,$collectionId,$listingId"));

    return data.when(
      data: (listing) => listing != null ? Center(child: WebListingDetails(listing: listing)) : const Text("Error"),
      error: (_, __) => const Text("Error"),
      loading: () => const Text("Loading"),
    );
  }
}