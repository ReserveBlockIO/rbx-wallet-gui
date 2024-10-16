import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../btc/providers/tokenized_bitcoin_list_provider.dart';
import '../../../../core/theme/app_theme.dart';

import '../../../../core/base_component.dart';
import '../../../../core/providers/session_provider.dart';
import '../../../../generated/assets.gen.dart';
import '../../../../utils/toast.dart';

import '../../../../features/btc/providers/btc_balance_provider.dart';

class MainMenu extends BaseComponent {
  // ignoreing this because otherwise dartfix will try to make it a const which screws up rebuilds
  // ignore: prefer_const_constructors_in_immutables
  MainMenu({Key? key}) : super(key: key);

  final scrollController = ScrollController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tabsRouter = AutoTabsRouter.of(context);

    final totalBalance = ref.watch(sessionProvider.select((v) => v.totalBalance));
    final btcBalance = ref.watch(btcBalanceProvider);
    final btcAccountSyncInfo = ref.watch(sessionProvider.select((v) => v.btcAccountSyncInfo));

    double vBtcBalance = 0;
    for (final a in ref.watch(tokenizedBitcoinListProvider)) {
      vBtcBalance += a.myBalance;
    }

    // final vBtcBalance = ref.watch(tokenizedBitcoinListProvider).fold<double>(0.0, (previousValue, element) => previousValue + element.myBalance);

