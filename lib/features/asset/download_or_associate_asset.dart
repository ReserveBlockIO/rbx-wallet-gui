import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../nft/services/nft_service.dart';
import '../smart_contracts/components/sc_creator/common/modal_container.dart';
import '../../core/dialogs.dart';
import '../reserve/services/reserve_account_service.dart';
import '../../utils/toast.dart';

import '../../core/components/buttons.dart';
import '../nft/providers/minted_nft_list_provider.dart';
import '../nft/providers/nft_detail_provider.dart';
import '../smart_contracts/services/smart_contract_service.dart';
import 'asset.dart';

class DownloadOrAssociate extends StatefulWidget {
  final Asset asset;
  final String nftId;
  final Function() onComplete;
  final String ownerAddress;
  final bool allowBeaconRequest;
  const DownloadOrAssociate({
    Key? key,
    required this.asset,
    required this.nftId,
    required this.onComplete,
    required this.ownerAddress,
    required this.allowBeaconRequest,
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

  void chooseLocalFiles(WidgetRef ref) async {
    FilePickerResult? result;
    if (!kIsWeb) {
      final Directory currentDir = Directory.current;
      result = await FilePicker.platform.pickFiles();
      Directory.current = currentDir;
    } else {
      result = await FilePicker.platform.pickFiles();
    }
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
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!visible) {
      return const SizedBox();
    }

    return Consumer(builder: (context, ref, _) {
      if (widget.ownerAddress.startsWith("xRBX")) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              "Since this is a Vault Account you'll need to authorize the download.",
              style: TextStyle(color: Colors.deepPurple.shade200),
            ),
            const SizedBox(
              height: 6,
            ),
            AppButton(
              label: "Authorize Now",
              onPressed: () async {
                final password = await PromptModal.show(
                  title: "Vault Account Password",
                  validator: (_) => null,
                  labelText: "Password",
                  lines: 1,
                  obscureText: true,
                  revealObscure: true,
                );
                if (password == null) {
                  return;
                }
                await ReserveAccountService().downloadAssets(widget.nftId, widget.ownerAddress, password);
              },
            )
          ]),
        );
      }
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Media asset file not found on your machine (${widget.asset.fileName})."),
            const Text("Please check any other account with the same address for the media."),
            const SizedBox(
              height: 12,
            ),
            AppButton(
              label: widget.allowBeaconRequest ? "Call Media" : "Associate Media",
              onPressed: () async {
                if (widget.allowBeaconRequest) {
                  showModalBottomSheet(
                      context: context,
                      backgroundColor: Colors.black87,
                      builder: (context) {
                        return ModalContainer(
                          color: Colors.black,
                          withDecor: false,
                          withClose: true,
                          children: [
                            ListTile(
                              leading: Icon(Icons.wifi_tethering_outlined),
                              title: Text("Call Media from Beacon"),
                              trailing: Icon(Icons.chevron_right),
                              onTap: () async {
                                final success = await NftService().requestMediaFromBeacon(widget.nftId);
                                if (success == true) {
                                  widget.onComplete();

                                  InfoDialog.show(
                                      contextOverride: context,
                                      title: "Call to beacon process has started.",
                                      body:
                                          "Please be patient while ALL assets associated with the NFT are called and downloaded.\n\nDo not close your wallet or attempt to call again.");

                                  Toast.message(
                                      "Call to beacon process has started. Please be patient while ALL assets associated with the NFT are called and downloaded.");
                                  Navigator.of(context).pop();
                                }
                              },
                            ),
                            ListTile(
                              leading: Icon(Icons.file_upload),
                              title: Text("Associate Local File"),
                              trailing: Icon(Icons.chevron_right),
                              onTap: () async {
                                chooseLocalFiles(ref);
                              },
                            ),
                          ],
                        );
                      });
                } else {
                  chooseLocalFiles(ref);
                }
              },
            ),
          ],
        ),
      );
    });
  }
}
