import 'dart:async';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rbx_wallet/app.dart';
import 'package:rbx_wallet/core/app_router.gr.dart';
import 'package:rbx_wallet/core/base_component.dart';
import 'package:rbx_wallet/core/providers/session_provider.dart';
import 'package:rbx_wallet/core/theme/app_theme.dart';
import 'package:rbx_wallet/core/theme/colors.dart';
import 'package:rbx_wallet/features/bridge/providers/status_provider.dart';
import 'package:rbx_wallet/features/bridge/providers/wallet_info_provider.dart';
import 'package:rbx_wallet/features/btc/providers/electrum_connected_provider.dart';
import 'package:rbx_wallet/generated/assets.gen.dart';
import 'package:rbx_wallet/utils/toast.dart';

import '../block/latest_block.dart';

const TRANSITION_DURATION = Duration(milliseconds: 250);
const TRANSITION_CURVE = Curves.ease;
const SIDE_NAV_WIDTH_EXPANDED = 180.0;
const SIDE_NAV_WIDTH_CONTRACTED = 50.0;

class NewRootContainer extends BaseComponent {
  const NewRootContainer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<PageRouteInfo> routes = [
      const HomeTabRouter(),
      const SendTabRouter(),
      const ReceiveTabRouter(),
      const TransactionsTabRouter(),
      const ValidatorTabRouter(),
      const AdjudicatorTabRouter(),
      const NodesTabsRouter(),
      const NftTabRouter(),
      const SmartContractsTabRouter(),
      const DstsTabRouter(),
      const AdnrTabRouter(),
      const VotingTabRouter(),
      const BeaconTabRouter(),
      const TokenTabRouter(),
      const ReserveAccountsTabRouter(),
      const TokenizeBtcTabRouter(),
    ];

    return AutoTabsScaffold(
      backgroundColor: Colors.black,
      scaffoldKey: rootScaffoldKey,
      routes: routes,
      builder: (context, child, animated) {
        return _Layout(
          child: child,
        );
      },
    );
  }
}

class _Layout extends StatefulWidget {
  final Widget child;

  const _Layout({
    super.key,
    required this.child,
  });

  @override
  State<_Layout> createState() => _LayoutState();
}

class _LayoutState extends State<_Layout> {
  bool sideNavExpanded = true;

