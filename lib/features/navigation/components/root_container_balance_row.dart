import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rbx_wallet/core/dialogs.dart';
import 'package:rbx_wallet/core/providers/currency_segmented_button_provider.dart';
import 'package:rbx_wallet/core/theme/app_theme.dart';
import 'package:rbx_wallet/features/btc/models/btc_transaction.dart';
import 'package:rbx_wallet/features/btc/providers/btc_transaction_list_provider.dart';
import 'package:rbx_wallet/features/navigation/components/root_container_balance_item.dart';
import 'package:rbx_wallet/features/navigation/constants.dart';
import 'package:rbx_wallet/features/navigation/root_container.dart';
import 'package:rbx_wallet/features/navigation/utils.dart';
import 'package:rbx_wallet/features/transactions/models/transaction.dart';
import 'package:rbx_wallet/features/wallet/utils.dart';
import 'package:collection/collection.dart';
import '../../../core/app_constants.dart';
import '../../../core/base_component.dart';
import '../../../core/providers/session_provider.dart';

import '../../../core/theme/colors.dart';
import '../../../core/theme/components.dart';
import '../../../core/theme/pretty_icons.dart';
import '../../btc/providers/btc_account_list_provider.dart';
import '../../btc/providers/btc_balance_provider.dart';
import '../../btc/providers/tokenized_bitcoin_list_provider.dart';
import '../../btc/screens/tokenized_btc_list_screen.dart';
import '../../image_sequencer/image_sequencer.dart';
import '../../misc/providers/global_balances_expanded_provider.dart';
import '../../transactions/providers/transaction_list_provider.dart';
import '../../wallet/providers/wallet_list_provider.dart';
import '../../wallet/screens/accounts_screen.dart';

