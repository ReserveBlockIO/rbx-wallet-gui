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
              )
            : Icon(Icons.file_present_outlined),
        if (asset.authorName != null && asset.authorName!.isNotEmpty)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Text(
              "Creator: ${asset.authorName}",
              style:
                  Theme.of(context).textTheme.caption!.copyWith(fontSize: 14),
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
                subtitle: Text("File Type"),
              ),
            ),
            SizedBox(
              width: 200,
              child: ListTile(
                leading: Icon(Icons.line_weight),
                contentPadding: EdgeInsets.zero,
                title: Text(asset.filesizeLabel),
                subtitle: Text("File Size"),
              ),
            ),
          ],
        ),
        Divider(),
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
            SizedBox(width: 4),
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