  bool latestBlockIsHovering = false;
  bool latestBlockIsExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: const EdgeInsets.only(top: 56.0),
            child: AnimatedContainer(
              duration: TRANSITION_DURATION,
              width: sideNavExpanded ? SIDE_NAV_WIDTH_EXPANDED : SIDE_NAV_WIDTH_CONTRACTED,
              curve: TRANSITION_CURVE,
              child: _SideNav(
                  isExpanded: sideNavExpanded,
                  onToggleExpanded: () {
                    setState(() {
                      sideNavExpanded = !sideNavExpanded;
                    });
                  }),
            ),
          ),
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 5, top: 8),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                _RotatingCube(),
                SizedBox(
                  width: 6,
                ),
                AnimatedOpacity(
                  duration: TRANSITION_DURATION,
                  opacity: sideNavExpanded ? 1 : 0,
                  child: Text(
                    "Verified",
                    style: TextStyle(
                      color: AppColors.getWhite(ColorShade.s400),
                      fontSize: 20,
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
                  duration: TRANSITION_DURATION * 2,
                  opacity: sideNavExpanded ? 1 : 0,
                  child: Consumer(builder: (context, ref, _) {
                    return AnimatedDefaultTextStyle(
                      duration: TRANSITION_DURATION,
                      style: TextStyle(
                        color: ref.watch(sessionProvider).btcSelected ? AppColors.getBtc() : AppColors.getBlue(ColorShade.s100),
                        fontSize: 22,
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
        ),
        AnimatedPadding(
          duration: TRANSITION_DURATION,
          curve: TRANSITION_CURVE,
          padding: EdgeInsets.only(left: sideNavExpanded ? SIDE_NAV_WIDTH_EXPANDED : SIDE_NAV_WIDTH_CONTRACTED),
          child: Container(
            child: widget.child,
          ),
        ),
        Consumer(builder: (context, ref, _) {
          final block = ref.watch(walletInfoProvider)?.lastestBlock;
          if (block == null) {
            return SizedBox();
          }

          return AnimatedPositioned(
            right: 0,
            bottom: latestBlockIsExpanded ? 0 : -320,
            duration: TRANSITION_DURATION,
            curve: TRANSITION_CURVE,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Transform.translate(
                  offset: Offset(1, 2),
                  child: MouseRegion(
                    onHover: (_) {
                      setState(() {
                        latestBlockIsHovering = true;
                      });
                    },
                    onExit: (_) {
                      setState(() {
                        latestBlockIsHovering = false;
                      });
                    },
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          latestBlockIsExpanded = !latestBlockIsExpanded;
                        });
                      },
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
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
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
                              SizedBox(
                                width: 8,
                              ),
                              Consumer(
                                builder: (context, ref, _) {
                                  late final Color color;
                                  late final String message;
                                  if (!ref.watch(sessionProvider).cliStarted) {
                                    color = Theme.of(context).colorScheme.danger;
                                    message = "CLI Inactive";
                                  } else {
                                    final status = ref.watch(statusProvider);

                                    switch (status) {
                                      case BridgeStatus.Loading:
                                        color = Theme.of(context).colorScheme.warning;
                                        message = "VFX CLI Loading";
                                        break;
                                      case BridgeStatus.Online:
                                        color = Theme.of(context).colorScheme.success;
                                        message = "VFX Online";
                                        break;

                                      case BridgeStatus.Offline:
                                        color = Theme.of(context).colorScheme.danger;
                                        message = "VFX CLI Offline";
                                        break;
                                    }
                                  }

                                  return Tooltip(
                                    message: message,
                                    child: Container(
                                      width: 8,
                                      height: 8,
                                      decoration: BoxDecoration(
                                        color: color,
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                    ),
                                  );
                                },
                              ),
                              SizedBox(
                                width: 8,
                              ),

                              //btc status
                              Consumer(
                                builder: (context, ref, _) {
                                  final sessionState = ref.watch(sessionProvider);

                                  late final Color color;
                                  late final String message;
                                  if (!sessionState.cliStarted) {
                                    color = Theme.of(context).colorScheme.danger;
                                    message = "BTC Inactive";
                                  } else {
                                    final electrumConnected = ref.watch(electrumConnectedProvider);

                                    switch (electrumConnected) {
                                      case null:
                                        color = Theme.of(context).colorScheme.warning;
                                        message = "BTC Loading";
                                        break;
                                      case true:
                                        color = Theme.of(context).colorScheme.success;
                                        message = "BTC Online";
                                        break;

                                      case false:
                                        color = Theme.of(context).colorScheme.danger;
                                        message = "BTC Offline";
                                        break;
                                    }
                                  }

                                  return Tooltip(
                                    message: message,
                                    child: Container(
                                      width: 8,
                                      height: 8,
                                      decoration: BoxDecoration(
                                        color: color,
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                    ),
                                  );
                                },
                              ),
                              SizedBox(
                                width: 8,
                              ),

                              //Sync Widget
                              Consumer(
                                builder: (context, ref, _) {
                                  final walletInfo = ref.watch(walletInfoProvider);
                                  final session = ref.watch(sessionProvider);

                                  late final Color color;
                                  late final String message;
                                  bool isSynced = false;
                                  if (!session.cliStarted) {
                                    color = Theme.of(context).colorScheme.danger;
                                    message = "CLI Inactive";
                                  } else if (walletInfo == null) {
                                    color = Theme.of(context).colorScheme.danger;
                                    message = "Loading...";
                                  } else if (walletInfo.isResyncing) {
                                    color = Theme.of(context).colorScheme.danger;
                                    message = "Resyncing...";
                                  } else if (!walletInfo.isChainSynced) {
                                    color = AppColors.getGold();
                                    message = "Syncing...";
                                  } else {
                                    color = AppColors.getSpringGreen();
                                    message = "Synced";
                                    isSynced = true;
                                  }

                                  if (isSynced) {
                                    return Tooltip(
                                      message: message,
                                      child: Container(
                                        width: 8,
                                        height: 8,
                                        decoration: BoxDecoration(
                                          color: color,
                                          borderRadius: BorderRadius.circular(4),
                                        ),
                                      ),
                                    );
                                  }

                                  return Tooltip(
                                    message: message,
                                    child: SizedBox(
                                      width: 32,
                                      child: LinearProgressIndicator(
                                        value: isSynced ? 1 : null,
                                        color: color,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 240,
                  height: 320,
                  child: LatestBlock(),
                ),
              ],
            ),
          );
        }),
      ],
    );
  }
}

class _SideNav extends BaseComponent {
  final bool isExpanded;
  final VoidCallback onToggleExpanded;
  const _SideNav({super.key, required this.isExpanded, required this.onToggleExpanded});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tabsRouter = AutoTabsRouter.of(context);

    return Padding(
      padding: const EdgeInsets.only(left: 2.0),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedContainer(
              duration: TRANSITION_DURATION,
              curve: TRANSITION_CURVE,
              width: isExpanded ? SIDE_NAV_WIDTH_EXPANDED : SIDE_NAV_WIDTH_CONTRACTED,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(8),
                  bottomRight: Radius.circular(8),
                ),
                border: Border.all(
                  color: AppColors.getGray(ColorShade.s50),
                ),
              ),
              clipBehavior: Clip.antiAlias,
              child: _SideNavList(tabsRouter: tabsRouter, isExpanded: isExpanded),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: _Expander(onToggleExpanded: onToggleExpanded, isExpanded: isExpanded),
            )
          ],
        ),
      ),
    );
  }
}

