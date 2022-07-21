import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/base_screen.dart';
import 'package:rbx_wallet/features/nft/components/nft_grid.dart';
import 'package:rbx_wallet/features/nft/providers/nft_list_view_provider.dart';

class NftListScreen extends BaseScreen {
  const NftListScreen({Key? key})
      : super(
          key: key,
          includeWebDrawer: true,
          backgroundColor: Colors.black87,
          horizontalPadding: 0,
          verticalPadding: 0,
        );

  @override
  AppBar? appBar(BuildContext context, WidgetRef ref) {
    final _provider = ref.read(nftListViewProvider.notifier);
    final isGrid = ref.watch(nftListViewProvider);

    return AppBar(
      title: const Text("NFTs"),
      backgroundColor: Colors.black12,
      shadowColor: Colors.transparent,
      // actions: [
      //   Row(
      //     mainAxisSize: MainAxisSize.min,
      //     children: [
      //       IconButton(
      //         onPressed: () {
      //           _provider.setGrid();
      //         },
      //         icon: Icon(
      //           Icons.grid_on,
      //           color: isGrid ? Colors.white : Colors.white38,
      //         ),
      //       ),
      //       IconButton(
      //         onPressed: () {
      //           _provider.setList();
      //         },
      //         icon: Icon(
      //           Icons.list_outlined,
      //           color: !isGrid ? Colors.white : Colors.white38,
      //         ),
      //       ),
      //     ],
      //   )
      // ],
    );
  }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    final isGrid = ref.watch(nftListViewProvider);

    return DefaultTabController(
        length: 2,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const TabBar(
              tabs: [
                Tab(
                  child: Text("My NFTs"),
                ),
                Tab(
                  child: Text("Manage Minted NFTs"),
                ),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  // isGrid ? const NftGrid() : const NftList(),
                  // isGrid ? const NftGrid(minted: true) : const NftList(minted: true),
                  const NftGrid(),
                  const NftGrid(minted: true),
                ],
              ),
            ),
          ],
        ));
  }
}
