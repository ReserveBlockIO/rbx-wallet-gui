import 'package:flutter/material.dart';
import '../../core/theme/app_theme.dart';

import 'asset.dart';
import 'asset_card.dart';
import 'polling_image_preview.dart';

class AssetThumbnail extends StatelessWidget {
  final double size;
  final Asset asset;
  final String nftId;
  final String ownerAddress;
  final bool isPrimaryAsset;
  const AssetThumbnail(
    this.asset, {
    Key? key,
    required this.nftId,
    required this.ownerAddress,
    this.size = 150.0,
    required this.isPrimaryAsset,
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
              isPrimaryAsset: isPrimaryAsset,
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
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(asset.icon),
                      SizedBox(height: 4),
                      SizedBox(
                        height: 30,
                        child: Text(
                          asset.fileName,
                          style: TextStyle(fontSize: 12, height: 1.2),
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  )
            : Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(asset.icon),
                    SizedBox(height: 4),
                    SizedBox(
                      height: 30,
                      child: Text(
                        asset.fileName,
                        style: TextStyle(fontSize: 12, height: 1.2),
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
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
    required this.isPrimaryAsset,
  }) : super(key: key);

  final Asset asset;
  final String nftId;
  final String ownerAddress;
  final Function()? onAssociate;
  final bool isPrimaryAsset;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          boxShadow: glowingBox,
        ),
        child: Card(
          margin: EdgeInsets.zero,
          color: Colors.black,
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
                    isPrimaryAsset: isPrimaryAsset,
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
      ),
    );
  }
}
