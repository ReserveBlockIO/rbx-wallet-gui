import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rbx_wallet/core/base_component.dart';
import 'package:rbx_wallet/core/base_screen.dart';
import 'package:rbx_wallet/core/components/badges.dart';
import 'package:rbx_wallet/core/components/currency_segmented_button.dart';
import 'package:rbx_wallet/core/dialogs.dart';
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
import 'package:rbx_wallet/features/navigation/constants.dart';
import 'package:rbx_wallet/features/payment/payment_utils.dart';
import 'package:rbx_wallet/features/price/components/coin_price_summary.dart';
import 'package:rbx_wallet/features/wallet/components/wallet_selector.dart';
import 'package:rbx_wallet/features/wallet/models/wallet.dart';
import 'package:rbx_wallet/features/wallet/providers/wallet_list_provider.dart';
import 'package:rbx_wallet/features/wallet/utils.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../../app.dart';
import '../../../core/env.dart';
import '../../../core/theme/colors.dart';
import '../../price/components/price_chart.dart';
import '../components/common_actions.dart';

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
    final vfxAddress = ref.watch(sessionProvider).currentWallet?.address;

    return Padding(
      padding: const EdgeInsets.all(16.0).copyWith(top: ROOT_CONTAINER_BALANCE_ITEM_EXPANDED_HEIGHT + 16),
      child: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: CoinPriceSummary(
                    type: CoinPriceSummaryType.vfx,
                    actions: [
                      AppVerticalIconButton(
                        onPressed: () {},
                        icon: FontAwesomeIcons.chartLine,
                        label: "View\nChart",
                        size: AppVerticalIconButtonSize.sm,
                      ),
                      // AppVerticalIconButton(
                      //   onPressed: () {},
                      //   icon: FontAwesomeIcons.store,
                      //   label: "View\nTrades",
                      //   size: AppVerticalIconButtonSize.sm,
                      // ),
                      AppVerticalIconButton(
                        onPressed: () async {
                          AccountUtils.getCoin(context, ref, VfxOrBtcOption.vfx);
                        },
                        icon: FontAwesomeIcons.coins,
                        label: "Get\nVFX",
                        size: AppVerticalIconButtonSize.sm,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: CoinPriceSummary(
                    type: CoinPriceSummaryType.btc,
                    actions: [
                      AppVerticalIconButton(
                        onPressed: () {
                          Navigator.of(rootNavigatorKey.currentContext!).push(
                            MaterialPageRoute(
                              fullscreenDialog: true,
                              builder: (_) => PriceChartScreen(),
                            ),
                          );
                        },
                        icon: FontAwesomeIcons.chartLine,
                        label: "View\nChart",
                        size: AppVerticalIconButtonSize.sm,
                      ),
                      // AppVerticalIconButton(
                      //   onPressed: () {},
                      //   icon: FontAwesomeIcons.store,
                      //   label: "View\nTrades",
                      //   size: AppVerticalIconButtonSize.sm,
                      // ),
                      AppVerticalIconButton(
                        onPressed: () {
                          AccountUtils.getCoin(context, ref, VfxOrBtcOption.btc);
                        },
                        icon: FontAwesomeIcons.coins,
                        label: "Get\nBTC",
                        size: AppVerticalIconButtonSize.sm,
                      ),
                    ],
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
