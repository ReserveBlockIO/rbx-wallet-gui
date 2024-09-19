import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rbx_wallet/core/base_component.dart';
import 'package:rbx_wallet/core/base_screen.dart';
import 'package:rbx_wallet/core/components/badges.dart';
import 'package:rbx_wallet/core/components/currency_segmented_button.dart';
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
import 'package:rbx_wallet/features/home/components/vfx_summary.dart';
import 'package:rbx_wallet/features/wallet/components/wallet_selector.dart';
import 'package:rbx_wallet/features/wallet/models/wallet.dart';
import 'package:rbx_wallet/features/wallet/providers/wallet_list_provider.dart';

import '../../../core/theme/colors.dart';
import '../../price/components/price_chart.dart';

class NewHomeScreen extends BaseScreen {
  const NewHomeScreen({
    super.key,
    super.verticalPadding = 0,
    super.horizontalPadding = 0,
  });

  @override
  AppBar? appBar(BuildContext context, WidgetRef ref) {
    return null;
    // return AppBar(
    //   // title: const Text("VFX Dashboard"),
    //   // backgroundColor: AppColors.getBlue(ColorShade.s50).withOpacity(0.1),
    //   backgroundColor: Colors.transparent,

    //   shadowColor: Colors.transparent,
    //   centerTitle: true,
    //   actions: const [WalletSelector()],
    // );
  }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(16.0).copyWith(top: 250),
      child: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: CoinPriceSummary(
                    type: CoinPriceSummaryType.vfx,
                  ),
                ),
                SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: CoinPriceSummary(
                    type: CoinPriceSummaryType.btc,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: CommonActions(),
          ),
          SizedBox(
            height: 4,
          ),
        ],
      ),
    );
  }
}

class CommonActions extends StatelessWidget {
  const CommonActions({super.key});

  @override
  Widget build(BuildContext context) {
    return AppCard(
      padding: 6,
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
              label: "Receive\nCoin",
              icon: Icons.arrow_downward,
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
