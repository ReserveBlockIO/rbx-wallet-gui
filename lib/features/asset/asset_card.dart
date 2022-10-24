import 'dart:io' as io;
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:rbx_wallet/core/components/buttons.dart';
import 'package:rbx_wallet/features/asset/asset.dart';
import 'package:rbx_wallet/features/asset/download_or_associate_asset.dart';
import 'package:rbx_wallet/features/smart_contracts/services/smart_contract_service.dart';
import 'package:rbx_wallet/utils/files.dart';
import 'package:rbx_wallet/utils/toast.dart';

class AssetCard extends StatelessWidget {
  final Asset asset;
  final bool interactive;
  final String nftId;

  const AssetCard(
    this.asset, {
    Key? key,
    required this.nftId,
    this.interactive = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        asset.localPath != null
            ? asset.isImage
                ? Image.file(
                    io.File(asset.localPath!),
                    width: double.infinity,
                    fit: BoxFit.contain,
                    errorBuilder: (context, _, __) {
                      return Text(
                        "File not found for preview.\nLikely this means this NFT no longer exists on this machine.\n",
                        style: Theme.of(context).textTheme.caption,
                        textAlign: TextAlign.left,
                      );
                    },
                  )
                : const Icon(Icons.file_present_outlined)
            : DownloadOrAssociate(
                asset: asset,
                nftId: nftId,
              ),
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
              onPressed: () async {
                final path = await SmartContractService().getAssetPath(nftId, asset.name!);
                if (path != null) {
                  openFile(io.File(io.File(path).parent.path));
                }
              },
            ),
            const SizedBox(width: 4),
            AppButton(
              label: "Open Asset",
              icon: Icons.file_open,
              onPressed: () async {
                final path = await SmartContractService().getAssetPath(nftId, asset.name!);
                if (path != null) {
                  openFile(io.File(path));
                }
              },
            ),
          ],
        ),
      ],
    );
  }
}
