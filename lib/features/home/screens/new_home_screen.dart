import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/base_screen.dart';
import '../../../core/components/buttons.dart';
import '../../../core/providers/currency_segmented_button_provider.dart';
import '../../../core/providers/session_provider.dart';
import '../../../core/theme/app_theme.dart';
import '../../navigation/constants.dart';
import '../../price/components/coin_price_summary.dart';
import '../../wallet/utils.dart';

import '../../../app.dart';
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
    final vfxAddress = ref.watch(sessionProvider.select((v) => v.currentWallet?.address));

    return Padding(
      padding: const EdgeInsets.all(16.0).copyWith(top: ROOT_CONTAINER_BALANCE_ITEM_EXPANDED_HEIGHT + 16),
      child: Column(
        children: [
          SizedBox(
            height: 186,
            child: Row(
              children: [
                Expanded(
                  child: CoinPriceSummary(
                    type: CoinPriceSummaryType.vfx,
                    actions: [
                      AppButton(
                        onPressed: () {
                          ref.read(currencySegementedButtonProvider.notifier).set(CurrencyType.vfx);
                          Navigator.of(rootNavigatorKey.currentContext!).push(
                            MaterialPageRoute(
                              fullscreenDialog: true,
                              builder: (_) => PriceChartScreen(),
                            ),
                          );
                        },
                        label: "View Chart",
                        variant: AppColorVariant.Light,
                        type: AppButtonType.Outlined,
                      ),
                      AppButton(
                        onPressed: () async {
                          AccountUtils.getCoin(context, ref, VfxOrBtcOption.vfx);
                        },
                        variant: AppColorVariant.Secondary,
                        type: AppButtonType.Outlined,
                        label: "Get VFX",
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
                      AppButton(
                        onPressed: () {
                          ref.read(currencySegementedButtonProvider.notifier).set(CurrencyType.btc);
                          Navigator.of(rootNavigatorKey.currentContext!).push(
                            MaterialPageRoute(
                              fullscreenDialog: true,
                              builder: (_) => PriceChartScreen(),
                            ),
                          );
                        },
                        label: "View Chart",
                        variant: AppColorVariant.Light,
                        type: AppButtonType.Outlined,
                      ),
                      AppButton(
                        onPressed: () {
                          AccountUtils.getCoin(context, ref, VfxOrBtcOption.btc);
                        },
                        label: "Get BTC",
                        variant: AppColorVariant.Btc,
                        type: AppButtonType.Outlined,
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
