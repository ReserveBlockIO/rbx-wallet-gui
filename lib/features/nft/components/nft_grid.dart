import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/base_component.dart';
import '../../../core/breakpoints.dart';
import '../providers/minted_nft_list_provider.dart';
import '../providers/nft_list_provider.dart';
import 'nft_card.dart';
import 'nft_navigator.dart';

class NftGrid extends BaseComponent {
  final bool minted;
  const NftGrid({
    Key? key,
    this.minted = false,
  }) : super(key: key);

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    final NftListModel _model = ref.watch(minted ? mintedNftListProvider : nftListProvider);

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

            return Padding(
              padding: const EdgeInsets.all(16),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: BreakPoints.useMobileLayout(context) ? 1 : 3,
                  childAspectRatio: 1,
                  crossAxisSpacing: 16.0,
                  mainAxisSpacing: 16.0,
                ),
                itemCount: _model.data.results.length,
                itemBuilder: (context, index) {
                  final nft = _model.data.results[index];
                  return NftCard(
                    key: Key(nft.id),
                    nft,
                    manageOnPress: minted,
                  );
                },
              ),
            );
          }),
        ),
      ],
    );
  }
}
