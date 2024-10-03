import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rbx_wallet/core/models/web_session_model.dart';
import 'package:rbx_wallet/core/theme/colors.dart';
import 'package:rbx_wallet/core/theme/components.dart';
import 'package:rbx_wallet/core/theme/pretty_icons.dart';
import 'package:rbx_wallet/features/btc/screens/tokenized_btc_list_screen.dart';
import 'package:rbx_wallet/features/misc/providers/global_balances_expanded_provider.dart';
import 'package:rbx_wallet/features/navigation/components/root_container_balance_item.dart';
import 'package:rbx_wallet/features/navigation/components/root_container_side_nav.dart';
import 'package:rbx_wallet/features/navigation/root_container.dart';
import 'package:rbx_wallet/features/wallet/utils.dart';
import 'package:rbx_wallet/generated/assets.gen.dart';
import 'package:rbx_wallet/utils/toast.dart';
import 'package:url_launcher/url_launcher_string.dart';
import '../../core/dialogs.dart';
import '../../core/providers/session_provider.dart';
import '../../core/providers/web_session_provider.dart';
import '../chat/components/web_chat_notifier.dart';

import '../../core/base_component.dart';
import '../../core/env.dart';
import '../../core/web_router.gr.dart';
import '../navigation/components/root_container_balance_row.dart';
import '../navigation/constants.dart';
import 'navigation/components/web_drawer.dart';

GlobalKey<ScaffoldState> webDashboardScaffoldKey = GlobalKey<ScaffoldState>();

class WebRouteIndex {
  static get home => 0;
  static get send => 1;
  static get recieve => 2;
  static get transactions => 3;
  static get nfts => 4;
  static get smartContracts => 5;
  static get shop => 6;
  static get adnrs => 7;
  static get reserve => 8;
}

class WebDashboardContainer extends StatelessWidget {
  WebDashboardContainer({Key? key}) : super(key: key);

  final List<PageRouteInfo> routes = [
    const WebHomeTabRouter(),
    const WebSendTabRouter(),
    const WebReceiveTabRouter(),
    const WebTransactionsTabRouter(),
    const WebNftTabRouter(),
    const WebSmartContractTabRouter(),
    const WebShopTabRouter(),
    const WebAdnrTabRouter(),
    const WebReserveAccountsTabRouter(),
    const WebSignTxTabRouter(),
  ];

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: routes,
      scaffoldKey: webDashboardScaffoldKey,
      builder: (context, child, animated) => _ContentWrapper(
        child: child,
      ),
    );
  }
}

class _ContentWrapper extends BaseComponent {
  final Widget child;

  const _ContentWrapper({Key? key, required this.child}) : super(key: key);

