import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/components/buttons.dart';
import 'package:rbx_wallet/core/dialogs.dart';
import 'package:rbx_wallet/core/providers/session_provider.dart';
import 'package:rbx_wallet/core/theme/app_theme.dart';
import 'package:rbx_wallet/features/nft/services/nft_service.dart';
import 'package:rbx_wallet/features/smart_contracts/services/smart_contract_service.dart';
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
            AppButton(
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
            if (false)
              AppButton(
                label: "Verify Ownership",
                variant: AppColorVariant.Warning,
                onPressed: () async {
                  final sig = await PromptModal.show(
                    title: "Validate Ownership",
                    body: "Paste in the signature provided by the owner to validate its ownership.",
                    validator: (val) => formValidatorNotEmpty(val, "Signature"),
                    labelText: "Signature",
                  );

                  if (sig != null && sig.isNotEmpty) {
                    final components = sig.split("<>");
                    if (components.length != 4) {
                      Toast.error("Invalid ownership verification signature");
                      return;
                    }

                    final address = components.first;
                    final scId = components.last;

                    final verified = await NftService().verifyOwnership(sig);

                    if (verified == null) {
                      return;
                    }

                    final color = verified ? Theme.of(context).colorScheme.success : Theme.of(context).colorScheme.danger;
                    final iconData = verified ? Icons.check : Icons.close;
                    final title = verified ? "Verified" : "Not Verified";
                    final subtitle = verified ? "Ownership Verified" : "Ownership NOT Verified";
                    final body = verified ? "$address\nOWNS\n$scId" : "$address\ndoes NOT own\n$scId";

                    InfoDialog.show(
                      title: title,
                      content: SizedBox(
                        width: 420,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  iconData,
                                  color: color,
                                  size: 32,
                                ),
                                SizedBox(
                                  width: 12,
                                ),
                                Text(
                                  subtitle,
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: color,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            Text(
                              body,
                              textAlign: TextAlign.center,
                            )
                          ],
                        ),
                      ),
                    );
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
