import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
                      : Text("NFT assets have not been transfered to the RBX Web Wallet."),
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
                          : Text(""),
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
                          return SizedBox.shrink();
                        }

                        return Padding(
                          padding: const EdgeInsets.all(8.0),
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
              Container(
                color: Colors.black54,
                child: const Center(
                    child: Text(
                  "Transferring",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                )),
              )
          ],
        ),
      ),
    );
  }
}
