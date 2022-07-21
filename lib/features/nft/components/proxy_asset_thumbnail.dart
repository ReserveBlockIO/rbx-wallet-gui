import 'package:flutter/material.dart';
import 'package:rbx_wallet/features/asset/asset.dart';
import 'package:rbx_wallet/features/asset/asset_card.dart';
import 'package:rbx_wallet/features/asset/proxied_asset.dart';
import 'package:rbx_wallet/features/nft/components/proxy_asset_card.dart';

class ProxyAssetThumbnail extends StatelessWidget {
  final double size;
  final ProxiedAsset? asset;
  const ProxyAssetThumbnail(
    this.asset, {
    Key? key,
    this.size = 150.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (asset == null) return SizedBox();
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
                        ProxiedAssetCard(asset),
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
                      asset!.url,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    )
                  : Icon(asset!.icon),
            ),
            Text(
              asset!.fileName,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 10),
              overflow: TextOverflow.ellipsis,
            )
          ],
        ),
      ),
    );
  }
}
