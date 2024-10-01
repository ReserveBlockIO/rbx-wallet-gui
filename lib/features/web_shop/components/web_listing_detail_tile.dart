
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/base_component.dart';
import '../../../core/theme/app_theme.dart';
import '../../remote_shop/providers/remote_shop_expanded_listings_provider.dart';
import 'web_listing_detail.dart';

import '../models/web_listing.dart';

class WebListingDetailsListTile extends BaseComponent {
  final WebListing listing;

  const WebListingDetailsListTile({
    super.key,
    required this.listing,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nft = listing.nft!;

    final isExpanded = ref.watch(remoteShopExpandedListingsProvider).contains(listing.id.toString());

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
                    ref.read(remoteShopExpandedListingsProvider.notifier).remove(listing.id.toString());
                  } else {
                    ref.read(remoteShopExpandedListingsProvider.notifier).add(listing.id.toString());
                  }
                },
                leading: _Thumbnail(
                  listing: listing,
                ),
              ),
            ),
          ),
        ),
        if (isExpanded) WebListingDetails(listing: listing),
      ],
    );
  }
}

class _Thumbnail extends StatefulWidget {
  final WebListing listing;
  const _Thumbnail({
    required this.listing,
  });

  @override
  State<_Thumbnail> createState() => _ThumbnailState();
}

class _ThumbnailState extends State<_Thumbnail> {
  IconData? icon;
  String? thumbnailPath;
  bool thumbnailReady = false;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 48,
      height: 48,
      child: Builder(builder: (context) {
        return CachedNetworkImage(
          imageUrl: widget.listing.thumbnails.first,
          width: 48,
          height: 48,
        );
      }),
    );
  }
}
