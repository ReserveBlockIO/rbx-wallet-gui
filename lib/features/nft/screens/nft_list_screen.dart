import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/components/buttons.dart';
import 'package:rbx_wallet/core/dialogs.dart';
import 'package:rbx_wallet/core/providers/session_provider.dart';
import 'package:rbx_wallet/core/theme/app_theme.dart';
import 'package:rbx_wallet/features/nft/services/nft_service.dart';
import 'package:rbx_wallet/features/smart_contracts/services/smart_contract_service.dart';
import 'package:rbx_wallet/features/web/components/web_ra_mode_switcher.dart';
import 'package:rbx_wallet/utils/toast.dart';
import 'package:rbx_wallet/utils/validation.dart';

import '../../../core/base_screen.dart';
import '../components/nft_grid.dart';
import '../components/nft_list.dart';
import '../providers/nft_list_view_provider.dart';

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
      actions: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (kIsWeb) WebRaModeSwitcher(),
            if (!kIsWeb)
              AppButton(
                type: AppButtonType.Text,
                label: "Import NFT",
                variant: AppColorVariant.Light,
                onPressed: () async {
                  final scId = await PromptModal.show(
                    title: "Smart Contract Identifier",
                    body: "Paste in the smart contract's unique identifier.",
                    validator: (val) => formValidatorNotEmpty(val, "Identifier"),
                    labelText: "Identifier",
                  );

                  if (scId != null && scId.isNotEmpty) {
                    final success = await NftService().importFromNetwork(scId);
                    if (success) {
                      ref.read(sessionProvider.notifier).smartContractLoop(false);
                      Toast.message("Smart Contract imported from network");
                    }
                  }
                },
              ),
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
                  isGrid ? const NftGrid() : const NftList(),
                  isGrid ? const NftGrid(minted: true) : const NftList(minted: true),
                  // const NftGrid(),
                  // const NftGrid(minted: true),
                ],
              ),
            ),
          ],
        ));
  }
}
