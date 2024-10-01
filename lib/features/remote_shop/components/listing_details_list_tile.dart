import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../core/base_component.dart';
import '../../../core/theme/components.dart';
import '../../nft/models/nft.dart';
import 'listing_details.dart';
import '../models/shop_data.dart';
import '../providers/remote_shop_expanded_listings_provider.dart';
import '../../../utils/files.dart';

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
          child: AppCard(
            padding: 0,
            margin: EdgeInsets.zero,
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
              leading: _Thumbnail(
                nft: nft,
              ),
            ),
          ),
        ),
        if (isExpanded) ListingDetails(listing: listing),
      ],
    );
  }
}

class _Thumbnail extends StatefulWidget {
  final Nft nft;
  const _Thumbnail({
    required this.nft,
  });

  @override
  State<_Thumbnail> createState() => _ThumbnailState();
}

class _ThumbnailState extends State<_Thumbnail> {
  IconData? icon;
  String? thumbnailPath;
  bool thumbnailReady = false;

  @override
  void initState() {
    super.initState();

    final filename = widget.nft.primaryAsset.name;
    final ds = Platform.isMacOS ? "/" : "\\";
    final path = "${widget.nft.thumbsPath}$ds$filename";
    final fileType = fileTypeFromPath(path);
    final extension = path.split(".").last.toLowerCase();

    setState(() {
      icon = iconFromPath(path);
    });

    if (fileType == "Image" || extension == "pdf") {
      final updatedFileName = path
          .replaceAll(".pdf", ".jpg")
          .replaceAll(".png", ".jpg")
          .replaceAll(".jpeg", ".jpg")
          .replaceAll(".gif", ".jpg")
          .replaceAll(".webp", ".jpg");

      setState(() {
        thumbnailPath = updatedFileName;
      });

      init(path);
    } else {
      setState(() {
        icon = iconFromPath(path);
      });
    }
  }

  Future<void> init(String path) async {
    final updatedFileName =
        path.replaceAll(".pdf", ".jpg").replaceAll(".png", ".jpg").replaceAll(".jpeg", ".jpg").replaceAll(".gif", ".jpg").replaceAll(".webp", ".jpg");

    final ready = checkSingleFile(updatedFileName);

    if (!ready) {
      await Future.delayed(Duration(seconds: 1));
      init(path);
    } else {
      setState(() {
        thumbnailReady = true;
      });
    }
  }

  bool checkSingleFile(String p) {
    bool ready = true;
    if (!File(p).existsSync()) {
      ready = false;
    } else {
      if (File(p).lengthSync() < 1) {
        ready = false;
      }
    }

    return ready;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 48,
      height: 48,
      child: Builder(builder: (context) {
        if (thumbnailReady && thumbnailPath != null) {
          return Image.file(
            File(thumbnailPath!),
            width: 48,
            height: 48,
          );
        }

        if (icon != null) {
          return Icon(icon);
        }

        return Icon(FontAwesomeIcons.file);
      }),
    );
  }
}
