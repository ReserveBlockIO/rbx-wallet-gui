import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rbx_wallet/core/base_component.dart';
import 'package:rbx_wallet/core/base_screen.dart';
import 'package:rbx_wallet/core/components/badges.dart';
import 'package:rbx_wallet/core/providers/session_provider.dart';
import 'package:rbx_wallet/core/theme/app_theme.dart';
import 'package:rbx_wallet/core/theme/components.dart';
import 'package:rbx_wallet/features/bridge/providers/status_provider.dart';
import 'package:rbx_wallet/features/bridge/providers/wallet_info_provider.dart';
import 'package:rbx_wallet/features/btc/models/btc_account.dart';
import 'package:rbx_wallet/features/btc/providers/btc_account_list_provider.dart';
import 'package:rbx_wallet/features/btc/providers/btc_balance_provider.dart';
import 'package:rbx_wallet/features/btc/providers/electrum_connected_provider.dart';
import 'package:rbx_wallet/features/btc/providers/tokenized_bitcoin_list_provider.dart';
import 'package:rbx_wallet/features/home/components/home_buttons.dart';
import 'package:rbx_wallet/features/wallet/components/wallet_selector.dart';
import 'package:rbx_wallet/features/wallet/models/wallet.dart';
import 'package:rbx_wallet/features/wallet/providers/wallet_list_provider.dart';

import '../../../core/theme/colors.dart';

class NewHomeScreen extends BaseScreen {
  const NewHomeScreen({
    super.key,
    super.verticalPadding = 0,
    super.horizontalPadding = 0,
    super.backgroundColor = Colors.black,
  });

  @override
  AppBar? appBar(BuildContext context, WidgetRef ref) {
    return AppBar(
      // title: const Text("VFX Dashboard"),
      // backgroundColor: AppColors.getBlue(ColorShade.s50).withOpacity(0.1),
      backgroundColor: Colors.transparent,

      shadowColor: Colors.transparent,
      centerTitle: true,
      actions: const [WalletSelector()],
    );
  }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: AppCard(
              fullWidth: true,
              child: HomeButtons(
                includeRestoreHd: ref.watch(walletListProvider).isEmpty,
              ),
            ),
            // child: IntrinsicHeight(
            //   child: Row(
            //     crossAxisAlignment: CrossAxisAlignment.stretch,
            //     children: [
            //       Expanded(
            //         child: AppCard(
            //           fullWidth: true,
            //           child: HomeButtons(
            //             includeRestoreHd: ref.watch(walletListProvider).isEmpty,
            //           ),
            //         ),
            //       ),
            //       SizedBox(width: 16),
            //       SyncingAndStatus()
            //     ],
            //   ),
            // ),
          ),
          SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: _MainActions(),
            // child: IntrinsicHeight(
            //   child: Row(
            //     crossAxisAlignment: CrossAxisAlignment.stretch,
            //     children: [
            //       _Balance(),
            //       SizedBox(width: 16),
            //       Expanded(child: _MainActions()),
            //     ],
            //   ),
            // ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            // child: _WalletList(),
            child: _BalanceRow(),
          ),
        ],
      ),
    );
  }
}

