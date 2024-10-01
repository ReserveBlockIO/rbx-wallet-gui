import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/breakpoints.dart';
import '../../../core/app_constants.dart';
import '../../../core/dialogs.dart';
import '../../../core/env.dart';
import '../../../core/providers/session_provider.dart';
import '../../../core/providers/web_session_provider.dart';
import '../components/sc_wizard_list.dart';
import '../models/bulk_smart_contract_entry.dart';
import 'sc_wizard_edit_item_screen.dart';
import '../../wallet/components/wallet_selector.dart';
import 'package:collection/collection.dart';
import '../../../utils/toast.dart';

import '../../../core/base_screen.dart';
import '../../../core/components/buttons.dart';
import '../../../core/theme/app_theme.dart';
import '../providers/sc_wizard_provider.dart';

class SmartContractWizardScreen extends BaseScreen {
  const SmartContractWizardScreen({Key? key})
      : super(
          key: key,
          verticalPadding: 0,
          horizontalPadding: 0,
        );

  @override
  AppBar? appBar(BuildContext context, WidgetRef ref) {
    return AppBar(
      title: const Text("NFT Collection Wizard"),
      backgroundColor: Colors.black12,
      shadowColor: Colors.transparent,
      actions: [
        !Env.isWeb ? WalletSelector() : SizedBox.shrink(),
      ],
      leading: IconButton(
          onPressed: () async {
            final confirmed = await ConfirmDialog.show(
              title: "Are you sure you want to close the NFT collection Wizard?",
              body: "All unsaved changes will be lost.",
              cancelText: "Cancel",
              confirmText: "Continue",
            );
            if (confirmed == true) {
              ref.read(scWizardProvider.notifier).clear();
              Navigator.of(context).pop();
            }
          },
          icon: Icon(Icons.chevron_left)),
    );
  }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    final provider = ref.read(scWizardProvider.notifier);
    final items = ref.watch(scWizardProvider);
    final isMobile = BreakPoints.useMobileLayout(context);
    return Column(
      children: [
        const Expanded(child: ScWizardList()),
        if (items.isNotEmpty)
          Container(
            color: Colors.black87,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  AppButton(
                    label: "Clear",
                    onPressed: () async {
                      if (items.isEmpty) {
                        provider.clear();
                        Navigator.of(context).pop();
                        return;
                      }

                      final confirmed = await ConfirmDialog.show(
                        title: "Clear NFT Collection Wizard?",
                        body: "Are you sure you want to remove everything?",
                        cancelText: "Cancel",
                        confirmText: "Clear",
                        destructive: true,
                      );

                      if (confirmed == true) {
                        provider.clear();
                        Navigator.of(context).pop();
                      }
                    },
                    variant: AppColorVariant.Danger,
                  ),
                  AppButton(
                    label: "${isMobile ? '' : 'Create'} New Instance",
                    onPressed: () {
                      provider.insert(
                        entry: BulkSmartContractEntry.empty(),
                        index: items.length,
                        y: 0,
                        x: 0,
                      );

                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => ScWizardEditItemScreen(
                            title: "Create Instance",
                            index: items.length,
                          ),
                        ),
                      );
                    },
                    variant: AppColorVariant.Primary,
                  ),
                  AppButton(
                    label: isMobile ? "Mint" : "Compile & Mint",
                    onPressed: () async {
                      final wallet = kIsWeb ? ref.read(webSessionProvider).currentWallet : ref.read(sessionProvider).currentWallet;
                      if (wallet == null) {
                        Toast.error("No account selected.");

                        return;
                      }

                      final amount = items.map((e) => e.entry.quantity).toList().sum;
                      if (amount < 1) {
                        return;
                      }

                      if (!kIsWeb) {
                        if (wallet.balance < MIN_RBX_FOR_SC_ACTION) {
                          Toast.error("Not enough VFX balance to mint a smart contract.");
                          return;
                        }
                      }

                      final confirmed = await ConfirmDialog.show(
                        title: "Compile & Mint Smart Contract?",
                        body:
                            "Are you sure you want to proceed minting $amount Smart Contract${amount == 1 ? '' : 's'}?\n\nOnce compiled you will not be able to make any changes\nand the smart contract will be deployed to the chain.",
                        confirmText: "Continue",
                        cancelText: "Cancel",
                      );

                      if (confirmed == true) {
                        final extraConfirm = await ConfirmDialog.show(
                          title: "Confirm Address",
                          body: "This will be minted by ${wallet.labelWithoutTruncation}",
                          confirmText: "Compile & Mint",
                          cancelText: "Cancel",
                        );

                        if (extraConfirm == true) {
                          ref.read(scWizardProvider.notifier).mint(context);
                        }
                      }
                    },
                    variant: AppColorVariant.Success,
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }
}
