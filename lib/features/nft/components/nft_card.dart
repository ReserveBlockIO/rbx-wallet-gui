import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/base_component.dart';
import 'package:rbx_wallet/core/components/badges.dart';
import 'package:rbx_wallet/core/theme/app_theme.dart';
import 'package:rbx_wallet/features/nft/models/nft.dart';
import 'package:rbx_wallet/features/nft/providers/burned_provider.dart';
import 'package:rbx_wallet/features/nft/providers/nft_detail_provider.dart';
import 'package:rbx_wallet/features/nft/providers/nft_list_provider.dart';
import 'package:rbx_wallet/features/nft/providers/transferred_provider.dart';
import 'package:rbx_wallet/features/nft/screens/nft_detail_screen.dart';
import 'package:rbx_wallet/features/nft/modals/nft_management_modal.dart';
import 'package:rbx_wallet/features/smart_contracts/components/sc_creator/common/modal_container.dart';

class NftCard extends BaseComponent {
  final Nft nft;
  final bool manageOnPress;

  const NftCard(
    this.nft, {
    Key? key,
    this.manageOnPress = false,
  }) : super(key: key);

  Future<void> _showDetails(BuildContext context, WidgetRef ref) async {
    // final details = await NftService().retrieve(nft.id);
    // if (details == null) {
    //   Toast.error();
    //   return;
    // }
    // final _nft = nft.copyWith(code: details.code);

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
      // AutoRouter.of(context).push(NftDetailScreenRoute(id: nft.id));

    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // return ListTile(
    //   onTap: () {
    //     _showDetails(context);
    //   },
    //   title: Text(nft.name),
    //   subtitle: Text(nft.description),
    //   leading: Builder(
    //     builder: (context) {
    //       if (nft.primaryAsset.isImage) {
    //         return Image.file(
    //           nft.primaryAsset.file,
    //           width: 32,
    //           height: 32,
    //           fit: BoxFit.contain,
    //         );
    //       }
    //       return Icon(Icons.file_present_outlined);
    //     },
    //   ),
    //   trailing: Icon(Icons.chevron_right),
    // );

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
                          ? Image.file(
                              File(nft.currentEvolveAsset.localPath!),
                              width: double.infinity,
                              fit: BoxFit.cover,
                              errorBuilder: (context, _, __) {
                                return Center(
                                  child: Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Text(
                                      "File not found for preview.\nLikely this means this NFT not longer exists on this machine.\n",
                                      style: Theme.of(context).textTheme.caption,
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                );
                              },
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
