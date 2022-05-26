import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/base_component.dart';
import 'package:rbx_wallet/core/components/badges.dart';
import 'package:rbx_wallet/core/components/buttons.dart';
import 'package:rbx_wallet/core/theme/app_theme.dart';
import 'package:rbx_wallet/features/nft/models/nft.dart';
import 'package:rbx_wallet/features/nft/providers/nft_detail_provider.dart';
import 'package:rbx_wallet/features/nft/screens/nft_detail_screen.dart';
import 'package:rbx_wallet/features/nft/modals/nft_management_modal.dart';
import 'package:rbx_wallet/features/nft/services/nft_service.dart';
import 'package:rbx_wallet/features/smart_contracts/components/sc_creator/common/modal_container.dart';
import 'package:rbx_wallet/utils/toast.dart';

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

    return InkWell(
      onTap: () {
        _showDetails(context, ref);
      },
      child: Card(
        child: Stack(
          alignment: Alignment.center,
          children: [
            nft.currentEvolveAsset.isImage
                ? AspectRatio(
                    aspectRatio: 1,
                    child: Image.file(
                      nft.currentEvolveAsset.file,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  )
                : Icon(Icons.file_present_outlined),
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
                        Shadow(
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
                          Shadow(
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
                child: AppBadge(
                  label: nft.isPublic ? "Public" : "Private",
                  variant: nft.isPublic
                      ? AppColorVariant.Success
                      : AppColorVariant.Danger,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
