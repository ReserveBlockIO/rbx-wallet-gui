import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/app.dart';
import '../../../core/app_constants.dart';
import '../../../core/theme/components.dart';
import '../../../core/theme/pretty_icons.dart';
import '../../btc_web/services/btc_web_service.dart';
import '../../navigation/constants.dart';
import '../../payment/components/web_buy_rbx_button.dart';
import '../../price/components/coin_price_summary.dart';
import '../../price/components/price_chart.dart';
import '../../wallet/utils.dart';
import '../../web/components/web_wallet_type_switcher.dart';

import '../../../core/dialogs.dart';
import '../../web/components/web_wordmark.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/base_component.dart';
import '../../../core/base_screen.dart';
import '../../../core/breakpoints.dart';
import '../../../core/components/buttons.dart';
import '../../../core/env.dart';
import '../../../core/providers/web_session_provider.dart';
import '../../../core/theme/app_theme.dart';
import '../../../core/web_router.gr.dart';
import '../../../generated/assets.gen.dart';
import '../../root/web_dashboard_container.dart';
import '../../web/components/web_latest_block.dart';
import '../../web/components/web_wallet_details.dart';

class WebHomeScreen extends BaseScreen {
  const WebHomeScreen({Key? key})
      : super(
          key: key,
          includeWebDrawer: true,
          backgroundColor: Colors.black,
          horizontalPadding: 0,
          verticalPadding: 0,
        );

  // @override
  // AppBar? appBar(BuildContext context, WidgetRef ref) {
  //   final address = ref.watch(webSessionProvider).currentWallet?.address;

