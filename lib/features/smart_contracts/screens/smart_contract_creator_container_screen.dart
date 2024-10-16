import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/providers/session_provider.dart';
import '../../wallet/models/wallet.dart';
import '../../wallet/providers/wallet_list_provider.dart';

import '../../../core/base_screen.dart';
import '../../../core/dialogs.dart';
import '../providers/create_smart_contract_provider.dart';

class SmartContractCreatorContainerScreen extends BaseScreen {
  const SmartContractCreatorContainerScreen({Key? key}) : super(key: key, verticalPadding: 0, horizontalPadding: 0);

  @override
  AppBar? appBar(BuildContext context, WidgetRef ref) {
    final _model = ref.watch(createSmartContractProvider);

    final wallets = ref.read(walletListProvider).where((w) => !w.isReserved);
    final selectedWallet = ref.watch(sessionProvider.select((v) => v.currentWallet));

    return AppBar(
        title: Text(_model.isCompiled ? "View Compiled Smart Contract" : "Create Smart Contract"),
        backgroundColor: Colors.black,
        leading: IconButton(
          onPressed: () async {
            final confirmed = await ConfirmDialog.show(
              title: "Are you sure you want to close the smart contract creator?",
              body: "All unsaved changes will be lost.",
              cancelText: "Cancel",
              confirmText: "Continue",
            );

            if (confirmed == true) {
              ref.read(createSmartContractProvider.notifier).clearSmartContract();
              AutoRouter.of(context).pop();
            }
          },
          icon: const Icon(Icons.close),
        ),
        // actions: [HelpButton(HelpType.smartContract)],
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: PopupMenuButton<Wallet>(
                onSelected: (wallet) {
                  ref.read(sessionProvider.notifier).setCurrentWallet(wallet);
                },
                color: Color(0xFF080808),
                constraints: const BoxConstraints(
                  minWidth: 2.0 * 56.0,
                  maxWidth: 8.0 * 56.0,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Minter Address:",
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Text(
                      selectedWallet?.address ?? "None",
                      style: TextStyle(
                        fontSize: 12,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                    Transform.translate(
                      offset: Offset(0, 2),
                      child: Icon(
                        Icons.arrow_drop_down,
                        size: 18,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                itemBuilder: (context) {
                  return wallets.map((w) {
                    return PopupMenuItem(
                      value: w,
                      child: Text(
                        "${w.address} (${w.balance} VFX)",
                        style: TextStyle(
                          fontSize: 12,
                          color: w.address == selectedWallet?.address ? Theme.of(context).colorScheme.secondary : Colors.white,
                        ),
                      ),
                    );
                  }).toList();
                }),
          ),
          // TextButton(
          //   onPressed: () {
          //     AutoRouter.of(context).push(const SmartContractDraftsScreenRoute());
          //   },
          //   child: const Text(
          //     "My Drafts",
          //     style: TextStyle(
          //       color: Colors.white,
          //     ),
          //   ),
          // )
        ]);
  }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    return const Padding(padding: EdgeInsets.all(0), child: AutoRouter());
  }
}
