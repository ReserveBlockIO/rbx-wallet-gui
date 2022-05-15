import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/base_component.dart';
import 'package:rbx_wallet/features/nft/components/nft_card.dart';
import 'package:rbx_wallet/features/nft/providers/minted_nft_list_provider.dart';
import 'package:rbx_wallet/features/nft/providers/nft_list_provider.dart';

class NftGrid extends BaseComponent {
  final bool minted;
  const NftGrid({
    Key? key,
    this.minted = false,
  }) : super(key: key);

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    final _provider = ref.read(
        minted ? mintedNftListProvider.notifier : nftListProvider.notifier);
    final _model = ref.watch(minted ? mintedNftListProvider : nftListProvider);

    print(_model);

    if (_model.isEmpty) {
      return Center(
        child: Text(minted
            ? "No minted NFTs with management capabilities."
            : "No NFTs found."),
      );
    }

    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 1,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
      ),
      itemCount: _model.length,
      itemBuilder: (context, index) {
        final nft = _model[index];

        return NftCard(
          nft,
          manageOnPress: minted,
        );
      },
    );
  }
}
