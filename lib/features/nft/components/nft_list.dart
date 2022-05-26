import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/base_component.dart';
import 'package:rbx_wallet/features/nft/components/nft_card.dart';
import 'package:rbx_wallet/features/nft/components/nft_list_tile.dart';
import 'package:rbx_wallet/features/nft/providers/minted_nft_list_provider.dart';
import 'package:rbx_wallet/features/nft/providers/nft_list_provider.dart';

class NftList extends BaseComponent {
  final bool minted;

  const NftList({Key? key, this.minted = false}) : super(key: key);

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    final _provider = ref.read(
        minted ? mintedNftListProvider.notifier : nftListProvider.notifier);
    final _model = ref.watch(minted ? mintedNftListProvider : nftListProvider);

    if (_model.isEmpty) {
      return Center(
        child: Text(
          minted
              ? "No minted NFTs with management capabilities."
              : "No NFTs found.",
        ),
      );
    }

    return ListView.builder(
      itemCount: _model.length,
      itemBuilder: (context, index) {
        final nft = _model[int.parse(index.toString())];

        return NftListTile(
          nft,
          manageOnPress: minted,
        );
      },
    );
  }
}
