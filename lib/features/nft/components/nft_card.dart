import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';
import 'package:rbx_wallet/core/components/buttons.dart';
import 'package:rbx_wallet/core/env.dart';
import 'package:rbx_wallet/utils/toast.dart';

import '../../../core/base_component.dart';
import '../../../core/components/badges.dart';
import '../../../core/theme/app_theme.dart';
import '../../asset/polling_image_preview.dart';
import '../../smart_contracts/components/sc_creator/common/modal_container.dart';
import '../modals/nft_management_modal.dart';
import '../models/nft.dart';
import '../providers/burned_provider.dart';
import '../providers/nft_detail_provider.dart';
import '../providers/nft_list_provider.dart';
import '../providers/transferred_provider.dart';
import '../screens/nft_detail_screen.dart';

class NftCard extends BaseComponent {
  final Nft nft;
  final bool manageOnPress;

  const NftCard(
    this.nft, {
    Key? key,
    this.manageOnPress = false,
  }) : super(key: key);

  Future<void> _showDetails(BuildContext context, WidgetRef ref) async {
    ref.read(nftDetailProvider(nft.id).notifier).init();

    if (manageOnPress) {
      showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.black87,
        context: context,
        builder: (context) {
          return ModalContainer(
            color: Colors.black26,
            children: [NftMangementModal(nft.id, nft)],
          );
        },
      );
    } else {
      Navigator.of(context).push(MaterialPageRoute(builder: (_) => NftDetailScreen(id: nft.id)));
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isBurned = ref.watch(burnedProvider).contains(nft.id);
    final isTransferred = ref.watch(transferredProvider).contains(nft.id);

    return InkWell(
      onTap: isBurned || (isTransferred && !manageOnPress)
          ? null
          : () {
              _showDetails(context, ref);
            },
      child: Card(
        child: Stack(
          alignment: Alignment.center,
          children: [
            if (kIsWeb)
              nft.currentEvolveAssetWeb != null && nft.currentEvolveAssetWeb!.isImage && nft.assetsAvailable
                  ? AspectRatio(
                      aspectRatio: 1,
                      child: Image.network(
                        nft.currentEvolveAssetWeb!.url,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    )
                  : nft.assetsAvailable
                      ? const Icon(Icons.file_present_outlined)
                      : const Text("NFT assets have not been transfered to the RBX Web Wallet."),
            if (!kIsWeb)
              nft.currentEvolveAsset.isImage
                  ? AspectRatio(
                      aspectRatio: 1,
                      child: nft.currentEvolveAsset.localPath != null
                          ? PollingImagePreview(
                              localPath: nft.currentEvolveAsset.localPath!,
                              expectedSize: nft.currentEvolveAsset.fileSize,
                              withProgress: false,
                            )
                          : const Text(""),
                    )
                  : const Icon(Icons.file_present_outlined),
            Container(
              color: Colors.black38,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    nft.currentEvolveName,
                    style: Theme.of(context).textTheme.displaySmall!.copyWith(
                      shadows: [
                        const Shadow(
                          color: Colors.black87,
                          offset: Offset.zero,
                          blurRadius: 4.0,
                        )
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: Text(
                      nft.id,
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        shadows: [
                          const Shadow(
                            color: Colors.black87,
                            offset: Offset.zero,
                            blurRadius: 4.0,
                          )
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),

                  //TODO: put this back in
                  // if (nft.featureListLabel != null)
                  //   Padding(
                  //     padding: const EdgeInsets.symmetric(vertical: 4),
                  //     child: Text(
                  //       nft.featureListLabel!,
                  //       style: Theme.of(context).textTheme.bodyText1!.copyWith(
                  //         shadows: [
                  //           Shadow(
                  //             color: Colors.black87,
                  //             offset: Offset.zero,
                  //             blurRadius: 4.0,
                  //           )
                  //         ],
                  //       ),
                  //       textAlign: TextAlign.center,
                  //     ),
                  //   ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (manageOnPress)
                      Builder(builder: (context) {
                        final nftIds = ref.watch(nftListProvider).data.results.map((n) => n.id).toList();

                        if (nftIds.contains(nft.id)) {
                          return const SizedBox.shrink();
                        }

                        return const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: AppBadge(
                            label: "Transferred",
                            variant: AppColorVariant.Danger,
                          ),
                        );
                      }),
                    // AppBadge(
                    //   label: nft.isPublished ? "Minted" : "Minting...",
                    //   variant: nft.isPublished ? AppColorVariant.Success : AppColorVariant.Warning,
                    // ),
                    // const SizedBox(
                    //   width: 4,
                    // ),
                    Padding(
                      padding: const EdgeInsets.only(left: 4.0),
                      child: AppBadge(
                        label: nft.isPublic ? "Public" : "Private",
                        variant: nft.isPublic ? AppColorVariant.Success : AppColorVariant.Primary,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            if (isBurned)
              Container(
                color: Colors.black54,
                child: const Center(
                    child: Text(
                  "Burned",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                )),
              ),
            if (isTransferred && !manageOnPress)
              TransferingOverlay(
                nft,
                withLog: true,
              )
          ],
        ),
      ),
    );
  }
}

class TransferingOverlay extends StatelessWidget {
  final Nft nft;
  final bool withLog;
  final bool small;
  const TransferingOverlay(
    this.nft, {
    Key? key,
    this.withLog = false,
    this.small = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black54,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Transferring...",
              style: TextStyle(
                fontSize: small ? 14 : 20,
                fontWeight: small ? FontWeight.w500 : FontWeight.bold,
              ),
            ),
            if (withLog)
              AppButton(
                label: "View Upload Progress",
                onPressed: () {
                  final List<String> fileNames = [nft.primaryAsset.fileName];
                  for (final a in nft.additionalAssets) {
                    fileNames.add(a.fileName);
                  }

                  showDialog(context: context, builder: (context) => UploadProgressModal(fileNames: fileNames));
                },
                type: AppButtonType.Text,
                variant: AppColorVariant.Info,
              )
          ],
        ),
      ),
    );
  }
}

class UploadProgressModal extends StatefulWidget {
  final List<String> fileNames;
  const UploadProgressModal({
    Key? key,
    required this.fileNames,
  }) : super(key: key);

  @override
  State<UploadProgressModal> createState() => _UploadProgressModalState();
}

class _UploadProgressModalState extends State<UploadProgressModal> {
  String logLocation = "";
  List<String> lines = [];
  Timer? timer;

  @override
  void initState() {
    run();
    super.initState();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  Future<void> run() async {
    await setup();
    await update();
    timer = Timer.periodic(const Duration(seconds: 3), (Timer t) => update());
  }

  Future<void> setup() async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String appDocPath = appDocDir.path;
    String location = "";

    if (Platform.isMacOS) {
      appDocPath = appDocPath.replaceAll("/Documents", Env.isTestNet ? "/rbxtest" : "/rbx");
      location = "$appDocPath/Databases${Env.isTestNet ? 'TestNet' : ''}/beaconlog.txt";
    } else {
      appDocDir = await getApplicationSupportDirectory();

      appDocPath = appDocDir.path;

      appDocPath = appDocPath.replaceAll("\\Roaming\\com.example\\rbx_wallet_gui", "\\Local\\RBX${Env.isTestNet ? 'Test' : ''}");
      location = "$appDocPath\\Databases${Env.isTestNet ? 'TestNet' : ''}\\beaconlog.txt";
    }

    setState(() {
      logLocation = location;
    });
  }

  Future<void> update() async {
    print("UPDATE");
    if (logLocation.isEmpty) {
      Toast.error();
      return;
    }

    final allLines = await File(logLocation).readAsLines();

    final List<String> _lines = [];

    for (final line in allLines) {
      for (final f in widget.fileNames) {
        if (line.contains(f)) {
          _lines.add(line);
        }
      }
    }

    print(_lines);

    setState(() {
      lines = _lines;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Media Upload Progress"),
      content: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 900),
        child: Container(
          color: Colors.black,
          width: double.maxFinite,
          height: 200,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: lines.length,
              itemBuilder: (context, index) {
                return Text(lines[index]);
              },
            ),
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text(
            "Close",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }
}
