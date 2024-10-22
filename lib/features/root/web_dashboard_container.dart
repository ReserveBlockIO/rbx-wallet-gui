import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../app.dart';
import '../../core/app_constants.dart';
import '../../core/components/buttons.dart';
import '../../core/models/web_session_model.dart';
import '../../core/theme/app_theme.dart';
import '../../core/theme/colors.dart';
import '../../core/theme/components.dart';
import '../../core/theme/pretty_icons.dart';
import '../block/latest_block.dart';
import '../btc/screens/tokenized_btc_list_screen.dart';
import '../btc_web/components/web_btc_transaction_list.dart';
import '../misc/providers/global_balances_expanded_provider.dart';
import '../navigation/components/root_container_balance_item.dart';
import '../navigation/components/root_container_side_nav.dart';
import '../navigation/root_container.dart';
import '../transactions/models/web_transaction.dart';
import '../wallet/utils.dart';
import '../web/providers/web_latest_block_provider.dart';
import '../../generated/assets.gen.dart';
import '../../utils/toast.dart';
import 'package:url_launcher/url_launcher_string.dart';
import '../../core/dialogs.dart';
import '../../core/providers/session_provider.dart';
import '../../core/providers/web_session_provider.dart';
import '../auth/auth_utils.dart';
import '../btc_web/models/btc_web_account.dart';
import '../btc_web/models/btc_web_transaction.dart';
import '../btc_web/providers/btc_web_transaction_list_provider.dart';
import '../chat/components/web_chat_notifier.dart';

