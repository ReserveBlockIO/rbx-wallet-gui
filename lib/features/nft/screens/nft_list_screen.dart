import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/breakpoints.dart';
import '../../../core/components/back_to_home_button.dart';
import '../../../core/theme/colors.dart';

import '../../../core/components/buttons.dart';
import '../../../core/dialogs.dart';
import '../../../core/providers/session_provider.dart';
import '../../../core/theme/app_theme.dart';
import '../../web/components/web_mobile_drawer_button.dart';
import '../services/nft_service.dart';
import '../../web/components/web_wallet_type_switcher.dart';
import '../../../utils/toast.dart';
import '../../../utils/validation.dart';

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

    final isMobile = BreakPoints.useMobileLayout(context);

    return AppBar(
      leading: isMobile ? WebMobileDrawerButton() : null,
      title: const Text("NFTs"),
      backgroundColor: Colors.black12,
      shadowColor: Colors.transparent,
      // leading: BackToHomeButton(),
      actions: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            // if (kIsWeb) WebWalletTypeSwitcher(),
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
            TabBar(
              indicatorColor: AppColors.getBlue(),
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