    return Scrollbar(
      controller: scrollController,
      thumbVisibility: true,
      // trackVisibility: true,
      child: SingleChildScrollView(
        controller: scrollController,
        child: Container(
          decoration: const BoxDecoration(color: Colors.black54),
          width: 200,
          child: Stack(
            children: [
              Align(
                alignment: Alignment.bottomLeft,
                child: Image.asset(
                  Assets.images.decorBottomLeft.path,
                  fit: BoxFit.contain,
                  width: 200,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    color: Colors.black,
                    child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "Verified",
                                style: TextStyle(
                                  color: Colors.white.withOpacity(0.7),
                                  fontSize: 32,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'Mukta',
                                  letterSpacing: 0,
                                ),
                              ),
                              Text(
                                "X",
                                style: TextStyle(
                                  color: Theme.of(context).colorScheme.secondary,
                                  fontSize: 32,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: 'Mukta',
                                  letterSpacing: 0,
                                ),
                              ),
                            ],
                          ),
                        )
                        // child: Center(
                        //     child: Text(
                        //   "RBXWallet",
                        //   style: Theme.of(context)
                        //       .textTheme
                        //       .headline4!
                        //       .copyWith(color: Colors.white70, letterSpacing: 2),
                        // )),
                        ),
                  ),
                  Container(
                    color: Colors.black,
                    child: Center(
                      child: _RotatingCube(btc: ref.watch(sessionProvider.select((v) => v.btcSelected))),
                    ),
                  ),
                  Container(
                    color: Colors.black,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0).copyWith(top: 0),
                      child: Center(
                        child: Text(
                          totalBalance != null ? "$totalBalance VFX" : "0.0 VFX",
                          style: Theme.of(context).textTheme.bodySmall!.copyWith(
                                fontWeight: FontWeight.w600,
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                        ),
                      ),
                    ),
                  ),
                  // if (btcBalance > 0)
                  Container(
                    color: Colors.black,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0).copyWith(top: 0),
                      child: Center(
                        child: Tooltip(
                          message: btcAccountSyncInfo != null
                              ? "Last Sync: ${btcAccountSyncInfo.lastSyncFormatted}\nNext Sync: ${btcAccountSyncInfo.nextSyncFormatted}"
                              : "",
                          child: Text(
                            "${btcBalance.toStringAsFixed(9)} BTC",
                            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: Theme.of(context).colorScheme.btcOrange,
                                ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    color: Colors.black,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0).copyWith(top: 0),
                      child: Center(
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                                  fontWeight: FontWeight.w600,
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
                                  color: Theme.of(context).colorScheme.secondary,
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
                  ),
                  _NavButton(
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
                  ),
                  _NavButton(
                    title: "Vault Accounts",
                    icon: Icons.security,
                    onPressed: () {
                      tabsRouter.setActiveIndex(14);
                    },
                    isActive: tabsRouter.activeIndex == 14,
                  ),
                  _NavButton(
                    title: "Send",
                    icon: Icons.outbox,
                    onPressed: () {
                      tabsRouter.setActiveIndex(1);
                    },
                    isActive: tabsRouter.activeIndex == 1,
                  ),
                  _NavButton(
                    title: "Receive",
                    icon: Icons.move_to_inbox,
                    onPressed: () {
                      tabsRouter.setActiveIndex(2);
                    },
                    isActive: tabsRouter.activeIndex == 2,
                  ),
                  _NavButton(
                    title: "Transactions",
                    icon: Icons.paid,
                    onPressed: () {
                      tabsRouter.setActiveIndex(3);
                    },
                    isActive: tabsRouter.activeIndex == 3,
                  ),
                  if (!kIsWeb)
                    _NavButton(
                      title: "Validator",
                      icon: Icons.check_circle,
                      onPressed: () {
                        tabsRouter.setActiveIndex(4);
                      },
                      isActive: tabsRouter.activeIndex == 4,
                    ),

                  // if (!kIsWeb)
                  //   _NavButton(
                  //     title: "Validator Pool",
                  //     icon: Icons.wifi,
                  //     onPressed: () {
                  //       tabsRouter.setActiveIndex(6);
                  //     },
                  //     isActive: tabsRouter.activeIndex == 6,
                  //   ),
                  // if (!kIsWeb)
                  //   _NavButton(
                  //     title: "Validator Voting",
                  //     icon: Icons.how_to_vote,
                  //     onPressed: () {
                  //       tabsRouter.setActiveIndex(11);
                  //     },
                  //     isActive: tabsRouter.activeIndex == 11,
                  //   ),
                  // _NavButton(
                  //   title: "Beacons",
                  //   icon: Icons.satellite_alt,
                  //   onPressed: () {
                  //     tabsRouter.setActiveIndex(12);
                  //   },
                  //   isActive: tabsRouter.activeIndex == 12,
                  // ),

                  _NavButton(
                    title: "VFX/BTC Domains",
                    icon: Icons.link,
                    onPressed: () {
                      tabsRouter.setActiveIndex(10);
                    },
                    isActive: tabsRouter.activeIndex == 10,
                  ),
                  _NavButton(
                    title: "Tokenize Bitcoin",
                    icon: FontAwesomeIcons.bitcoin,
                    activeColorOverride: Theme.of(context).colorScheme.btcOrange,
                    onPressed: () {
                      tabsRouter.setActiveIndex(15);
                    },
                    isActive: tabsRouter.activeIndex == 15,
                  ),
                  _NavButton(
                    title: "Smart Contracts",
                    icon: Icons.receipt_long,
                    onPressed: () {
                      if (ref.read(sessionProvider).currentWallet == null) {
                        Toast.error("An account is required to access this section.");
                        return;
                      }
                      tabsRouter.setActiveIndex(8);
                      tabsRouter.popTop();
                    },
                    isActive: tabsRouter.activeIndex == 8,
                  ),
                  _NavButton(
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
                  ),

                  // if (!kIsWeb)
                  //   _NavButton(
                  //     title: "Adjudicator",
                  //     icon: Icons.gavel,
                  //     onPressed: () {
                  //       tabsRouter.setActiveIndex(5);
                  //     },
                  //     isActive: tabsRouter.activeIndex == 5,
                  //   ),
                  _NavButton(
                    title: "NFTs",
                    icon: Icons.lightbulb_outline,
                    onPressed: () {
                      if (ref.read(sessionProvider).currentWallet == null) {
                        Toast.error("An account is required to access this section.");
                        return;
                      }
                      tabsRouter.setActiveIndex(7);
                      tabsRouter.popTop();
                    },
                    isActive: tabsRouter.activeIndex == 7,
                  ),

                  _NavButton(
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
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _RotatingCube extends StatelessWidget {
  final bool btc;
  const _RotatingCube({
    required this.btc,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      width: 100,
      child: btc
          ? Image.asset(
              Assets.images.animatedCubeBtc.path,
              scale: 1,
            )
          : Image.asset(
              Assets.images.animatedCube.path,
              scale: 1,
            ),
    );
  }
}

class _NavButton extends StatelessWidget {
  final String title;
  final Function() onPressed;
  final IconData icon;
  final bool isActive;
  final Color? activeColorOverride;

  const _NavButton({
    Key? key,
    required this.title,
    required this.onPressed,
    required this.icon,
    this.isActive = false,
    this.activeColorOverride,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textColor = isActive ? activeColorOverride ?? Theme.of(context).colorScheme.secondary : Theme.of(context).textTheme.bodyLarge!.color;

    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.white10, width: 1),
        ),
      ),
      width: double.infinity,
      child: TextButton.icon(
        style: TextButton.styleFrom(
          foregroundColor: textColor,
          padding: const EdgeInsets.all(22.0),
          alignment: Alignment.centerLeft,
        ),
        icon: Icon(
          icon,
          size: 16,
        ),
        onPressed: onPressed,
        label: Text(title),
      ),
    );
  }
}