import '../../core/base_component.dart';
import '../../core/env.dart';
import '../../core/web_router.gr.dart';
import '../keygen/models/keypair.dart';
import '../keygen/models/ra_keypair.dart';
import '../navigation/components/root_container_balance_row.dart';
import '../navigation/constants.dart';
import '../transactions/providers/web_transaction_list_provider.dart';
import '../web/components/web_latest_block.dart';
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
  static get tokens => 9;
  static get vbtc => 10;
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
    const WebTokenTabRouter(),
    const WebTokenizeBitcoinRouter(),
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
    bool walletInfoIsHovering = false;
    bool walletInfoIsExpanded = false;
    bool walletInfoPopupVisible = false;

    bool latestBlockIsHovering = false;
    bool latestBlockIsExpanded = false;

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
          // if (Env.isTestNet)
          //   Container(
          //     width: double.infinity,
          //     color: Colors.green.shade800,
          //     child: const Padding(
          //       padding: EdgeInsets.all(4.0),
          //       child: Center(
          //         child: Text(
          //           "VFX TESTNET",
          //           style: TextStyle(
          //             fontSize: 13,
          //             letterSpacing: 2,
          //             fontWeight: FontWeight.bold,
          //             color: Colors.white,
          //           ),
          //         ),
          //       ),
          //     ),
          //   ),
          if (kIsWeb) WebChatNotifier(ref: ref, address: ref.watch(webSessionProvider.select((v) => v.keypair?.address))),
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
                            child: WebAccountInfoExpanderRow(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Consumer(
                  builder: (context, ref, _) {
                    const expandedHeight = 300.0;

                    return AnimatedPositioned(
                      left: 0,
                      bottom: walletInfoIsExpanded || walletInfoPopupVisible ? 0 : -expandedHeight,
                      duration: ROOT_CONTAINER_TRANSITION_DURATION,
                      curve: ROOT_CONTAINER_TRANSITION_CURVE,
                      child: MouseRegion(
                        onHover: (_) {
                          setState(() {
                            walletInfoIsHovering = true;
                            walletInfoIsExpanded = true;
                          });
                        },
                        onExit: (_) {
                          setState(() {
                            walletInfoIsHovering = false;
                            walletInfoIsExpanded = false;
                          });
                        },
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Transform.translate(
                              offset: Offset(1, 2),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: AppColors.getGray(ColorShade.s300),
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(16),
                                  ),
                                  border: Border.all(
                                    color: Colors.white.withOpacity(0.15),
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 12),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      AnimatedDefaultTextStyle(
                                        duration: Duration(milliseconds: 105),
                                        style: TextStyle(
                                          color: walletInfoIsHovering ? Colors.white : Colors.white.withOpacity(0.75),
                                          fontSize: 14,
                                        ),
                                        child: Text("Addresses"),
                                      ),
                                      SizedBox(
                                        width: 4,
                                      ),
                                      Transform.translate(
                                        offset: Offset(0, 1),
                                        child: Icon(
                                          Icons.arrow_drop_down,
                                          color: walletInfoIsHovering ? Colors.white : Colors.white.withOpacity(0.75),
                                          size: 16,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              height: expandedHeight,
                              width: 520,
                              decoration: BoxDecoration(
                                color: AppColors.getGray(ColorShade.s300),
                                border: Border(
                                  top: BorderSide(
                                    color: Colors.white.withOpacity(0.15),
                                  ),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(16.0).copyWith(bottom: 0),
                                child: Consumer(builder: (context, ref, _) {
                                  final vfxKeypair = ref.watch(webSessionProvider.select((value) => value.keypair));
                                  final vfxBalance = ref.watch(webSessionProvider.select((value) => value.balance));

                                  final raKeypair = ref.watch(webSessionProvider.select((value) => value.raKeypair));
                                  final raBalance = ref.watch(webSessionProvider.select((value) => value.balance));

                                  final btcKeypair = ref.watch(webSessionProvider.select((value) => value.btcKeypair));
                                  final btcBalance = ref.watch(webSessionProvider.select((value) => value.btcBalanceInfo?.btcBalance));
                                  return Column(
                                    children: [
                                      if (vfxKeypair != null)
                                        _WalletListItem(
                                          address: vfxKeypair.address,
                                          keypair: vfxKeypair,
                                          label: "VFX",
                                          balance: "${vfxBalance ?? 0} VFX",
                                          color: AppColors.getBlue(),
                                          onMenuOpen: () {
                                            setState(() {
                                              walletInfoPopupVisible = true;
                                            });
                                          },
                                          onMenuClose: () {
                                            setState(() {
                                              walletInfoPopupVisible = false;
                                            });
                                          },
                                        ),
                                      if (raKeypair != null)
                                        Padding(
                                          padding: const EdgeInsets.only(top: 16.0),
                                          child: _WalletListItem(
                                            address: raKeypair.address,
                                            label: "Vault",
                                            balance: "${raBalance ?? 0} VFX",
                                            color: AppColors.getReserve(),
                                            raKeypair: raKeypair,
                                            onMenuOpen: () {
                                              setState(() {
                                                walletInfoPopupVisible = true;
                                              });
                                            },
                                            onMenuClose: () {
                                              setState(() {
                                                walletInfoPopupVisible = false;
                                              });
                                            },
                                          ),
                                        ),
                                      if (btcKeypair != null)
                                        Padding(
                                          padding: const EdgeInsets.only(top: 16.0),
                                          child: _WalletListItem(
                                            address: btcKeypair.address,
                                            btcKeypair: btcKeypair,
                                            label: "BTC",
                                            balance: "${btcBalance ?? 0} BTC",
                                            color: AppColors.getBtc(),
                                            onMenuOpen: () {
                                              setState(() {
                                                walletInfoPopupVisible = true;
                                              });
                                            },
                                            onMenuClose: () {
                                              setState(() {
                                                walletInfoPopupVisible = false;
                                              });
                                            },
                                          ),
                                        ),
                                      SizedBox(
                                        height: 12,
                                      ),
                                      Opacity(
                                        opacity: 0.7,
                                        child: AppButton(
                                          label: "Sign Out",
                                          icon: Icons.logout,
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
                                      ),
                                    ],
                                  );
                                }),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
                Consumer(builder: (context, ref, _) {
                  final block = ref.watch(webLatestBlockProvider);

                  if (block == null) {
                    return SizedBox();
                  }

                  return AnimatedPositioned(
                    right: 0,
                    bottom: latestBlockIsExpanded ? 0 : -360,
                    duration: ROOT_CONTAINER_TRANSITION_DURATION,
                    curve: ROOT_CONTAINER_TRANSITION_CURVE,
                    child: MouseRegion(
                      onHover: (_) {
                        setState(() {
                          latestBlockIsExpanded = true;
                          latestBlockIsHovering = true;
                        });
                      },
                      onExit: (_) {
                        setState(() {
                          latestBlockIsExpanded = false;
                          latestBlockIsHovering = false;
                        });
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Transform.translate(
                            offset: Offset(1, 2),
                            child: Container(
                              decoration: BoxDecoration(
                                color: AppColors.getGray(ColorShade.s300),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(16),
                                ),
                                border: Border.all(
                                  color: Colors.white.withOpacity(0.15),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 12),
                                child: Row(mainAxisSize: MainAxisSize.min, children: [
                                  AnimatedDefaultTextStyle(
                                    duration: Duration(milliseconds: 105),
                                    style: TextStyle(
                                      color: latestBlockIsHovering ? Colors.white : Colors.white.withOpacity(0.75),
                                      fontSize: 14,
                                    ),
                                    child: Text(
                                      "Block ${block.height}",
                                    ),
                                  ),
                                ]),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 280,
                            height: 360,
                            child: LatestBlock(
                              blockOverride: block.toNativeBlock(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
              ],
            ),
          )
        ],
      );
    });
  }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    return Scaffold(
      key: rootScaffoldKey,
      drawer: WebDrawer(),
      body: Column(mainAxisSize: MainAxisSize.min, children: [
        // if (Env.isTestNet)
        //   Container(
        //     width: double.infinity,
        //     color: Colors.green.shade800,
        //     child: const Padding(
        //       padding: EdgeInsets.all(4.0),
        //       child: Center(
        //         child: Text(
        //           "VFX TESTNET",
        //           style: TextStyle(
        //             fontSize: 13,
        //             letterSpacing: 2,
        //             fontWeight: FontWeight.bold,
        //             color: Colors.white,
        //           ),
        //         ),
        //       ),
        //     ),
        //   ),
        if (kIsWeb) WebChatNotifier(ref: ref, address: ref.watch(webSessionProvider.select((v) => v.keypair!.address))),
        Expanded(child: child),
      ]),
    );
  }
}

class WebAccountInfoExpanderRow extends BaseComponent {
  const WebAccountInfoExpanderRow({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
              Expanded(child: WebAccountInfoVfx()),
              SizedBox(
                width: 16,
              ),
              Expanded(
                child: WebAccountInfoVbtc(),
              ),
              SizedBox(
                width: 16,
              ),
              Expanded(
                child: WebAccountInfoBtc(),
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

class WebAccountInfoBtc extends BaseComponent {
  const WebAccountInfoBtc({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sessionModel = ref.watch(webSessionProvider);

    final forceExpand = ref.watch(globalBalancesExpandedProvider);

    final myBtcAddress = ref.watch(webSessionProvider.select((value) => value.btcKeypair?.address));

    final List<BtcWebTransaction>? btcTransactions = myBtcAddress != null ? ref.watch(btcWebTransactionListProvider(myBtcAddress)) : null;
    final latestBtcTx = btcTransactions != null && btcTransactions.isNotEmpty ? btcTransactions.first : null;

    return RootContainerBalanceItem(
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
        latestTx: latestBtcTx != null
            ? MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () {
                    ref.read(webSessionProvider.notifier).setSelectedWalletType(WalletType.btc);
                    AutoTabsRouter.of(context).setActiveIndex(WebRouteIndex.transactions);
                  },
                  child: AppCard(
                    padding: 12,
                    fullWidth: true,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "${latestBtcTx.amountBtc(myBtcAddress!)} BTC",
                          style: TextStyle(
                            color: latestBtcTx.amountBtc(myBtcAddress) >= 0 ? Theme.of(context).colorScheme.success : Colors.red.shade500,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          "From: ${latestBtcTx.fromAddress(myBtcAddress)}\nTo: ${latestBtcTx.toAddress(myBtcAddress)}",
                          style: TextStyle(
                            fontSize: 11,
                            color: Colors.white.withOpacity(0.9),
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        latestBtcTx.status.confirmed
                            ? Text(
                                "Confirmed",
                                style: TextStyle(
                                  color: AppColors.getSpringGreen(),
                                  fontWeight: FontWeight.w600,
                                ),
                              )
                            : Text(
                                "Pending",
                                style: TextStyle(
                                  color: Theme.of(context).colorScheme.warning,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                      ],
                    ),
                  ),
                ),
              )
            : null,
        actions: [
          if (sessionModel.btcKeypair != null)
            AppVerticalIconButton(
              onPressed: () async {
                await Clipboard.setData(ClipboardData(text: sessionModel.btcKeypair!.address));
                Toast.message("Address copied to clipboard");
              },
              icon: Icons.copy,
              label: "Copy\nAddress",
              prettyIconType: PrettyIconType.topCards,
            ),
          AppVerticalIconButton(
            onPressed: () {
              AccountUtils.getCoin(context, ref, VfxOrBtcOption.btc);
            },
            icon: FontAwesomeIcons.coins,
            iconScale: 0.7,
            label: "Get\nBTC",
            prettyIconType: PrettyIconType.topCards,
          ),
        ]);
  }
}

class WebAccountInfoVbtc extends BaseComponent {
  const WebAccountInfoVbtc({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final forceExpand = ref.watch(globalBalancesExpandedProvider);

    return RootContainerBalanceItem(
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
          prettyIconType: PrettyIconType.topCards,
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
          prettyIconType: PrettyIconType.topCards,
          icon: Icons.help,
          label: "What's\nvBTC",
        ),
      ],
    );
  }
}

class WebAccountInfoVfx extends BaseComponent {
  const WebAccountInfoVfx({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sessionModel = ref.watch(webSessionProvider);
    final List<WebTransaction>? vfxTransactions = sessionModel.keypair != null
        ? ref.watch(webTransactionListProvider(sessionModel.keypair!.address).select((value) => value.transactions))
        : null;
    final latestVfxTx = vfxTransactions != null && vfxTransactions.isNotEmpty ? vfxTransactions.first : null;
    final forceExpand = ref.watch(globalBalancesExpandedProvider);

    return RootContainerBalanceItem(
      heading: '${(sessionModel.balance ?? 0) + (sessionModel.raBalance ?? 0)} VFX',
      headingColor: AppColors.getBlue(),
      accountCount: '',
      forceExpand: forceExpand,
      latestTx: latestVfxTx != null
          ? MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: () {
                  ref.read(webSessionProvider.notifier).setSelectedWalletType(WalletType.rbx);

                  AutoTabsRouter.of(context).setActiveIndex(WebRouteIndex.transactions);
                },
                child: AppCard(
                  padding: 12,
                  fullWidth: true,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (latestVfxTx.type == TxType.rbxTransfer)
                        Text(
                          "${latestVfxTx.amount} VFX",
                          style: TextStyle(
                            color:
                                latestVfxTx.amount != null && latestVfxTx.amount! < 0 ? Colors.red.shade500 : Theme.of(context).colorScheme.success,
                            fontWeight: FontWeight.w600,
                          ),
                        )
                      else
                        Text(
                          latestVfxTx.typeLabel,
                          style: TextStyle(
                            color: AppColors.getBlue(),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      Text(
                        "From: ${latestVfxTx.fromAddress}\nTo: ${latestVfxTx.toAddress}",
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
                        "Success",
                        style: TextStyle(
                          color: AppColors.getSpringGreen(),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          : null,
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
              await Clipboard.setData(ClipboardData(text: sessionModel.keypair!.address));
              Toast.message("Address copied to clipboard");
            },
            icon: Icons.copy,
            label: "Copy\nAddress",
            prettyIconType: PrettyIconType.topCards,
          ),
        if (sessionModel.raKeypair != null)
          AppVerticalIconButton(
            onPressed: () async {
              await Clipboard.setData(ClipboardData(text: sessionModel.raKeypair!.address));
              Toast.message("Address copied to clipboard");
            },
            icon: Icons.copy,
            label: "Vault\nAddress",
            prettyIconType: PrettyIconType.topCards,
          ),
        AppVerticalIconButton(
          onPressed: () {
            AccountUtils.getCoin(context, ref, VfxOrBtcOption.vfx);
          },
          icon: FontAwesomeIcons.coins,
          label: "Get\nVFX",
          prettyIconType: PrettyIconType.topCards,
          iconScale: 0.75,
        ),
      ],
    );
  }
}

class _WalletListItem extends StatelessWidget {
  final String address;
  final String label;
  final String balance;
  final Color color;
  final VoidCallback onMenuOpen;
  final VoidCallback onMenuClose;
  final Keypair? keypair;
  final RaKeypair? raKeypair;
  final BtcWebAccount? btcKeypair;
  const _WalletListItem({
    super.key,
    required this.address,
    required this.label,
    required this.balance,
    required this.color,
    required this.onMenuOpen,
    required this.onMenuClose,
    this.keypair,
    this.raKeypair,
    this.btcKeypair,
  });

  @override
  Widget build(BuildContext context) {
    return AppCard(
      padding: 0,
      child: ListTile(
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              address,
              style: TextStyle(color: color, fontSize: 18),
            ),
            SizedBox(
              width: 6,
            ),
            InkWell(
              onTap: () async {
                await Clipboard.setData(ClipboardData(text: address));
                Toast.message("Address copied to clipboard.");
              },
              child: Icon(
                Icons.copy,
                color: color,
                size: 18,
              ),
            ),
          ],
        ),
        subtitle: Text(
          balance,
          style: TextStyle(
            fontSize: 14,
            color: Colors.white,
          ),
        ),
        leading: Container(
          width: 38,
          height: 38,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                color.withOpacity(0.6),
                color.withOpacity(0.4),
              ],
            ),
            borderRadius: BorderRadius.circular(19),
            border: Border.all(
              color: Colors.white.withOpacity(0.4),
              width: 1,
            ),
          ),
          child: Center(
            child: Text(
              label,
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
          ),
        ),
        trailing: PopupMenuButton<int>(
          color: AppColors.getGray(ColorShade.s200),
          tooltip: "",
          icon: Icon(
            Icons.more_vert,
            color: Colors.white.withOpacity(0.87),
          ),
          iconSize: 16,
          onSelected: (i) async {
            switch (i) {
              case 0:
                await Clipboard.setData(ClipboardData(text: address));
                Toast.message("Address copied to clipboard.");
                break;

              case 1:
                final confirmed = await ConfirmDialog.show(
                  title: "Reveal Private Key?",
                  body: "Are you sure you want to reveal your private key for this account?",
                  confirmText: "Reveal",
                  cancelText: "Cancel",
                );
                if (confirmed != true) {
                  return;
                }

                if (keypair != null) {
                  showKeys(context, keypair!);
                }

                if (raKeypair != null) {
                  showRaKeys(context, raKeypair!);
                  return;
                }

                if (btcKeypair != null) {
                  final kp = Keypair(
                    private: btcKeypair!.privateKey,
                    address: btcKeypair!.address,
                    public: btcKeypair!.publicKey,
                    mneumonic: btcKeypair!.mnemonic,
                    btcWif: btcKeypair!.wif,
                  );
                  showKeys(context, kp, true);
                  return;
                }

                break;
            }
            onMenuClose();
          },
          onOpened: () {
            onMenuOpen();
          },
          onCanceled: () {
            onMenuClose();
          },
          itemBuilder: (context) {
            return [
              PopupMenuItem(
                value: 0,
                child: Text("Copy Address"),
              ),
              PopupMenuItem(
                value: 1,
                child: Text("Reveal Private Key"),
              ),
            ];
          },
        ),
      ),
    );
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
            ref.watch(webSessionProvider.select((v) => v.selectedWalletType)) == WalletType.btc
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
                    color: ref.watch(sessionProvider.select((v) => v.btcSelected)) ? AppColors.getBtc() : AppColors.getBlue(ColorShade.s100),
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
