import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/base_component.dart';
import 'package:rbx_wallet/core/web_router.gr.dart';
import 'package:rbx_wallet/features/asset/polling_image_preview.dart';
import 'package:rbx_wallet/features/nft/models/nft.dart';
import 'package:rbx_wallet/features/nft/providers/burned_provider.dart';
import 'package:rbx_wallet/features/nft/providers/nft_detail_provider.dart';
import 'package:rbx_wallet/features/nft/providers/transferred_provider.dart';
import 'package:rbx_wallet/features/nft/screens/nft_detail_screen.dart';
import 'package:rbx_wallet/features/nft/modals/nft_management_modal.dart';
import 'package:rbx_wallet/features/smart_contracts/components/sc_creator/common/modal_container.dart';

class NftListTile extends BaseComponent {
  final Nft nft;
  final bool manageOnPress;

  const NftListTile(
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

    return ListTile(
      onTap: isBurned || (isTransferred && !manageOnPress)
          ? null
          : () {
              _showDetails(context, ref);
            },
      title: Text("${nft.currentEvolveName}${isBurned ? ' (Burned)' : ''}"),
      subtitle: Text(nft.id),
      leading: Builder(
        builder: (context) {
          if (nft.currentEvolveAsset.isImage) {
            if (nft.currentEvolveAsset.localPath == null) {
              return SizedBox(
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
      trailing: const Icon(Icons.chevron_right),
    );
  }
}
