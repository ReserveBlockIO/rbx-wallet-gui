import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/base_component.dart';
import 'package:rbx_wallet/features/nft/components/nft_list_tile.dart';
import 'package:rbx_wallet/features/nft/components/nft_navigator.dart';
import 'package:rbx_wallet/features/nft/providers/minted_nft_list_provider.dart';
import 'package:rbx_wallet/features/nft/providers/nft_list_provider.dart';

class NftList extends BaseComponent {
  final bool minted;

  const NftList({Key? key, this.minted = false}) : super(key: key);

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    final _model = ref.watch(minted ? mintedNftListProvider : nftListProvider);

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(6.0),
          child: NftNavigator(minted: minted),
        ),
        Expanded(
          child: Builder(builder: (context) {
            if (_model.data.results.isEmpty) {
              return Center(
                child: Text(minted ? "No minted NFTs with management capabilities." : "No NFTs found."),
              );
            }
            return ListView.builder(
              itemCount: _model.data.results.length,
              itemBuilder: (context, index) {
                final nft = _model.data.results[int.parse(index.toString())];

                return NftListTile(
                  nft,
                  manageOnPress: minted,
                );
              },
            );
          }),
        ),
      ],
    );
  }
}
