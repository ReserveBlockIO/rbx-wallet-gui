import 'package:flutter/material.dart';
import 'package:rbx_wallet/core/components/buttons.dart';
import 'package:rbx_wallet/features/asset/asset.dart';
import 'package:rbx_wallet/features/asset/proxied_asset.dart';
import 'package:rbx_wallet/utils/files.dart';
import 'package:url_launcher/url_launcher.dart';

class ProxiedAssetCard extends StatelessWidget {
  final ProxiedAsset? asset;

  const ProxiedAssetCard(this.asset, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (asset == null) return SizedBox();
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        asset!.isImage
            ? Image.network(
                asset!.url,
                width: double.infinity,
                fit: BoxFit.contain,
              )
            : const Icon(Icons.file_present_outlined),
        if (asset!.authorName.isNotEmpty)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Text(
              "Creator: ${asset!.authorName}",
              style: Theme.of(context).textTheme.caption!.copyWith(fontSize: 14),
            ),
          ),
        Wrap(
          children: [
            SizedBox(
              width: 200,
              child: ListTile(
                contentPadding: EdgeInsets.zero,
                leading: Icon(asset!.icon),
                title: Text(asset!.fileType),
                subtitle: const Text("File Type"),
              ),
            ),
            SizedBox(
              width: 200,
              child: ListTile(
                leading: const Icon(Icons.line_weight),
                contentPadding: EdgeInsets.zero,
                title: Text(asset!.filesizeLabel),
                subtitle: const Text("File Size"),
              ),
            ),
          ],
        ),
        const Divider(),
        Center(
          child: AppButton(
            label: "Open Asset",
            icon: Icons.file_open,
            onPressed: () {
              launchUrl(Uri.parse(asset!.url));
            },
          ),
        ),
      ],
    );
  }
}
