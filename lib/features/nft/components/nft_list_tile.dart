import 'package:flutter/material.dart';
import 'package:rbx_wallet/features/nft/models/nft.dart';
import 'package:rbx_wallet/features/nft/screens/nft_detail_screen.dart';
import 'package:rbx_wallet/features/nft/screens/nft_management_screen.dart';
import 'package:rbx_wallet/features/nft/services/nft_service.dart';
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
    final details = await NftService().retrieve(nft.id);
    if (details == null) {
      Toast.error();
      return;
    }
    final _nft = nft.copyWith(code: details.code);
    if (manageOnPress) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) {
            return NftMangementScreen(_nft);
          },
        ),
      );
    } else {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) {
            return NftDetailScreen(_nft);
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
