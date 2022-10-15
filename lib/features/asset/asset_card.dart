import 'dart:io' as io;
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/components/buttons.dart';
import 'package:rbx_wallet/core/components/centered_loader.dart';
import 'package:rbx_wallet/features/asset/asset.dart';
import 'package:rbx_wallet/features/smart_contracts/providers/asset_location_provider.dart';
import 'package:rbx_wallet/features/smart_contracts/services/smart_contract_service.dart';
import 'package:rbx_wallet/utils/files.dart';

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
        asset.isImage
            ? Consumer(builder: (context, ref, _) {
                final data = ref.watch(assetLocationProvider(asset.locationData(nftId)));

                return data.when(
                    data: (location) {
                      if (location == null) {
                        return SizedBox();
                      }
                      return Image.file(
                        io.File(location),
                        width: double.infinity,
                        fit: BoxFit.contain,
                        errorBuilder: (context, _, __) {
                          return Column(
                            children: [
                              Text(
                                "File not found for preview.\nLikely this means this NFT not longer exists on this machine.\n",
                                style: Theme.of(context).textTheme.caption,
                                textAlign: TextAlign.left,
                              ),
                            ],
                          );
                        },
                      );
                    },
                    error: (err, _) => SizedBox(),
                    loading: () => CenteredLoader());
              })
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
        DownloadOrAssociate(
          asset: asset,
          nftId: nftId,
        )
      ],
    );
  }
}

class DownloadOrAssociate extends StatefulWidget {
  final Asset asset;
  final String nftId;
  const DownloadOrAssociate({
    Key? key,
    required this.asset,
    required this.nftId,
  }) : super(key: key);

  @override
  State<DownloadOrAssociate> createState() => _DownloadOrAssociateState();
}

class _DownloadOrAssociateState extends State<DownloadOrAssociate> {
  bool visible = false;

  @override
  void initState() {
    super.initState();

    checkAvailable();
  }

  Future<void> checkAvailable() async {
    final syncPath = widget.asset.location;
    if (syncPath != null) {
      final exists = await io.File(syncPath).exists();

      setState(() {
        visible = !exists;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    //temp
    return SizedBox();

    if (!visible) {
      return SizedBox();
    }
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Column(
        children: [
          Text("Files not found on your machine. You can import below."),
          SizedBox(
            height: 6,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              AppButton(
                label: "Download Asset",
                onPressed: () async {
                  final success = await SmartContractService().downloadAssets(widget.nftId);
                  checkAvailable();
                },
              ),
              SizedBox(
                width: 8,
              ),
              AppButton(
                label: "Associate File",
                onPressed: () async {
                  FilePickerResult? result = await FilePicker.platform.pickFiles();
                  if (result == null) {
                    return;
                  }

                  final location = result.files.single.path;

                  if (location == null) {
                    return;
                  }

                  final success = await SmartContractService().associateAsset(
                    widget.nftId,
                    location,
                  );

                  checkAvailable();
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
