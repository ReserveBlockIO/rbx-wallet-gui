import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/base_screen.dart';
import 'package:rbx_wallet/core/components/centered_loader.dart';
import 'package:rbx_wallet/core/components/empty_placeholder.dart';
import 'package:rbx_wallet/features/web_shop/components/web_listing_detail.dart';

import '../providers/web_listing_detail_provider.dart';

class WebListingDetailScreen extends BaseScreen {
  final int shopId;
  final int collectionId;
  final int listingId;

  const WebListingDetailScreen({
    super.key,
    @PathParam("shopId") required this.shopId,
    @PathParam("collectionId") required this.collectionId,
    @PathParam("listingId") required this.listingId,
  }) : super();

  @override
  AppBar? appBar(BuildContext context, WidgetRef ref) {
    final data = ref.watch(webListingDetailProvider("$shopId,$collectionId,$listingId"));
    return data.when(
      data: (listing) => listing != null
          ? AppBar(
              centerTitle: true,
              backgroundColor: Colors.black12,
              shadowColor: Colors.transparent,
              title: Text("${listing.collection.shop?.name} > ${listing.collection.name} > ${listing.nft?.name} "),
            )
          : AppBar(
              title: const Text("Error"),
            ),
      error: (_, __) => AppBar(
        title: const Text("Error"),
        backgroundColor: Colors.black12,
        shadowColor: Colors.transparent,
      ),
      loading: () => AppBar(
        title: const Text("Loading..."),
        backgroundColor: Colors.black12,
        shadowColor: Colors.transparent,
      ),
    );
  }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    final data = ref.watch(webListingDetailProvider("$shopId,$collectionId,$listingId"));

    return data.when(
      data: (listing) => listing != null ? Center(child: WebListingDetails(listing: listing)) : const Center(child: EmptyPlaceholder(title: "Error")),
      error: (_, __) => const Center(child: EmptyPlaceholder(title: "Error")),
      loading: () => const CenteredLoader(),
    );
  }
}
