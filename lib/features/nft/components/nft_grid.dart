import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/base_component.dart';
import 'package:rbx_wallet/core/breakpoints.dart';
import 'package:rbx_wallet/core/components/buttons.dart';
import 'package:rbx_wallet/features/nft/components/nft_card.dart';
import 'package:rbx_wallet/features/nft/components/nft_navigator.dart';
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
    final NftListModel _model = ref.watch(minted ? mintedNftListProvider : nftListProvider);
    // final searchController = ref.read(minted ? mintedNftListProvider.notifier : nftListProvider.notifier).searchController;

    return Column(
      children: [
        if (!kIsWeb)
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

            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: BreakPoints.useMobileLayout(context) ? 1 : 3,
                childAspectRatio: 1,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
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
            );
          }),
        ),
      ],
    );
  }
}