class RootContainerBalanceRow extends BaseComponent {
  final bool isHovering;
  const RootContainerBalanceRow({
    super.key,
    required this.isHovering,
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

    final btcTxs = ref.watch(btcTransactionListProvider);
    final latestBtcTx = btcTxs.isEmpty ? null : btcTxs.first;

    final forceExpand = ref.watch(globalBalancesExpandedProvider);

    Transaction? latestVbtcVfxTx;
    BtcTransaction? latestVbtcBtcTx;
    if (vbtcTokens.isNotEmpty) {
      final vbtcAddresses = vbtcTokens.map((e) => e.btcAddress).toList();
      latestVbtcVfxTx = vfxTxs.firstWhereOrNull((tx) => tx.isVbtcTx);
      latestVbtcBtcTx = btcTxs.firstWhereOrNull((tx) => vbtcAddresses.contains(tx.toAddress) || vbtcAddresses.contains(tx.fromAddress));
    }

    if (latestVbtcBtcTx != null && latestVbtcVfxTx != null) {
      if (latestVbtcBtcTx.timestamp > latestVbtcVfxTx.timestamp) {
        latestVbtcVfxTx = null;
      } else {
        latestVbtcBtcTx = null;
      }
    }

    return LayoutBuilder(builder: (context, constraints) {
      final availableWidth = constraints.maxWidth;

      final connector1Left = (availableWidth / 3) - 10;
      final connector2Left = (availableWidth / 3) + (availableWidth / 3) - 5;
      return Stack(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: RootContainerBalanceItem(
                  topIndicator: Image.asset(
                    "assets/images/cube_still.png",
                    width: 32,
                    height: 32,
                  ),
                  forceExpand: forceExpand,
                  heading: vfxBalance != null ? "$vfxBalance VFX" : "0.0 VFX",
                  headingColor: AppColors.getBlue(),
                  accountCount: raWallets.isNotEmpty && vfxWallets.isNotEmpty
                      ? "${vfxWallets.length} Address${vfxWallets.length == 1 ? '' : 'es'}   ${raWallets.length} Vault Address${raWallets.length == 1 ? '' : 'es'}"
                      : "${allVfxWallets.length} Address${allVfxWallets.length == 1 ? '' : 'es'}",
                  handleViewAllTxs: () {
                    ref.read(currencySegementedButtonProvider.notifier).set(CurrencyType.vfx);
                    RootContainerUtils.navigateToTab(context, RootTab.transactions);
                  },
                  actions: [
                    AppVerticalIconButton(
                      onPressed: () {
                        ref.read(currencySegementedButtonProvider.notifier).set(CurrencyType.vfx);
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            fullscreenDialog: true,
                            builder: (_) => AccountsScreen(),
                          ),
                        );
                      },
                      icon: Icons.wallet,
                      label: "View\nAddress",
                      prettyIconType: PrettyIconType.custom,
                    ),
                    AppVerticalIconButton(
                      onPressed: () {
                        AccountUtils.promptVfxNewOrImport(context, ref);
                      },
                      icon: Icons.add,
                      label: "New\nAddress",
                      prettyIconType: PrettyIconType.custom,
                    ),
                    AppVerticalIconButton(
                      onPressed: () {
                        AccountUtils.getCoin(context, ref, VfxOrBtcOption.vfx);
                      },
                      icon: FontAwesomeIcons.coins,
                      label: "Get\nVFX",
                      prettyIconType: PrettyIconType.custom,
                      iconScale: 0.75,
                    ),
                  ],
                  latestTx: latestVfxTx != null ? _LatestVfxTx(tx: latestVfxTx) : null,
                ),
              ),
              SizedBox(
                width: 16,
              ),
              Expanded(
                child: RootContainerBalanceItem(
                  topIndicator: Container(
                    decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(32)),
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Image.asset(
                        "assets/images/vbtc_small.png",
                        width: 32,
                        height: 32,
                      ),
                    ),
                  ),
                  forceExpand: forceExpand,
                  heading: "$vBtcBalance vBTC",
                  headingColor: AppColors.getWhite(),
                  accountCount: "${vbtcTokens.length} Token${vbtcTokens.length == 1 ? '' : 's'}",
                  handleViewAllTxs: () {
                    RootContainerUtils.navigateToTab(context, RootTab.vbtc);
                  },
                  latestTx: latestVbtcBtcTx != null
                      ? _LatestBtcTx(tx: latestVbtcBtcTx)
                      : latestVbtcVfxTx != null
                          ? _LatestVfxTx(tx: latestVbtcVfxTx)
                          : null,
                  actions: [
                    AppVerticalIconButton(
                      onPressed: () {
                        RootContainerUtils.navigateToTab(context, RootTab.vbtc);
                      },
                      icon: FontAwesomeIcons.bitcoin,
                      prettyIconType: PrettyIconType.custom,
                      label: "vBTC\nTokens",
                    ),
                    AppVerticalIconButton(
                      onPressed: () {
                        SpecialDialog().show(
                          context,
                          content: VbtcInfo(),
                          title: "vBTC",
                          maxWidth: 800,
                        );
                      },
                      prettyIconType: PrettyIconType.custom,
                      icon: Icons.help,
                      label: "What's\nvBTC",
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 16,
              ),
              Expanded(
                child: RootContainerBalanceItem(
                  topIndicator: FaIcon(
                    FontAwesomeIcons.bitcoin,
                    color: AppColors.getBtc(),
                    size: 28,
                  ),
                  forceExpand: forceExpand,
                  heading: "$btcBalance BTC",
                  headingColor: AppColors.getBtc(),
                  accountCount: "${btcAccounts.length} Account${btcAccounts.length == 1 ? '' : 's'}",
                  handleViewAllTxs: () {
                    ref.read(currencySegementedButtonProvider.notifier).set(CurrencyType.btc);
                    RootContainerUtils.navigateToTab(context, RootTab.transactions);
                  },
                  actions: [
                    AppVerticalIconButton(
                      onPressed: () {
                        ref.read(currencySegementedButtonProvider.notifier).set(CurrencyType.btc);
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            fullscreenDialog: true,
                            builder: (_) => AccountsScreen(),
                          ),
                        );
                      },
                      prettyIconType: PrettyIconType.custom,
                      icon: Icons.wallet,
                      label: "View\nAddresses",
                    ),
                    AppVerticalIconButton(
                      onPressed: () {
                        AccountUtils.promptBtcNewOrImport(context, ref);
                      },
                      icon: Icons.add,
                      prettyIconType: PrettyIconType.custom,
                      label: "New\nAddress",
                    ),
                    AppVerticalIconButton(
                      onPressed: () {
                        AccountUtils.getCoin(context, ref, VfxOrBtcOption.btc);
                      },
                      icon: FontAwesomeIcons.coins,
                      iconScale: 0.7,
                      label: "Get\nBTC",
                      prettyIconType: PrettyIconType.custom,
                    ),
                  ],
                  latestTx: latestBtcTx != null ? _LatestBtcTx(tx: latestBtcTx) : null,
                ),
              ),
            ],
          ),
          AnimatedPositioned(
            duration: ROOT_CONTAINER_TRANSITION_DURATION,
            curve: Curves.easeInOut,
            top: forceExpand ? ROOT_CONTAINER_BALANCE_ITEM_EXPANDED_HEIGHT / 2 : 0,
            child: IgnorePointer(
              ignoring: true,
              child: Padding(
                padding: EdgeInsets.only(left: connector1Left),
                // child: RootContainerBalanceRowConnector(),
                child: Transform.translate(
                  offset: Offset(-33, 4),
                  child: ConnectorVisual(
                    isBtc: false,
                  ),
                ),
              ),
            ),
          ),
          AnimatedPositioned(
            duration: ROOT_CONTAINER_TRANSITION_DURATION,
            curve: Curves.easeInOut,
            top: forceExpand ? ROOT_CONTAINER_BALANCE_ITEM_EXPANDED_HEIGHT / 2 : 0,
            child: IgnorePointer(
              ignoring: true,
              child: Padding(
                padding: EdgeInsets.only(left: connector2Left),
                child: Transform.translate(
                  offset: Offset(-6, 4),
                  child: ConnectorVisual(
                    isBtc: true,
                  ),
                ),
              ),
            ),
          ),
        ],
      );
    });
  }
}