  //   return AppBar(
  //     title: const Text("Dashboard"),
  //     backgroundColor: Colors.black,
  //     shadowColor: Colors.transparent,
  //     centerTitle: true,
  //     leadingWidth: 180,
  //     leading: address == null || !ALLOW_PAYMENT
  //         ? SizedBox.shrink()
  //         : Padding(
  //             padding: const EdgeInsets.only(left: 6.0),
  //             child: WebBuyRBXButton(),
  //           ),
  //     actions: [WebWalletTypeSwitcher()],
  //   );
  // }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
      child: ConstrainedBox(
        constraints: BoxConstraints(minHeight: MediaQuery.of(context).size.height - 60),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  SizedBox(height: 4),
                  WebWalletDetails(),
                  SizedBox(height: 32),
                ],
              ),
            ),
            const _Brand(),
            const _Actions(),
          ],
        ),
      ),
    );
  }

  @override
  Widget desktopBody(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.only(top: ROOT_CONTAINER_BALANCE_ITEM_EXPANDED_HEIGHT),
      child: Column(
        children: [
          SizedBox(
            height: 12,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SizedBox(
              height: 186,
              child: Row(
                children: [
                  Expanded(
                    child: CoinPriceSummary(
                      type: CoinPriceSummaryType.vfx,
                      actions: [
                        AppButton(
                          onPressed: () {
                            Navigator.of(webDashboardScaffoldKey.currentContext!).push(
                              MaterialPageRoute(
                                fullscreenDialog: true,
                                builder: (_) => WebPriceChartScreen(
                                  isBtc: false,
                                ),
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
                            Navigator.of(webDashboardScaffoldKey.currentContext!).push(
                              MaterialPageRoute(
                                fullscreenDialog: true,
                                builder: (_) => WebPriceChartScreen(
                                  isBtc: true,
                                ),
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
          ),
          const _Actions(),
        ],
      ),
    );
  }
}

class _Brand extends StatelessWidget {
  const _Brand({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isMobile = BreakPoints.useMobileLayout(context);

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: isMobile ? 75 : 150,
            child: Image.asset(
              Assets.images.animatedCube.path,
              scale: 1,
            ),
          ),
          // Center(
          //   child: Image.asset(
          //     Assets.images.rbxWallet.path,
          //     width: 160,
          //     height: 27,
          //     fit: BoxFit.contain,
          //   ),
          // ),
          Center(
            child: WebWordmark(),
          )
        ],
      ),
    );
  }
}

class _Actions extends BaseComponent {
  const _Actions({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tabsRouter = AutoTabsRouter.of(context);

    final isMobile = BreakPoints.useMobileLayout(context);

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: AppCard(
        fullWidth: true,
        child: Center(
          child: Wrap(
            runSpacing: isMobile ? 6 : 16,
            spacing: isMobile ? 6 : 16,
            alignment: WrapAlignment.center,
            children: [
              // AppButton(
              //   label: "Test",
              //   onPressed: () {
              //     runTests();
              //   },
              // ),
              // AppButton(
              //   label: "Other Test",
              //   onPressed: () {
              //     otherTest();
              //   },
              // ),

              AppVerticalIconButton(
                label: "Send\nCoin",
                icon: Icons.outbox,
                prettyIconType: PrettyIconType.send,
                onPressed: () {
                  tabsRouter.setActiveIndex(WebRouteIndex.send);
                },
              ),
              AppVerticalIconButton(
                label: "Receive\nCoin",
                icon: Icons.move_to_inbox,
                prettyIconType: PrettyIconType.receive,
                onPressed: () {
                  tabsRouter.setActiveIndex(WebRouteIndex.recieve);
                },
              ),
              AppVerticalIconButton(
                label: "TX\nHistory",
                icon: Icons.paid,
                prettyIconType: PrettyIconType.transactions,
                onPressed: () {
                  tabsRouter.setActiveIndex(WebRouteIndex.transactions);
                },
              ),

              AppVerticalIconButton(
                label: "Add\nDomain",
                icon: Icons.link,
                prettyIconType: PrettyIconType.domain,
                onPressed: () {
                  tabsRouter.setActiveIndex(WebRouteIndex.adnrs);
                },
              ),

              AppVerticalIconButton(
                label: "Mint\nNFT",
                icon: Icons.receipt_long,
                prettyIconType: PrettyIconType.smartContract,
                onPressed: () {
                  tabsRouter.setActiveIndex(WebRouteIndex.smartContracts);
                },
              ),

              AppVerticalIconButton(
                label: "P2P\nAuctions",
                icon: Icons.leak_add,
                prettyIconType: PrettyIconType.p2p,
                onPressed: () {
                  tabsRouter.setActiveIndex(WebRouteIndex.shop);
                },
              ),
              AppVerticalIconButton(
                label: "Vault\nAccount",
                prettyIconType: PrettyIconType.lock,
                icon: Icons.security,
                onPressed: () {
                  tabsRouter.setActiveIndex(WebRouteIndex.reserve);
                },
              ),
              AppVerticalIconButton(
                label: "Open\nExplorer",
                icon: Icons.open_in_browser,
                prettyIconType: PrettyIconType.custom,
                onPressed: () {
                  launchUrl(Uri.parse(Env.baseExplorerUrl));
                },
              ),

              if (ref.read(webSessionProvider).keypair != null)
                AppVerticalIconButton(
                  label: "Sign\nOut",
                  icon: Icons.logout,
                  prettyIconType: PrettyIconType.custom,
                  onPressed: () async {
                    final confirmed = await ConfirmDialog.show(
                      title: "Sign Out",
                      body: "Are you sure you want to logout of the VFX Web Wallet?",
                      destructive: true,
                      confirmText: "Logout",
                      cancelText: "Cancel",
                    );
                    if (confirmed == true) {
                      await ref.read(webSessionProvider.notifier).logout();

                      AutoRouter.of(context).replace(const WebAuthRouter());
                    }
                  },
                ),
              if (ref.read(webSessionProvider).keypair == null)
                AppButton(
                  label: "Setup Wallet",
                  onPressed: () async {
                    AutoRouter.of(context).replace(const WebAuthRouter());
                  },
                ),
            ],
          ),
        ),
      ),
    );
  }
}