  @override
  Widget desktopBody(BuildContext context, WidgetRef ref) {
    bool sideNavExpanded = true;
    bool isHoveringTopBalance = false;

    final globalBalancesExpanded = ref.watch(globalBalancesExpandedProvider);

    final tabsRouter = AutoTabsRouter.of(context);

    tabsRouter.addListener(() {
      if (tabsRouter.current.name == "WebHomeTabRouter") {
        if (!globalBalancesExpanded) {
          ref.read(globalBalancesExpandedProvider.notifier).expand();
        }
      } else {
        if (globalBalancesExpanded) {
          ref.read(globalBalancesExpandedProvider.notifier).detract();
        }
      }
    });

    return StatefulBuilder(builder: (context, setState) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (Env.isTestNet)
            Container(
              width: double.infinity,
              color: Colors.green.shade800,
              child: const Padding(
                padding: EdgeInsets.all(4.0),
                child: Center(
                  child: Text(
                    "VFX TESTNET",
                    style: TextStyle(
                      fontSize: 13,
                      letterSpacing: 2,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          if (kIsWeb) WebChatNotifier(ref: ref, address: ref.watch(webSessionProvider).keypair?.address),
          Expanded(
            child: Stack(
              children: [
                _TopLeft(sideNavExpanded: sideNavExpanded),
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 56.0),
                    child: AnimatedContainer(
                      duration: ROOT_CONTAINER_TRANSITION_DURATION,
                      width: sideNavExpanded ? SIDE_NAV_WIDTH_EXPANDED : SIDE_NAV_WIDTH_CONTRACTED,
                      curve: ROOT_CONTAINER_TRANSITION_CURVE,
                      child: RootContainerSideNav(
                          isExpanded: sideNavExpanded,
                          onToggleExpanded: () {
                            setState(() {
                              sideNavExpanded = !sideNavExpanded;
                            });
                          }),
                    ),
                  ),
                ),
                AnimatedPadding(
                  duration: ROOT_CONTAINER_TRANSITION_DURATION,
                  curve: ROOT_CONTAINER_TRANSITION_CURVE,
                  padding: EdgeInsets.only(left: sideNavExpanded ? SIDE_NAV_WIDTH_EXPANDED : SIDE_NAV_WIDTH_CONTRACTED),
                  child: Stack(
                    children: [
                      Column(
                        children: [
                          Container(
                            height: 57,
                          ),
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(),
                              clipBehavior: Clip.antiAlias,
                              child: child,
                            ),
                          ),
                        ],
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16).copyWith(top: 6),
                          child: MouseRegion(
                            onHover: (_) {
                              setState(() {
                                isHoveringTopBalance = true;
                              });
                            },
                            onExit: (_) {
                              setState(() {
                                isHoveringTopBalance = false;
                              });
                            },
                            child: Consumer(builder: (context, ref, _) {
                              final sessionModel = ref.watch(webSessionProvider);

                              final forceExpand = ref.watch(globalBalancesExpandedProvider);

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
                                            heading: '${(sessionModel.balance ?? 0) + (sessionModel.raBalance ?? 0)} VFX',
                                            headingColor: AppColors.getBlue(),
                                            accountCount: '',
                                            forceExpand: forceExpand,
                                            handleViewAllTxs: () {
                                              ref.read(webSessionProvider.notifier).setSelectedWalletType(WalletType.rbx);

                                              AutoTabsRouter.of(context).setActiveIndex(WebRouteIndex.transactions);
                                            },
                                            topIndicator: Image.asset(
                                              "assets/images/cube_still.png",
                                              width: 32,
                                              height: 32,
                                            ),
                                            actions: [
                                              if (sessionModel.keypair != null)
                                                AppVerticalIconButton(
                                                  onPressed: () async {
                                                    await Clipboard.setData(ClipboardData(text: sessionModel.keypair!.public));
                                                    Toast.message("Address copied to clipboard");
                                                  },
                                                  icon: Icons.copy,
                                                  label: "Copy\nAddress",
                                                  prettyIconType: PrettyIconType.custom,
                                                ),
                                              if (sessionModel.raKeypair != null)
                                                AppVerticalIconButton(
                                                  onPressed: () async {
                                                    await Clipboard.setData(ClipboardData(text: sessionModel.raKeypair!.public));
                                                    Toast.message("Address copied to clipboard");
                                                  },
                                                  icon: Icons.copy,
                                                  label: "Vault\nAddress",
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
                                            heading: "0 vBTC",
                                            headingColor: AppColors.getWhite(),
                                            accountCount: "",
                                            handleViewAllTxs: () {},
                                            actions: [
                                              AppVerticalIconButton(
                                                onPressed: () {},
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
                                              heading: "${(sessionModel.btcBalanceInfo?.btcBalance ?? 0).toStringAsFixed(8)} BTC",
                                              headingColor: AppColors.getBtc(),
                                              accountCount: "",
                                              handleViewAllTxs: () {
                                                ref.read(webSessionProvider.notifier).setSelectedWalletType(WalletType.btc);

                                                AutoTabsRouter.of(context).setActiveIndex(WebRouteIndex.transactions);
                                              },
                                              actions: [
                                                if (sessionModel.btcKeypair != null)
                                                  AppVerticalIconButton(
                                                    onPressed: () async {
                                                      await Clipboard.setData(ClipboardData(text: sessionModel.btcKeypair!.address));
                                                      Toast.message("Address copied to clipboard");
                                                    },
                                                    icon: Icons.copy,
                                                    label: "Copy\nAddress",
                                                    prettyIconType: PrettyIconType.custom,
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
                                              ]),
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
                            }),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      );
    });
  }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    return Column(mainAxisSize: MainAxisSize.min, children: [
      if (Env.isTestNet)
        Container(
          width: double.infinity,
          color: Colors.green.shade800,
          child: const Padding(
            padding: EdgeInsets.all(4.0),
            child: Center(
              child: Text(
                "VFX TESTNET",
                style: TextStyle(
                  fontSize: 13,
                  letterSpacing: 2,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      if (kIsWeb) WebChatNotifier(ref: ref, address: ref.watch(webSessionProvider).keypair!.address),
      Expanded(child: child),
    ]);
  }
}

class _TopLeft extends BaseComponent {
  const _TopLeft({
    super.key,
    required this.sideNavExpanded,
  });

  final bool sideNavExpanded;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: const EdgeInsets.only(left: 5, top: 7),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            // RootContainerRotatingCube(),
            ref.watch(webSessionProvider).selectedWalletType == WalletType.btc
                ? Image.asset(
                    Assets.images.animatedCubeBtc.path,
                    scale: 1,
                    width: 42,
                    height: 42,
                  )
                : Image.asset(
                    Assets.images.animatedCube.path,
                    scale: 1,
                    width: 42,
                    height: 42,
                  ),
            SizedBox(
              width: 6,
            ),
            AnimatedOpacity(
              duration: ROOT_CONTAINER_TRANSITION_DURATION,
              opacity: sideNavExpanded ? 1 : 0,
              child: Text(
                "Verified",
                style: TextStyle(
                  color: AppColors.getWhite(ColorShade.s400),
                  fontSize: 26,
                  fontWeight: FontWeight.w300,
                  fontFamily: 'Mukta',
                  letterSpacing: 0,
                ),
              ),
            ),
            SizedBox(
              width: 1,
            ),
            AnimatedOpacity(
              duration: ROOT_CONTAINER_TRANSITION_DURATION * 2,
              opacity: sideNavExpanded ? 1 : 0,
              child: Consumer(builder: (context, ref, _) {
                return AnimatedDefaultTextStyle(
                  duration: ROOT_CONTAINER_TRANSITION_DURATION,
                  style: TextStyle(
                    color: ref.watch(sessionProvider).btcSelected ? AppColors.getBtc() : AppColors.getBlue(ColorShade.s100),
                    fontSize: 26,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Mukta',
                    letterSpacing: 0,
                  ),
                  child: Text("X"),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
