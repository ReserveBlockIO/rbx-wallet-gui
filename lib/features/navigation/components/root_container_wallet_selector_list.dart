import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/base_component.dart';
import '../../../core/components/buttons.dart';
import '../../../core/dialogs.dart';
import '../../../core/providers/session_provider.dart';
import '../../../core/theme/app_theme.dart';
import '../../../core/theme/colors.dart';
import '../../../utils/guards.dart';
import '../../../utils/validation.dart';
import '../../btc/providers/btc_account_list_provider.dart';
import '../../encrypt/utils.dart';
import '../../smart_contracts/components/sc_creator/common/modal_container.dart';
import '../../wallet/components/manage_wallet_bottom_sheet.dart';
import '../../wallet/providers/wallet_list_provider.dart';

class RootContainerWalletSelectorList extends BaseComponent {
  const RootContainerWalletSelectorList({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final btcSelected = ref.watch(sessionProvider.select((value) => value.btcSelected));
    final vfxWallets = ref.watch(walletListProvider);

    final btcWallets = ref.watch(btcAccountListProvider);

    final selectedVfxWallet = btcSelected ? null : ref.watch(sessionProvider.select((value) => value.currentWallet));
    final selectedBtcWallet = btcSelected ? ref.watch(sessionProvider.select((value) => value.currentBtcAccount)) : null;

    if (btcSelected) {
      if (btcWallets.isEmpty) {
        return Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "No BTC Accounts",
                style: Theme.of(context).textTheme.caption,
              ),
              SizedBox(
                height: 8,
              ),
              AppButton(
                label: "Add Account",
                onPressed: () {},
                variant: AppColorVariant.Btc,
                icon: Icons.add,
              )
            ],
          ),
        );
      }
      return ListView.builder(
        itemCount: btcWallets.length,
        itemBuilder: (context, index) {
          final account = btcWallets[index];
          return Card(
            color: AppColors.getGray(ColorShade.s50),
            child: ManageWalletBtcListTile(account: account),
          );
        },
      );
    }

    if (vfxWallets.isEmpty) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "No VFX Accounts",
              style: Theme.of(context).textTheme.caption,
            ),
            SizedBox(
              height: 8,
            ),
            AppButton(
              label: "Add Account",
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return ModalContainer(
                        children: [
                          Card(
                            color: AppColors.getGray(),
                            child: ListTile(
                              title: Text("Import Private Key"),
                              leading: Icon(Icons.upload),
                              onTap: () async {
                                if (!await passwordRequiredGuard(context, ref)) return;
                                if (!widgetGuardWalletIsNotResyncing(ref)) return;

                                PromptModal.show(
                                  title: "Import Private Key",
                                  // titleTrailing: InkWell(
                                  //   child: const Text(
                                  //     "Bulk Import",
                                  //     style: TextStyle(
                                  //       fontSize: 12,
                                  //       // decoration: TextDecoration.underline,
                                  //       color: Colors.white70,
                                  //     ),
                                  //   ),
                                  //   onTap: () {
                                  //     Navigator.of(rootNavigatorKey.currentContext!).pop();

                                  //     showModalBottomSheet(
                                  //         context: rootNavigatorKey.currentContext!,
                                  //         builder: (context) {
                                  //           return const BulkImportWalletModal();
                                  //         });
                                  //   },
                                  // ),
                                  validator: (String? value) => formValidatorNotEmpty(value, "Private Key"),
                                  labelText: "Private Key",
                                  inputFormatters: [FilteringTextInputFormatter.allow(RegExp('[a-zA-Z0-9]'))],
                                  lines: 4,

                                  onValidSubmission: (value) async {
                                    final resync = await ConfirmDialog.show(
                                      title: "Rescan Blocks?",
                                      body: "Would you like to rescan the chain to include any transactions relevant to this key?",
                                      confirmText: "Yes",
                                      cancelText: "No",
                                    );

                                    await ref.read(walletListProvider.notifier).import(value, false, resync == true);
                                  },
                                );
                              },
                            ),
                          ),
                          Card(
                            color: AppColors.getGray(),
                            child: ListTile(
                              title: Text("Create New Account"),
                              leading: Icon(Icons.add),
                              onTap: () async {
                                if (!await passwordRequiredGuard(context, ref)) return;

                                await ref.read(walletListProvider.notifier).create();
                              },
                            ),
                          )
                        ],
                      );
                    });
              },
              variant: AppColorVariant.Secondary,
              icon: Icons.add,
            )
          ],
        ),
      );
    }

    return ListView.builder(
      itemCount: vfxWallets.length,
      itemBuilder: (context, index) {
        final w = vfxWallets[index];

        return Card(
          color: AppColors.getGray(ColorShade.s50),
          child: ManageWalletListTile(wallet: w),
        );
      },
    );
  }
}
