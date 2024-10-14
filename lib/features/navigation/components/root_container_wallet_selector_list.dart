import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/providers/currency_segmented_button_provider.dart';
import '../../../core/theme/components.dart';
import '../../btc/models/btc_account.dart';

import '../../../core/base_component.dart';
import '../../../core/components/buttons.dart';
import '../../../core/providers/session_provider.dart';
import '../../../core/theme/app_theme.dart';
import '../../btc/providers/btc_account_list_provider.dart';
import '../../transactions/components/combined_transactions_list.dart';
import '../../wallet/components/manage_wallet_bottom_sheet.dart';
import '../../wallet/models/wallet.dart';
import '../../wallet/providers/wallet_list_provider.dart';
import '../../wallet/utils.dart';

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
    final mode = ref.watch(currencySegementedButtonProvider);

    switch (mode) {
      case CurrencyType.vfx:
        if (vfxWallets.isEmpty) {
          return Center(
            key: Key("no_vfx"),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "No VFX Accounts",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                SizedBox(
                  height: 8,
                ),
                AppButton(
                  label: "Add Account",
                  onPressed: () {
                    AccountUtils.promptVfxNewOrImport(context, ref);
                  },
                  variant: AppColorVariant.Secondary,
                  icon: Icons.add,
                )
              ],
            ),
          );
        }

        return ListView.builder(
          key: Key("vfx_list"),
          itemCount: vfxWallets.length,
          itemBuilder: (context, index) {
            final w = vfxWallets[index];

            return AppCard(
              padding: 0,
              margin: EdgeInsets.symmetric(vertical: 4),
              child: ManageWalletListTile(wallet: w),
            );
          },
        );
      case CurrencyType.btc:
        if (btcWallets.isEmpty) {
          return Center(
            key: Key("no_btc"),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "No BTC Accounts",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                SizedBox(
                  height: 8,
                ),
                AppButton(
                  label: "Add Account",
                  onPressed: () {
                    AccountUtils.promptBtcNewOrImport(context, ref);
                  },
                  variant: AppColorVariant.Btc,
                  icon: Icons.add,
                )
              ],
            ),
          );
        }
        return ListView.builder(
          key: Key("btc_list"),
          itemCount: btcWallets.length,
          itemBuilder: (context, index) {
            final account = btcWallets[index];
            return AppCard(
              padding: 0,
              margin: EdgeInsets.symmetric(vertical: 4),
              child: ManageWalletBtcListTile(account: account),
            );
          },
        );
      case CurrencyType.any:
        final combined = [...vfxWallets, ...btcWallets];
        if (combined.isEmpty) {
          return Center(
            key: Key("no_any"),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "No Accounts",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                SizedBox(
                  height: 8,
                ),
                AppButton(
                  label: "Add Account",
                  onPressed: () {
                    AccountUtils.promptVfxOrBtc(context, ref);
                  },
                  variant: AppColorVariant.Light,
                  icon: Icons.add,
                )
              ],
            ),
          );
        }
        return ListView.builder(
          key: Key("all_list"),
          itemCount: combined.length,
          itemBuilder: (context, index) {
            final item = combined[index];
            if (item is Wallet) {
              return Padding(
                key: Key("vfx_wallet_${item.address}"),
                padding: const EdgeInsets.only(bottom: 4.0),
                child: IntrinsicHeight(
                  child: Row(
                    children: [
                      CardIndicatorVfx(
                        verticalPadding: 8,
                      ),
                      Expanded(
                        child: AppCard(
                          padding: 0,
                          margin: EdgeInsets.symmetric(vertical: 0),
                          child: ManageWalletListTile(wallet: item),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            } else if (item is BtcAccount) {
              return Padding(
                key: Key("btc_wallet_${item.address}"),
                padding: const EdgeInsets.only(bottom: 8.0),
                child: IntrinsicHeight(
                  child: Row(
                    children: [
                      CardIndicatorBtc(
                        verticalPadding: 8,
                      ),
                      Expanded(
                        child: AppCard(
                          padding: 0,
                          margin: EdgeInsets.symmetric(vertical: 0),
                          child: ManageWalletBtcListTile(account: item),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }
            return SizedBox();
          },
        );
    }
  }
}