class _BalanceRow extends BaseComponent {
  const _BalanceRow({
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

    return IntrinsicHeight(
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: AppCard(
                child: Column(
                  children: [
                    Text(
                      vfxBalance != null ? "$vfxBalance VFX" : "0.0 VFX",
                      style: TextStyle(
                        color: AppColors.getBlue(),
                        fontSize: 24,
                      ),
                    ),
                    Text(
                      raWallets.isNotEmpty && vfxWallets.isNotEmpty
                          ? "${vfxWallets.length} Wallet${vfxWallets.length == 1 ? '' : 's'}   ${raWallets.length} Reserve Account${raWallets.length == 1 ? '' : 's'}"
                          : "${allVfxWallets.length} Wallet${allVfxWallets.length == 1 ? '' : 's'}",
                      style: Theme.of(context).textTheme.caption,
                    ),
                    SizedBox(height: 16),
                    Wrap(
                      children: [
                        AppVerticalIconButton(
                          onPressed: () {},
                          icon: Icons.wallet,
                          label: "View\nWallets",
                          size: AppVerticalIconButtonSize.sm,
                        ),
                        AppVerticalIconButton(
                          onPressed: () {},
                          icon: Icons.add,
                          label: "Add\nWallet",
                          size: AppVerticalIconButtonSize.sm,
                        ),
                        AppVerticalIconButton(
                          onPressed: () {},
                          icon: FontAwesomeIcons.coins,
                          iconScale: 0.75,
                          label: "Get\nVFX",
                          size: AppVerticalIconButtonSize.sm,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: AppCard(
                child: Column(
                  children: [
                    Text(
                      "${btcBalance.toStringAsFixed(9)} BTC",
                      style: TextStyle(
                        color: AppColors.getBtc(),
                        fontSize: 24,
                      ),
                    ),
                    Text(
                      "${btcAccounts.length} Wallet${btcAccounts.length == 1 ? '' : 's'}",
                      style: Theme.of(context).textTheme.caption,
                    ),
                    SizedBox(height: 16),
                    Wrap(
                      children: [
                        AppVerticalIconButton(
                          onPressed: () {},
                          icon: Icons.wallet,
                          label: "View\nAccounts",
                          size: AppVerticalIconButtonSize.sm,
                        ),
                        AppVerticalIconButton(
                          onPressed: () {},
                          icon: Icons.add,
                          label: "Add\nWallet",
                          size: AppVerticalIconButtonSize.sm,
                        ),
                        AppVerticalIconButton(
                          onPressed: () {},
                          icon: FontAwesomeIcons.btc,
                          iconScale: 0.75,
                          label: "Get\nBTC",
                          size: AppVerticalIconButtonSize.sm,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: AppCard(
                child: Column(
                  children: [
                    Text(
                      "$vBtcBalance vBTC",
                      style: TextStyle(
                        color: AppColors.getWhite(),
                        fontSize: 24,
                      ),
                    ),
                    Text(
                      "${vbtcTokens.length} Token${vbtcTokens.length == 1 ? '' : 's'}",
                      style: Theme.of(context).textTheme.caption,
                    ),
                    SizedBox(height: 16),
                    Wrap(
                      children: [
                        AppVerticalIconButton(
                          onPressed: () {},
                          icon: Icons.wallet,
                          label: "View\nAccounts",
                          size: AppVerticalIconButtonSize.sm,
                        ),
                        AppVerticalIconButton(
                          onPressed: () {},
                          icon: FontAwesomeIcons.bitcoin,
                          iconScale: 0.75,
                          label: "Tokenize\nvBTC",
                          size: AppVerticalIconButtonSize.sm,
                        ),
                        AppVerticalIconButton(
                          onPressed: () {},
                          icon: Icons.help_rounded,
                          label: "What's\nvBTC",
                          size: AppVerticalIconButtonSize.sm,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Balance extends ConsumerWidget {
  const _Balance({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final totalBalance = ref.watch(sessionProvider).totalBalance;
    final btcBalance = ref.watch(btcBalanceProvider);

    double vBtcBalance = 0;
    for (final a in ref.watch(tokenizedBitcoinListProvider)) {
      vBtcBalance += a.myBalance;
    }

    int highlight = 0;

    return AppCard(
      child: StatefulBuilder(builder: (context, setState) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Total Balance",
                style: TextStyle(
                  color: AppColors.getWhite(
                    ColorShade.s300,
                  ),
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: 4,
              ),
              MouseRegion(
                onHover: (_) {
                  setState(() {
                    highlight = 0;
                  });
                },
                child: AnimatedScale(
                  scale: highlight == 0 ? 1.25 : 1,
                  duration: Duration(milliseconds: 100),
                  child: Text(
                    totalBalance != null ? "$totalBalance VFX" : "0.0 VFX",
                    style: Theme.of(context).textTheme.caption!.copyWith(
                          fontWeight: FontWeight.w400,
                          color: AppColors.getBlue(),
                          fontSize: 18,
                          height: 1.3,
                        ),
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              MouseRegion(
                onHover: (_) {
                  setState(() {
                    highlight = 1;
                  });
                },
                child: AnimatedScale(
                  scale: highlight == 1 ? 1.25 : 1,
                  duration: Duration(milliseconds: 100),
                  child: Text(
                    "${btcBalance.toStringAsFixed(9)} BTC",
                    style: Theme.of(context).textTheme.caption!.copyWith(
                          fontWeight: FontWeight.w600,
                          color: AppColors.getBtcSubtle(),
                          fontSize: 18,
                          height: 1.3,
                        ),
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              MouseRegion(
                onHover: (_) {
                  setState(() {
                    highlight = 2;
                  });
                },
                child: AnimatedScale(
                  scale: highlight == 2 ? 1.25 : 1,
                  duration: Duration(milliseconds: 100),
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      style: Theme.of(context).textTheme.caption!.copyWith(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            height: 1.3,
                          ),
                      children: [
                        TextSpan(
                          text: "$vBtcBalance",
                          style: TextStyle(color: Colors.white),
                        ),
                        TextSpan(
                          text: " ",
                        ),
                        TextSpan(
                          text: "v",
                          style: TextStyle(
                            color: AppColors.getBlue(),
                          ),
                        ),
                        TextSpan(
                          text: "BTC",
                          style: TextStyle(color: Colors.white70),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}

class _MainActions extends StatelessWidget {
  const _MainActions({super.key});

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Center(
        child: Wrap(
          spacing: 8,
          runSpacing: 8,
          alignment: WrapAlignment.center,
          children: [
            AppVerticalIconButton(
              label: "Add\nWallet",
              icon: Icons.add,
              onPressed: () {},
              color: AppColors.getBlue(),
              hoverColor: AppColors.getBlue(ColorShade.s50),
            ),
            AppVerticalIconButton(
              label: "Send\nCoin",
              icon: Icons.arrow_upward,
              onPressed: () {},
              color: AppColors.getBlue(),
              hoverColor: AppColors.getBlue(ColorShade.s50),
            ),
            AppVerticalIconButton(
              label: "TX\nHistory",
              icon: Icons.history,
              onPressed: () {},
              color: AppColors.getBlue(),
              hoverColor: AppColors.getBlue(ColorShade.s50),
            ),
            AppVerticalIconButton(
              label: "Tokenize\nBTC",
              icon: FontAwesomeIcons.bitcoin,
              onPressed: () {},
              color: AppColors.getBlue(),
              hoverColor: AppColors.getBlue(ColorShade.s50),
            ),
            AppVerticalIconButton(
              label: "Mint\nNFT",
              icon: Icons.lightbulb_outline,
              onPressed: () {},
              color: AppColors.getBlue(),
              hoverColor: AppColors.getBlue(ColorShade.s50),
            ),
          ],
        ),
      ),
    );
  }
}

// class _WalletList extends BaseComponent {
//   _WalletList({super.key});

//   final scrollController = ScrollController();

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final session = ref.watch(sessionProvider);
//     final vfxWallets = ref.watch(walletListProvider).where((w) => w.balance > 0).toList()..sort((a, b) => a.balance > b.balance ? 1 : -1);
//     final btcWallets = ref.watch(btcAccountListProvider).where((w) => w.balance > 0).toList()..sort((a, b) => a.balance > b.balance ? 1 : -1);

//     final wallets = [...vfxWallets, ...btcWallets];

//     final selectedVfxWallet = session.currentWallet;
//     final btcSelected = session.btcSelected;
//     final selectedBtcWallet = session.currentBtcAccount;

//     return SizedBox(
//       height: 210,
//       child: Scrollbar(
//         // thumbVisibility: true,
//         controller: scrollController,
//         child: Padding(
//           padding: const EdgeInsets.only(bottom: 16.0, right: 16),
//           child: ListView.builder(
//             controller: scrollController,
//             scrollDirection: Axis.horizontal,
//             itemCount: wallets.length,
//             itemBuilder: (context, index) {
//               final wallet = wallets[index];

//               return Padding(
//                 padding: const EdgeInsets.only(left: 16.0),
//                 child: Builder(builder: (context) {
//                   if (wallet is Wallet) {
//                     final isSelected = !btcSelected && selectedVfxWallet?.address == wallet.address;

//                     bool isHovering = false;
//                     return StatefulBuilder(builder: (context, setState) {
//                       return MouseRegion(
//                         onEnter: (_) {
//                           setState(() {
//                             isHovering = true;
//                           });
//                         },
//                         onExit: (_) {
//                           setState(() {
//                             isHovering = false;
//                           });
//                         },
//                         cursor: SystemMouseCursors.click,
//                         child: GestureDetector(
//                           onTap: () {
//                             ref.read(sessionProvider.notifier).setCurrentWallet(wallet);
//                           },
//                           child: AppCard(
//                             padding: 10,
//                             borderColor: isSelected ? AppColors.getSpringGreen() : null,
//                             child: SizedBox(
//                               width: 250,
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.center,
//                                 mainAxisSize: MainAxisSize.min,
//                                 children: [
//                                   AnimatedOpacity(
//                                     duration: Duration(milliseconds: 150),
//                                     opacity: isSelected ? 1 : 0,
//                                     child: Align(
//                                       alignment: Alignment.topLeft,
//                                       child: Tooltip(
//                                         message: isSelected ? "Active Wallet" : "",
//                                         child: Icon(
//                                           Icons.check_circle,
//                                           color: AppColors.getSpringGreen(),
//                                           size: 20,
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                   Text(
//                                     "${wallet.availableBalance} VFX",
//                                     style: TextStyle(
//                                       fontSize: 24,
//                                     ),
//                                   ),
//                                   Text(
//                                     wallet.adnr != null ? wallet.adnr! : wallet.address,
//                                     maxLines: 1,
//                                     overflow: TextOverflow.ellipsis,
//                                     style: TextStyle(
//                                       fontSize: 12,
//                                       color: wallet.isReserved ? AppColors.getReserve() : AppColors.getBlue(),
//                                     ),
//                                   ),
//                                   SizedBox(height: 12),
//                                   AnimatedOpacity(
//                                     duration: Duration(milliseconds: 150),
//                                     opacity: isHovering || isSelected ? 1 : 0.1,
//                                     child: Row(
//                                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                                       children: [
//                                         AppVerticalIconButton(
//                                           label: "Send\nCoin",
//                                           icon: Icons.arrow_upward,
//                                           size: AppVerticalIconButtonSize.sm,
//                                           onPressed: () {},
//                                         ),
//                                         AppVerticalIconButton(
//                                           label: "Receive\nCoin",
//                                           icon: Icons.arrow_downward,
//                                           size: AppVerticalIconButtonSize.sm,
//                                           onPressed: () {},
//                                         ),
//                                         AppVerticalIconButton(
//                                           label: "Get\nInfo",
//                                           icon: Icons.info_outline,
//                                           size: AppVerticalIconButtonSize.sm,
//                                           onPressed: () {},
//                                         ),
//                                         AppVerticalIconButton(
//                                           label: "Copy\nAddress",
//                                           icon: Icons.copy,
//                                           size: AppVerticalIconButtonSize.sm,
//                                           onPressed: () {},
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ),
//                       );
//                     });
//                   }

//                   if (wallet is BtcAccount) {
//                     final isSelected = btcSelected && selectedBtcWallet?.address == wallet.address;
//                     bool isHovering = false;
//                     return StatefulBuilder(builder: (context, setState) {
//                       return MouseRegion(
//                         onHover: (_) {
//                           setState(() {
//                             isHovering = true;
//                           });
//                         },
//                         onExit: (_) {
//                           setState(() {
//                             isHovering = false;
//                           });
//                         },
//                         cursor: SystemMouseCursors.click,
//                         child: GestureDetector(
//                           onTap: () {
//                             ref.read(sessionProvider.notifier).setCurrentBtcAccount(wallet);
//                           },
//                           child: AppCard(
//                             padding: 10,
//                             borderColor: isSelected ? AppColors.getSpringGreen() : null,
//                             child: SizedBox(
//                               width: 250,
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.center,
//                                 mainAxisSize: MainAxisSize.min,
//                                 children: [
//                                   AnimatedOpacity(
//                                     duration: Duration(milliseconds: 150),
//                                     opacity: isSelected ? 1 : 0,
//                                     child: Align(
//                                       alignment: Alignment.topLeft,
//                                       child: Tooltip(
//                                         message: isSelected ? "Active Wallet" : "",
//                                         child: Icon(
//                                           Icons.check_circle,
//                                           color: AppColors.getSpringGreen(),
//                                           size: 20,
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                   Text(
//                                     "${wallet.balance} BTC",
//                                     style: TextStyle(
//                                       fontSize: 24,
//                                     ),
//                                   ),
//                                   Text(
//                                     wallet.adnr != null ? wallet.adnr! : wallet.address,
//                                     maxLines: 1,
//                                     overflow: TextOverflow.ellipsis,
//                                     style: TextStyle(fontSize: 12, color: AppColors.getBtcSubtle()),
//                                   ),
//                                   SizedBox(height: 12),
//                                   AnimatedOpacity(
//                                     duration: Duration(milliseconds: 150),
//                                     opacity: isHovering || isSelected ? 1 : 0.1,
//                                     child: Row(
//                                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                                       children: [
//                                         AppVerticalIconButton(
//                                           label: "Send\nCoin",
//                                           icon: Icons.arrow_upward,
//                                           size: AppVerticalIconButtonSize.sm,
//                                           onPressed: () {},
//                                         ),
//                                         AppVerticalIconButton(
//                                           label: "Receive\nCoin",
//                                           icon: Icons.arrow_downward,
//                                           size: AppVerticalIconButtonSize.sm,
//                                           onPressed: () {},
//                                         ),
//                                         AppVerticalIconButton(
//                                           label: "Get\nInfo",
//                                           icon: Icons.info_outline,
//                                           size: AppVerticalIconButtonSize.sm,
//                                           onPressed: () {},
//                                         ),
//                                         AppVerticalIconButton(
//                                           label: "Copy\nAddress",
//                                           icon: Icons.copy,
//                                           size: AppVerticalIconButtonSize.sm,
//                                           onPressed: () {},
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ),
//                       );
//                     });
//                   }

//                   return SizedBox();
//                 }),
//               );
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }
