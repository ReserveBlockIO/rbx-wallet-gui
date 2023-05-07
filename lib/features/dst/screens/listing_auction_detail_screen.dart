import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/base_screen.dart';
import '../../../core/components/centered_loader.dart';
import '../components/auction_activity.dart';
import '../providers/seller_bid_list_provider.dart';

import '../providers/listing_detail_provider.dart';

class ListingAuctionDetailScreen extends BaseScreen {
  final int listingId;
  const ListingAuctionDetailScreen({
    Key? key,
    @PathParam("listingId") required this.listingId,
  }) : super(key: key, verticalPadding: 0, horizontalPadding: 0);

  @override
  AppBar? appBar(BuildContext context, WidgetRef ref) {
    final data = ref.watch(listingDetailProvider(listingId));

    return data.when(
      loading: () => null,
      error: (_, __) => null,
      data: (listing) {
        if (listing == null) {
          return null;
        }
        return AppBar(
          title: Text(
            "Auction Activity for ${listing.nft != null ? listing.nft!.name : listing.smartContractUid}",
          ),
          backgroundColor: Colors.black,
          actions: [
            IconButton(
                onPressed: () {
                  final identifier = "${listing.collectionId}_${listing.id}";
                  ref.read(sellerBidListProvider(identifier).notifier).fetchBids();
                },
                icon: Icon(Icons.refresh))
          ],
        );
      },
    );
  }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    final data = ref.watch(listingDetailProvider(listingId));

    return data.when(
      loading: () => CenteredLoader(),
      error: (_, __) => Center(child: Text("An error occurred.")),
      data: (listing) {
        if (listing == null) {
          return Center(child: Text("Error"));
        }
        return AuctionActivity(listing);
      },
    );
  }
}
