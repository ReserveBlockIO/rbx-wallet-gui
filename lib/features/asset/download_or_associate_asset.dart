import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/components/buttons.dart';
import '../nft/providers/minted_nft_list_provider.dart';
import '../nft/providers/nft_detail_provider.dart';
import '../smart_contracts/services/smart_contract_service.dart';
import 'asset.dart';

class DownloadOrAssociate extends StatefulWidget {
  final Asset asset;
  final String nftId;
  final Function() onComplete;
  const DownloadOrAssociate({
    Key? key,
    required this.asset,
    required this.nftId,
    required this.onComplete,
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
    final syncPath = widget.asset.localPath;
    if (syncPath != null) {
      final exists = await File(syncPath).exists();

      setState(() {
        visible = !exists;
      });
    } else {
      if (syncPath != null) {
        FileImage(File(syncPath)).evict;
      }
      setState(() {
        visible = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!visible) {
      return SizedBox();
    }

    return Consumer(builder: (context, ref, _) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Media asset file not found on your machine (${widget.asset.fileName})."),
            Text("Please check any other wallets with the same address for the media."),
            SizedBox(
              height: 6,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // AppButton(
                //   label: "Download Asset",
                //   onPressed: () async {
                //     final success = await SmartContractService().downloadAssets(widget.nftId);
                //     checkAvailable();
                //   },
                // ),
                // SizedBox(
                //   width: 8,
                // ),
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

                    if (success == true) {
                      await checkAvailable();
                      ref.refresh(nftDetailProvider(widget.nftId));
                      ref.refresh(mintedNftListProvider);
                      widget.onComplete();
                    }
                  },
                ),
              ],
            ),
          ],
        ),
      );
    });
  }
}
