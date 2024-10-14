import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/base_component.dart';
import '../../../core/providers/cached_memory_image_provider.dart';
import '../../nft/models/nft.dart';
import '../../nft/services/nft_service.dart';
import '../models/token_account.dart';
import '../models/token_sc_feature.dart';

import '../../../core/theme/components.dart';
import '../../nft/providers/transferred_provider.dart';
import '../screens/token_management_screen.dart';

class TokenCard extends BaseComponent {
  final Nft nft;

  const TokenCard({super.key, required this.nft});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final tokenStateDetails = nft.tokenSt;
    final tokenDetails = nft.tokenDetails;
    final isTransferred = ref.watch(transferredProvider).contains(nft.id);

    if (tokenDetails == null) {
      return SizedBox();
    }

    return InkWell(
      onTap: () async {
        final tokenAccount = TokenAccount.fromNft(nft, ref);
        final tokenFeature = TokenScFeature.fromNft(nft);
        if (tokenAccount != null && tokenFeature != null) {
          final updatedNft = await NftService().retrieve(nft.id);

          Navigator.of(context).push(MaterialPageRoute(
              builder: (_) => TokenManagementScreenContainer(
                    address: updatedNft?.currentOwner ?? nft.currentOwner,
                    nftId: updatedNft?.id ?? nft.id,
                    tokenAccount: tokenAccount,
                    tokenFeature: tokenFeature,
                    ref: ref,
                    nft: updatedNft ?? nft,
                  )));

          return;
        }
      },
      child: AppCard(
        padding: 8,
        margin: EdgeInsets.all(8.0),
        child: Stack(
          children: [
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  tokenDetails.imageBase64 != null
                      ? Container(
                          width: 66,
                          height: 66,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(33.0),
                            border: Border.all(
                              color: Colors.white.withOpacity(0.5),
                            ),
                          ),
                          child: Container(
                            width: 64,
                            height: 64,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(32.0),
                            ),
                            clipBehavior: Clip.antiAlias,
                            child: Image(
                              image: CacheMemoryImageProvider(
                                nft.id,
                                Base64Decoder().convert(tokenDetails.imageBase64!),
                              ),
                              width: 64,
                              height: 64,
                            ),
                          ),
                        )
                      : Icon(Icons.toll),
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    tokenDetails.ticker,
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
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    nft.name,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontSize: 18,
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
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    nft.id,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
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
                ],
              ),
            ),
            // if (isTransferred)
            //   TransferingOverlay(
            //     nft,
            //     withLog: true,
            //   ),
          ],
        ),
      ),
    );
  }
}
