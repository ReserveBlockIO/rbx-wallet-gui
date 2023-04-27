import 'package:flutter/material.dart';
import 'package:rbx_wallet/features/asset/web_asset.dart';

import 'web_asset_card.dart';

class WebAssetThumbnail extends StatelessWidget {
  final double size;
  final WebAsset? asset;
  const WebAssetThumbnail(
    this.asset, {
    Key? key,
    this.size = 150.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (asset == null) return const SizedBox();
    return InkWell(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) {
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
                        WebAssetCard(asset),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
      child: SizedBox(
        width: size,
        height: size + 12,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: size,
              height: size,
              child: asset!.isImage
                  ? Image.network(
                      asset!.location,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    )
                  : Icon(asset!.icon),
            ),
            Text(
              asset!.filename,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 10),
              overflow: TextOverflow.ellipsis,
            )
          ],
        ),
      ),
    );
  }
}
