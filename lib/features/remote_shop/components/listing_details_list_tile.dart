import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/base_component.dart';
import 'package:rbx_wallet/core/theme/app_theme.dart';
import 'package:rbx_wallet/features/remote_shop/components/listing_details.dart';
import 'package:rbx_wallet/features/remote_shop/models/shop_data.dart';
import 'package:rbx_wallet/features/remote_shop/providers/remote_shop_expanded_listings_provider.dart';

class ListingDetailsListTile extends BaseComponent {
  final OrganizedListing listing;

  const ListingDetailsListTile({
    super.key,
    required this.listing,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nft = listing.nft!;

    final isExpanded = ref.watch(remoteShopExpandedListingsProvider).contains(nft.id);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 16.0, left: 8, right: 8),
          child: Container(
            decoration: BoxDecoration(
              boxShadow: glowingBox,
              color: Colors.black,
            ),
            child: Card(
              margin: EdgeInsets.zero,
              color: Colors.white.withOpacity(0.03),
              child: ListTile(
                title: Text(nft.name),
                subtitle: Text(
                  nft.description,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                trailing: isExpanded ? Icon(Icons.arrow_drop_up) : Icon(Icons.arrow_drop_down),
                onTap: () {
                  if (isExpanded) {
                    ref.read(remoteShopExpandedListingsProvider.notifier).remove(nft.id);
                  } else {
                    ref.read(remoteShopExpandedListingsProvider.notifier).add(nft.id);
                  }
                },
              ),
            ),
          ),
        ),
        if (isExpanded) ListingDetails(listing: listing),
      ],
    );
  }
}
