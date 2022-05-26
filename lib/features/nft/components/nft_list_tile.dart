import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/base_component.dart';
import 'package:rbx_wallet/features/nft/models/nft.dart';
import 'package:rbx_wallet/features/nft/providers/nft_detail_provider.dart';
import 'package:rbx_wallet/features/nft/screens/nft_detail_screen.dart';
import 'package:rbx_wallet/features/nft/modals/nft_management_modal.dart';
import 'package:rbx_wallet/features/nft/services/nft_service.dart';
import 'package:rbx_wallet/features/smart_contracts/components/sc_creator/common/modal_container.dart';
import 'package:rbx_wallet/utils/toast.dart';

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
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) {
            return NftDetailScreen(nft.id);
          },
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      onTap: () {
        _showDetails(context, ref);
      },
      title: Text(nft.currentEvolveName),
      subtitle: Text(nft.currentEvolveDescription),
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
          return Icon(Icons.file_present_outlined);
        },
      ),
      trailing: Icon(Icons.chevron_right),
    );
  }
}
