import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/base_component.dart';
import '../../../../core/providers/session_provider.dart';
import '../../../../generated/assets.gen.dart';
import '../../../../utils/toast.dart';

class MainMenu extends BaseComponent {
  // ignoreing this because otherwise dartfix will try to make it a const which screws up rebuilds
  // ignore: prefer_const_constructors_in_immutables
  MainMenu({Key? key}) : super(key: key);

  final scrollController = ScrollController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tabsRouter = AutoTabsRouter.of(context);

    final totalBalance = ref.watch(sessionProvider).totalBalance;

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
                      padding: const EdgeInsets.all(16.0),
                      child: Center(
                        child: Image.asset(
                          Assets.images.rbxWallet.path,
                          width: 160,
                          height: 27,
                          fit: BoxFit.contain,
                        ),
                      ),
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
                    child: const Center(
                      child: _RotatingCube(),
                    ),
                  ),
                  Container(
                    color: Colors.black,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0).copyWith(top: 0),
                      child: Center(
                        child: Text(
                          totalBalance != null ? "$totalBalance RBX" : "",
                          style: Theme.of(context).textTheme.caption!.copyWith(
                                fontWeight: FontWeight.w600,
                              ),
                        ),
                      ),
                    ),
                  ),
                  _NavButton(
                    title: "Dashboard",
                    icon: Icons.dashboard,
                    onPressed: () {
                      tabsRouter.setActiveIndex(0);
                    },
                    isActive: tabsRouter.activeIndex == 0,
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
                      title: "Masternode",
                      icon: Icons.check_circle,
                      onPressed: () {
                        tabsRouter.setActiveIndex(4);
                      },
                      isActive: tabsRouter.activeIndex == 4,
                    ),

                  if (!kIsWeb)
                    _NavButton(
                      title: "Validator Pool",
                      icon: Icons.wifi,
                      onPressed: () {
                        tabsRouter.setActiveIndex(6);
                      },
                      isActive: tabsRouter.activeIndex == 6,
                    ),
                  if (!kIsWeb)
                    _NavButton(
                      title: "Validator Voting",
                      icon: Icons.how_to_vote,
                      onPressed: () {
                        tabsRouter.setActiveIndex(11);
                      },
                      isActive: tabsRouter.activeIndex == 11,
                    ),

                  _NavButton(
                    title: "RBX Domains",
                    icon: Icons.link,
                    onPressed: () {
                      tabsRouter.setActiveIndex(10);
                    },
                    isActive: tabsRouter.activeIndex == 10,
                  ),
                  _NavButton(
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
                        Toast.error("A wallet is required to access this section.");
                        return;
                      }
                      tabsRouter.setActiveIndex(7);
                      tabsRouter.popTop();
                    },
                    isActive: tabsRouter.activeIndex == 7,
                  ),
                  _NavButton(
                    title: "Beacons",
                    icon: Icons.wifi,
                    onPressed: () {
                      tabsRouter.setActiveIndex(12);
                    },
                    isActive: tabsRouter.activeIndex == 12,
                  ),

                  _NavButton(
                    title: "DSTs",
                    icon: Icons.leak_add,
                    onPressed: () {
                      tabsRouter.setActiveIndex(9);
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
  const _RotatingCube({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      width: 100,
      child: Image.asset(
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

  const _NavButton({
    Key? key,
    required this.title,
    required this.onPressed,
    required this.icon,
    this.isActive = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textColor = isActive ? Theme.of(context).colorScheme.secondary : Theme.of(context).textTheme.bodyText1!.color;

    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.white10, width: 1),
        ),
      ),
      width: double.infinity,
      child: TextButton.icon(
        style: TextButton.styleFrom(
          primary: textColor,
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