class _LatestBtcTx extends BaseComponent {
  const _LatestBtcTx({
    required this.tx,
  });

  final BtcTransaction tx;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          ref.read(currencySegementedButtonProvider.notifier).set(CurrencyType.btc);
          RootContainerUtils.navigateToTab(context, RootTab.transactions);
        },
        child: AppCard(
          fullWidth: true,
          padding: 12,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "${tx.amount} BTC",
                style: TextStyle(
                  color: tx.amount < 0 ? Colors.red.shade500 : Theme.of(context).colorScheme.success,
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
              SizedBox(
                height: 2,
              ),
              Text(
                tx.isConfirmed ? "Confirmed" : "Pending",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: tx.isConfirmed ? Theme.of(context).colorScheme.success : Theme.of(context).colorScheme.warning,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _LatestVfxTx extends BaseComponent {
  const _LatestVfxTx({
    required this.tx,
  });

  final Transaction tx;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          ref.read(currencySegementedButtonProvider.notifier).set(CurrencyType.vfx);

          RootContainerUtils.navigateToTab(context, RootTab.transactions);
        },
        child: AppCard(
          padding: 12,
          fullWidth: true,
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
              SizedBox(
                height: 2,
              ),
              Text(
                tx.statusLabel,
                style: TextStyle(
                  color: tx.statusColor(context),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ConnectorVisual extends StatelessWidget {
  final bool isBtc;
  final bool isAnimated;
  const ConnectorVisual({
    super.key,
    required this.isBtc,
    this.isAnimated = true,
  });

  @override
  Widget build(BuildContext context) {
    if (isAnimated) {
      return SizedBox(
        width: 155 / 3,
        height: 118 / 3,
        child: ImageSequenceAnimator(
          isOnline: false,
          folderName: 'assets/images/connector',
          fileName: isBtc ? "connectorb_" : "connectora_",
          fileFormat: 'png',
          frameCount: isBtc ? 45 : 30,
          fps: 30,
          suffixStart: 1,
          suffixCount: 2,
          isLooping: true,
          isAutoPlay: true,
        ),
      );
    }
    return Image.asset(
      isBtc ? 'assets/images/connector2.png' : 'assets/images/connector1.png',
      width: 155 / 3,
      height: 118 / 3,
    );
  }
}
