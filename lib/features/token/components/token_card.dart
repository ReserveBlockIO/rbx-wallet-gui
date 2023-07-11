import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/base_component.dart';
import 'package:rbx_wallet/core/providers/cached_memory_image_provider.dart';
import 'package:rbx_wallet/features/nft/models/nft.dart';
import 'package:rbx_wallet/features/token/models/token_account.dart';
import 'package:rbx_wallet/features/token/models/token_sc_feature.dart';

import '../screens/token_management_screen.dart';

class TokenCard extends BaseComponent {
  final Nft nft;

  const TokenCard({super.key, required this.nft});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final tokenStateDetails = nft.tokenSt;
    final tokenDetails = nft.tokenDetails;

    if (tokenDetails == null) {
      return SizedBox();
    }

    return InkWell(
      onTap: () async {
        final tokenAccount = TokenAccount.fromNft(nft, ref);
        final tokenFeature = TokenScFeature.fromNft(nft);
        if (tokenAccount != null && tokenFeature != null) {
          Navigator.of(context).push(MaterialPageRoute(builder: (_) => TokenManagementScreen(tokenAccount, tokenFeature, nft.id)));
          return;
        }
      },
      child: Card(
        color: Colors.black,
        child: Container(
          decoration: BoxDecoration(
            // color: Theme.of(context).colorScheme.primary.withOpacity(0.3),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Theme.of(context).colorScheme.primary.withOpacity(0.3),
                Theme.of(context).colorScheme.primary.withOpacity(1),
              ],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  tokenDetails.imageBase64 != null
                      ? Container(
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
