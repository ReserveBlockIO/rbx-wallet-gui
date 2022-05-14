import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/base_screen.dart';
import 'package:rbx_wallet/features/nft/components/nft_grid.dart';
import 'package:rbx_wallet/features/nft/components/nft_list.dart';
import 'package:rbx_wallet/features/nft/providers/nft_list_view_provider.dart';

class NftListScreen extends BaseScreen {
  const NftListScreen({Key? key}) : super(key: key);

  @override
  AppBar? appBar(BuildContext context, WidgetRef ref) {
    final _provider = ref.read(nftListViewProvider.notifier);
    final isGrid = ref.watch(nftListViewProvider);

    return AppBar(
      title: Text("NFTs"),
      backgroundColor: Colors.black12,
      shadowColor: Colors.transparent,
      actions: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              onPressed: () {
                _provider.setGrid();
              },
              icon: Icon(
                Icons.grid_on,
                color: isGrid ? Colors.white : Colors.white38,
              ),
            ),
            IconButton(
              onPressed: () {
                _provider.setList();
              },
              icon: Icon(
                Icons.list_outlined,
                color: !isGrid ? Colors.white : Colors.white38,
              ),
            ),
          ],
        )
      ],
    );
  }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    final isGrid = ref.watch(nftListViewProvider);

    return isGrid ? NftGrid() : NftList();
  }
}
