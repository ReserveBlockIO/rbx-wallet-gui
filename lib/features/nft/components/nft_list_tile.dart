import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/theme/components.dart';

import '../../../core/base_component.dart';
import '../../asset/polling_image_preview.dart';
import '../../smart_contracts/components/sc_creator/common/modal_container.dart';
import '../modals/nft_management_modal.dart';
import '../models/nft.dart';
import '../providers/burned_provider.dart';
import '../providers/nft_detail_provider.dart';
import '../providers/transferred_provider.dart';
import '../screens/nft_detail_screen.dart';
import 'nft_card.dart';
import 'package:cached_network_image/cached_network_image.dart';

class NftListTile extends BaseComponent {
  final Nft nft;
  final bool manageOnPress;
  final Function()? onPressedOverride;
  final bool showListedStatus;
  final Widget? trailingOverride;

  const NftListTile(
    this.nft, {
    Key? key,
    this.manageOnPress = false,
    this.onPressedOverride,
    this.showListedStatus = false,
    this.trailingOverride,
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
            children: [
              NftMangementModal(
                nft.id,
                nft,
              )
            ],
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

    return Padding(
      padding: const EdgeInsets.all(8),
      child: AppCard(
        padding: 0,
        child: ListTile(
          onTap: onPressedOverride ??
              (isBurned || (isTransferred && !manageOnPress)
                  ? null
                  : () {
                      _showDetails(context, ref);
                    }),
          title: Text("${nft.currentEvolveName}${isBurned ? ' (Burned)' : ''} ${showListedStatus && nft.isListed(ref) ? ' (Listed)' : ''}"),
          subtitle: Text(nft.id),
          leading: SizedBox(
            height: 32,
            child: kIsWeb
                ? Stack(
                    children: [
                      Builder(
                        builder: (context) {
                          if (nft.currentEvolveAssetWeb != null && nft.currentEvolveAssetWeb!.isImage) {
                            return SizedBox(
                              width: 32,
                              height: 32,
                              child: AspectRatio(
                                aspectRatio: 1,
                                child: CachedNetworkImage(
                                  imageUrl: nft.currentEvolveAssetWeb!.location,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            );
                          }

                          if (nft.primaryAssetWeb != null) {
                            return Icon(Icons.file_present_outlined);
                          }

                          return SizedBox(
                            width: 32,
                            height: 32,
                          );
                        },
                      ),
                      if (isTransferred && !manageOnPress && onPressedOverride == null) TransferingOverlay(nft, small: true)
                      // TransferingOverlay(nft, small: true)
                    ],
                  )
                : Stack(
                    children: [
                      Builder(
                        builder: (context) {
                          if (nft.currentEvolveAsset.isImage) {
                            if (nft.currentEvolveAsset.localPath == null) {
                              return const SizedBox(
                                width: 32,
                                height: 32,
                              );
                            }

                            return SizedBox(
                              width: 32,
                              height: 32,
                              child: PollingImagePreview(
                                localPath: nft.currentEvolveAsset.localPath!,
                                expectedSize: nft.currentEvolveAsset.fileSize,
                                withProgress: false,
                              ),
                            );
                          }
                          return const Icon(Icons.file_present_outlined);
                        },
                      ),
                      if (isTransferred && !manageOnPress && onPressedOverride == null) TransferingOverlay(nft, small: true)
                      // TransferingOverlay(nft, small: true)
                    ],
                  ),
          ),
          trailing: trailingOverride ?? const Icon(Icons.chevron_right),
        ),
      ),
    );
  }
}
