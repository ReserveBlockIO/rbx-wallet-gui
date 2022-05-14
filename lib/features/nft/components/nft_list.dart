import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/base_component.dart';
import 'package:rbx_wallet/features/nft/components/nft_card.dart';
import 'package:rbx_wallet/features/nft/components/nft_list_tile.dart';
import 'package:rbx_wallet/features/nft/providers/nft_list_provider.dart';

class NftList extends BaseComponent {
  const NftList({Key? key}) : super(key: key);

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    final _provider = ref.read(nftListProvider.notifier);
    final _model = ref.watch(nftListProvider);

    return ListView.builder(
      itemCount: _model.length,
      itemBuilder: (context, index) {
        final nft = _model[index];

        return NftListTile(nft);
      },
    );
  }
}
