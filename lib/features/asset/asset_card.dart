import 'dart:io' as io;

import 'package:flutter/material.dart';

import '../../core/components/buttons.dart';
import '../../utils/files.dart';
import '../smart_contracts/services/smart_contract_service.dart';
import 'asset.dart';
import 'download_or_associate_asset.dart';
import 'polling_image_preview.dart';

class AssetCard extends StatelessWidget {
  final Asset asset;
  final bool interactive;
  final String nftId;
  final Function()? onAssociate;
  final String ownerAddress;
  final bool isPrimaryAsset;

  const AssetCard(
    this.asset, {
    Key? key,
    required this.nftId,
    this.interactive = false,
    this.onAssociate,
    required this.ownerAddress,
    required this.isPrimaryAsset,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        asset.localPath != null
            ? asset.isImage
                ? PollingImagePreview(localPath: asset.localPath!, expectedSize: asset.fileSize)
                : Row(
                    children: [
                      const Icon(Icons.file_present_outlined),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text("File Name: ${asset.truncatedFileName()}"),
                      )
                    ],
                  )
            : DownloadOrAssociate(
                asset: asset,
                nftId: nftId,
                ownerAddress: ownerAddress,
                allowBeaconRequest: isPrimaryAsset,
                onComplete: () {
                  if (onAssociate != null) {
                    onAssociate!();
                  }
                },
              ),
        if (asset.authorName != null && asset.authorName!.isNotEmpty)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Text(
              "Filename: ${asset.fileName} | Creator: ${asset.authorName}",
              style: Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 14),
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
        if (asset.localPath != null) ...[
          const SizedBox(
            height: 8,
          ),
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
      ],
    );
  }
}