class _Expander extends StatelessWidget {
  const _Expander({
    super.key,
    required this.onToggleExpanded,
    required this.isExpanded,
  });

  final ui.VoidCallback onToggleExpanded;
  final bool isExpanded;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onToggleExpanded,
        child: Row(
          children: [
            Container(
              width: 3,
              height: 16,
              decoration: BoxDecoration(
                color: Colors.white30,
                border: Border(
                  left: BorderSide(
                    color: AppColors.getGray(ColorShade.s200),
                  ),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: AppColors.getGray(ColorShade.s100),
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(6),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 6),
                child: AnimatedRotation(
                  duration: TRANSITION_DURATION,
                  curve: TRANSITION_CURVE,
                  turns: isExpanded ? 0.5 : 0,
                  child: Icon(
                    Icons.double_arrow,
                    size: 12,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SideNavList extends BaseComponent {
  final TabsRouter tabsRouter;
  final bool isExpanded;

  const _SideNavList({
    super.key,
    required this.tabsRouter,
    required this.isExpanded,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _SideNavItem(
          title: "Dashboard",
          icon: Icons.dashboard,
          onPressed: () {
            if (tabsRouter.activeIndex == 0) {
              tabsRouter.stackRouterOfIndex(tabsRouter.activeIndex)!.popUntilRoot();
            } else {
              tabsRouter.setActiveIndex(0);
            }
          },
          isActive: tabsRouter.activeIndex == 0,
          isExpanded: isExpanded,
        ),
        _SideNavItem(
          title: "Reserve Accounts",
          icon: Icons.security,
          onPressed: () {
            tabsRouter.setActiveIndex(14);
          },
          isActive: tabsRouter.activeIndex == 14,
          isExpanded: isExpanded,
        ),
        _SideNavItem(
          title: "Send",
          icon: Icons.outbox,
          onPressed: () {
            tabsRouter.setActiveIndex(1);
          },
          isActive: tabsRouter.activeIndex == 1,
          isExpanded: isExpanded,
        ),
        _SideNavItem(
          title: "Receive",
          icon: Icons.move_to_inbox,
          onPressed: () {
            tabsRouter.setActiveIndex(2);
          },
          isActive: tabsRouter.activeIndex == 2,
          isExpanded: isExpanded,
        ),
        _SideNavItem(
          title: "Transactions",
          icon: Icons.paid,
          onPressed: () {
            tabsRouter.setActiveIndex(3);
          },
          isActive: tabsRouter.activeIndex == 3,
          isExpanded: isExpanded,
        ),
        _SideNavItem(
          title: "Validator",
          icon: Icons.check_circle,
          onPressed: () {
            tabsRouter.setActiveIndex(4);
          },
          isActive: tabsRouter.activeIndex == 4,
          isExpanded: isExpanded,
        ),
        _SideNavItem(
          title: "VFX/BTC Domains",
          icon: Icons.link,
          onPressed: () {
            tabsRouter.setActiveIndex(10);
          },
          isActive: tabsRouter.activeIndex == 10,
          isExpanded: isExpanded,
        ),
        _SideNavItem(
          title: "Tokenize Bitcoin",
          icon: FontAwesomeIcons.bitcoin,
          onPressed: () {
            tabsRouter.setActiveIndex(15);
          },
          isActive: tabsRouter.activeIndex == 15,
          isExpanded: isExpanded,
        ),
        _SideNavItem(
          title: "Smart Contracts",
          icon: Icons.receipt_long,
          onPressed: () {
            if (ref.read(sessionProvider).currentWallet == null) {
              Toast.error("A wallet is required to access this section.");
              return;
            }
            tabsRouter.setActiveIndex(8);
            tabsRouter.popTop();
          },
          isActive: tabsRouter.activeIndex == 8,
          isExpanded: isExpanded,
        ),
        _SideNavItem(
          title: "Fungible Tokens",
          icon: Icons.toll,
          onPressed: () {
            if (tabsRouter.activeIndex == 13) {
              tabsRouter.stackRouterOfIndex(tabsRouter.activeIndex)!.popUntilRoot();
            } else {
              tabsRouter.setActiveIndex(13);
            }
          },
          isActive: tabsRouter.activeIndex == 13,
          isExpanded: isExpanded,
        ),
        _SideNavItem(
          title: "NFTs",
          icon: Icons.lightbulb_outline,
          onPressed: () {
            if (ref.read(sessionProvider).currentWallet == null) {
              Toast.error("A wallet is required to access this section.");
              return;
            }
            tabsRouter.setActiveIndex(7);
            tabsRouter.popTop();
          },
          isActive: tabsRouter.activeIndex == 7,
          isExpanded: isExpanded,
        ),
        _SideNavItem(
          title: "P2P Auctions",
          icon: Icons.leak_add,
          onPressed: () {
            if (tabsRouter.activeIndex == 9) {
              tabsRouter.stackRouterOfIndex(tabsRouter.activeIndex)!.popUntilRoot();
            } else {
              tabsRouter.setActiveIndex(9);
            }
          },
          isActive: tabsRouter.activeIndex == 9,
          isExpanded: isExpanded,
        ),
      ],
    );
  }
}

class _SideNavItem extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final IconData icon;
  final bool isActive;
  final bool isExpanded;
  const _SideNavItem({
    super.key,
    required this.title,
    required this.onPressed,
    required this.icon,
    required this.isActive,
    required this.isExpanded,
  });

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onPressed,
        child: AnimatedContainer(
          duration: TRANSITION_DURATION,
          decoration: BoxDecoration(color: isActive ? AppColors.getBlue() : Colors.white30),
          child: Padding(
            padding: const EdgeInsets.only(left: 2),
            child: AnimatedContainer(
              duration: TRANSITION_DURATION,
              decoration: BoxDecoration(
                  color: isActive ? AppColors.getGray(ColorShade.s50) : AppColors.getGray(ColorShade.s200),
                  border: Border(
                    top: BorderSide(
                      color: isActive ? AppColors.getBlue().withOpacity(0.1) : Colors.transparent,
                    ),
                    bottom: BorderSide(
                      color: isActive ? AppColors.getBlue().withOpacity(0.05) : Colors.transparent,
                    ),
                  )),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 3),
                child: Row(
                  children: [
                    AnimatedContainer(
                      duration: TRANSITION_DURATION,
                      decoration: BoxDecoration(
                        color: AppColors.getIndigo(),
                      ),
                      width: 3,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        icon,
                        size: 20,
                        color: isActive ? AppColors.getBlue(ColorShade.s100) : AppColors.getWhite(ColorShade.s400),
                      ),
                    ),
                    Flexible(
                      child: AnimatedOpacity(
                        duration: TRANSITION_DURATION,
                        opacity: isExpanded ? 1 : 0,
                        child: Text(
                          title,
                          overflow: TextOverflow.visible,
                          softWrap: false,
                          style: TextStyle(
                            color: isActive ? AppColors.getBlue(ColorShade.s100) : AppColors.getWhite(ColorShade.s400),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _RotatingCube extends BaseComponent {
  const _RotatingCube({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(sessionProvider).btcSelected
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
          );
  }
}
