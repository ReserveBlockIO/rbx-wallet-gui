import 'package:flutter/material.dart';

import 'asset.dart';
import 'asset_card.dart';
import 'polling_image_preview.dart';

class AssetThumbnail extends StatelessWidget {
  final double size;
  final Asset asset;
  final String nftId;
  final String ownerAddress;
  const AssetThumbnail(
    this.asset, {
    Key? key,
    required this.nftId,
    required this.ownerAddress,
    this.size = 150.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) {
            return AssetThumbnailDialog(
              asset: asset,
              nftId: nftId,
              ownerAddress: ownerAddress,
            );
          },
        );
      },
      child: SizedBox(
        width: size,
        height: size,
        child: asset.localPath != null
            ? asset.isImage
                ? PollingImagePreview(
                    localPath: asset.localPath!,
                    expectedSize: asset.fileSize,
                  )
                : const Icon(Icons.file_present_outlined)
            : const Center(
                child: Text("Media not found."),
              ),
      ),
    );
  }
}

class AssetThumbnailDialog extends StatelessWidget {
  const AssetThumbnailDialog({
    Key? key,
    required this.asset,
    required this.nftId,
    required this.ownerAddress,
    this.onAssociate,
  }) : super(key: key);

  final Asset asset;
  final String nftId;
  final String ownerAddress;
  final Function()? onAssociate;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SizedBox(
            width: 400,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text(
                    "Close",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                AssetCard(
                  asset,
                  interactive: true,
                  nftId: nftId,
                  ownerAddress: ownerAddress,
                  onAssociate: () {
                    Navigator.of(context).pop();
                    if (onAssociate != null) {
                      onAssociate!();
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
