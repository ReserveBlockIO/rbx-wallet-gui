import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rbx_wallet/core/theme/app_theme.dart';
import 'package:rbx_wallet/features/navigation/components/root_container_balance_row_conector.dart';

import '../../../core/app_constants.dart';
import '../../../core/base_component.dart';
import '../../../core/providers/session_provider.dart';

import '../../../core/theme/colors.dart';
import '../../../core/theme/components.dart';
import '../../btc/providers/btc_account_list_provider.dart';
import '../../btc/providers/btc_balance_provider.dart';
import '../../btc/providers/tokenized_bitcoin_list_provider.dart';
import '../../misc/providers/global_balances_expanded_provider.dart';
import '../../transactions/providers/transaction_list_provider.dart';
import '../../wallet/providers/wallet_list_provider.dart';
import 'root_container_top_balance_item.dart';

class RootContainerBalanceRow extends BaseComponent {
  const RootContainerBalanceRow({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vfxBalance = ref.watch(sessionProvider).totalBalance;
    final btcBalance = ref.watch(btcBalanceProvider);

    final allVfxWallets = ref.watch(walletListProvider);
    final vfxWallets = allVfxWallets.where((w) => !w.isReserved);
    final raWallets = allVfxWallets.where((w) => w.isReserved);

    final btcAccounts = ref.watch(btcAccountListProvider);

    final vbtcTokens = ref.watch(tokenizedBitcoinListProvider);

    double vBtcBalance = 0;
    for (final a in vbtcTokens) {
      vBtcBalance += a.myBalance;
    }

    final vfxTxs = ref.watch(transactionListProvider(TransactionListType.All));

    final latestVfxTx = vfxTxs.isEmpty ? null : vfxTxs.first;

    final forceExpand = ref.watch(globalBalancesExpandedProvider);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: RootContainerTopBalanceItem(
            forceExpand: forceExpand,
            heading: vfxBalance != null ? "$vfxBalance VFX" : "0.0 VFX",
            headingColor: AppColors.getBlue(),
            accountCount: raWallets.isNotEmpty && vfxWallets.isNotEmpty
                ? "${vfxWallets.length} Wallet${vfxWallets.length == 1 ? '' : 's'}   ${raWallets.length} Reserve Account${raWallets.length == 1 ? '' : 's'}"
                : "${allVfxWallets.length} Wallet${allVfxWallets.length == 1 ? '' : 's'}",
            actions: [
              AppVerticalIconButton(
                onPressed: () {},
                icon: Icons.wallet,
                label: "View\nAccounts",
                size: AppVerticalIconButtonSize.sm,
              ),
              AppVerticalIconButton(
                onPressed: () {},
                icon: Icons.add,
                label: "Add\nAccount",
                size: AppVerticalIconButtonSize.sm,
              ),
              AppVerticalIconButton(
                onPressed: () {},
                icon: FontAwesomeIcons.coins,
                label: "Get\nVFX",
                size: AppVerticalIconButtonSize.sm,
              ),
            ],
            latestTx: latestVfxTx != null
                ? Builder(builder: (context) {
                    final tx = latestVfxTx;
                    return AppCard(
                      padding: 12,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          if (tx.type == TxType.rbxTransfer)
                            Text(
                              "${tx.amount} VFX",
                              style: TextStyle(
                                color: tx.amount < 0 ? Colors.red.shade500 : Theme.of(context).colorScheme.success,
                                fontWeight: FontWeight.w600,
                              ),
                            )
                          else
                            Text(
                              tx.typeLabel,
                              style: TextStyle(
                                color: AppColors.getBlue(),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          Text(
                            "From: ${tx.fromAddress}\nTo: ${tx.toAddress}",
                            style: TextStyle(
                              fontSize: 11,
                              color: Colors.white.withOpacity(0.9),
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    );
                  })
                : null,
          ),
        ),
        RootContainerBalanceRowConnector(),
        Expanded(
          child: RootContainerTopBalanceItem(
            forceExpand: forceExpand,
            heading: "$vBtcBalance vBTC",
            headingColor: AppColors.getWhite(),
            accountCount: "${vbtcTokens.length} Token${vbtcTokens.length == 1 ? '' : 's'}",
            actions: [
              AppVerticalIconButton(
                onPressed: () {},
                icon: Icons.wallet,
                label: "View\nAccounts",
                size: AppVerticalIconButtonSize.sm,
              ),
              AppVerticalIconButton(
                onPressed: () {},
                icon: FontAwesomeIcons.bitcoin,
                label: "vBTC\nTokens",
                size: AppVerticalIconButtonSize.sm,
              ),
              AppVerticalIconButton(
                onPressed: () {},
                icon: Icons.help_rounded,
                label: "What's\nvBTC",
                size: AppVerticalIconButtonSize.sm,
              ),
            ],
          ),
        ),
        RootContainerBalanceRowConnector(),
        Expanded(
          child: RootContainerTopBalanceItem(
            forceExpand: forceExpand,
            heading: "$btcBalance BTC",
            headingColor: AppColors.getBtc(),
            accountCount: "${btcAccounts.length} Wallet${btcAccounts.length == 1 ? '' : 's'}",
            actions: [
              AppVerticalIconButton(
                onPressed: () {},
                icon: Icons.wallet,
                label: "View\nAccounts",
                size: AppVerticalIconButtonSize.sm,
              ),
              AppVerticalIconButton(
                onPressed: () {},
                icon: Icons.add,
                label: "Add\nAccount",
                size: AppVerticalIconButtonSize.sm,
              ),
              AppVerticalIconButton(
                onPressed: () {},
                icon: FontAwesomeIcons.btc,
                label: "Get\nBTC",
                size: AppVerticalIconButtonSize.sm,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
