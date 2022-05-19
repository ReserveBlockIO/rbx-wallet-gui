import 'package:flutter/material.dart';
import 'package:rbx_wallet/features/asset/asset.dart';
import 'package:rbx_wallet/features/asset/asset_card.dart';

class AssetThumbnail extends StatelessWidget {
  final double size;
  final Asset asset;
  const AssetThumbnail(
    this.asset, {
    Key? key,
    this.size = 200.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) {
            return Center(
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    width: 400,
                    // height: 600,
                    child: AssetCard(asset),
                  ),
                ),
              ),
            );
          },
        );
      },
      child: SizedBox(
        width: size,
        height: size,
        child: asset.isImage
            ? Image.file(
                asset.file,
                width: double.infinity,
                fit: BoxFit.contain,
              )
            : Icon(Icons.file_present_outlined),
      ),
    );
  }
}
