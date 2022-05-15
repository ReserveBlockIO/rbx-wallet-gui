import 'package:flutter/material.dart';
import 'package:rbx_wallet/features/nft/models/nft.dart';
import 'package:rbx_wallet/features/nft/screens/nft_detail_screen.dart';
import 'package:rbx_wallet/features/nft/modals/nft_management_modal.dart';
import 'package:rbx_wallet/features/nft/services/nft_service.dart';
import 'package:rbx_wallet/features/smart_contracts/components/sc_creator/common/modal_container.dart';
import 'package:rbx_wallet/utils/toast.dart';

class NftListTile extends StatelessWidget {
  final Nft nft;
  final bool manageOnPress;

  const NftListTile(
    this.nft, {
    Key? key,
    this.manageOnPress = false,
  }) : super(key: key);

  Future<void> _showDetails(BuildContext context) async {
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
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        _showDetails(context);
      },
      title: Text(nft.name),
      subtitle: Text(nft.description),
      leading: Builder(
        builder: (context) {
          if (nft.primaryAsset.isImage) {
            return Image.file(
              nft.primaryAsset.file,
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
