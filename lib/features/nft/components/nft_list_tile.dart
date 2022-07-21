import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/base_component.dart';
import 'package:rbx_wallet/core/web_router.gr.dart';
import 'package:rbx_wallet/features/nft/models/nft.dart';
import 'package:rbx_wallet/features/nft/providers/burned_provider.dart';
import 'package:rbx_wallet/features/nft/providers/nft_detail_provider.dart';
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
            children: [NftMangementModal(nft.id)],
          );
        },
      );
    } else {
      AutoRouter.of(context).push(NftDetailScreenRoute(id: nft.id));
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isBurned = ref.watch(burnedProvider).contains(nft.id);

    return ListTile(
      onTap: isBurned
          ? null
          : () {
              _showDetails(context, ref);
            },
      title: Text("${nft.currentEvolveName}${isBurned ? ' (Burned)' : ''}"),
      subtitle: Text(nft.currentEvolveDescription.replaceAll("\\n", "\n")),
      leading: Builder(
        builder: (context) {
          if (nft.currentEvolveAsset.isImage) {
            return Image.file(
              nft.currentEvolveAsset.file,
              width: 32,
              height: 32,
              fit: BoxFit.contain,
            );
          }
          return const Icon(Icons.file_present_outlined);
        },
      ),
      trailing: const Icon(Icons.chevron_right),
    );
  }
}
