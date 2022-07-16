import 'package:flutter/material.dart';
import 'package:rbx_wallet/core/components/buttons.dart';
import 'package:rbx_wallet/features/asset/asset.dart';
import 'package:rbx_wallet/utils/files.dart';

class AssetCard extends StatelessWidget {
  final Asset asset;

  const AssetCard(this.asset, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        asset.isImage
            ? Image.file(
                asset.file,
                width: double.infinity,
                fit: BoxFit.contain,
                errorBuilder: (context, _, __) {
                  return Text(
                    "File not found for preview.\nLikely this means this NFT not longer exists on this machine.\n",
                    style: Theme.of(context).textTheme.caption,
                    textAlign: TextAlign.left,
                  );
                },
              )
            : const Icon(Icons.file_present_outlined),
        if (asset.authorName != null && asset.authorName!.isNotEmpty)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Text(
              "Creator: ${asset.authorName}",
              style: Theme.of(context).textTheme.caption!.copyWith(fontSize: 14),
            ),
          ),
        Wrap(
          children: [
            SizedBox(
              width: 200,
              child: ListTile(
                contentPadding: EdgeInsets.zero,
                leading: Icon(asset.icon),
                title: Text(asset.fileType),
                subtitle: const Text("File Type"),
              ),
            ),
            SizedBox(
              width: 200,
              child: ListTile(
                leading: const Icon(Icons.line_weight),
                contentPadding: EdgeInsets.zero,
                title: Text(asset.filesizeLabel),
                subtitle: const Text("File Size"),
              ),
            ),
          ],
        ),
        const Divider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            AppButton(
              label: "Open Folder",
              icon: Icons.folder_open,
              onPressed: () {
                openFile(asset.folder);
              },
            ),
            const SizedBox(width: 4),
            AppButton(
              label: "Open Asset",
              icon: Icons.file_open,
              onPressed: () {
                openFile(asset.file);
              },
            ),
          ],
        ),
      ],
    );
  }
}
