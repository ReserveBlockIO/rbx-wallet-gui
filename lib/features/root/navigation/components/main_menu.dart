import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/base_component.dart';
import 'package:rbx_wallet/core/providers/session_provider.dart';
import 'package:rbx_wallet/generated/assets.gen.dart';
import 'package:url_launcher/url_launcher.dart';

class MainMenu extends BaseComponent {
  const MainMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tabsRouter = AutoTabsRouter.of(context);

    return Container(
      decoration: BoxDecoration(color: Colors.black54),
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
                      child: Text(
                    "RBXWallet",
                    style: Theme.of(context)
                        .textTheme
                        .headline4!
                        .copyWith(color: Colors.white70, letterSpacing: 2),
                  )),
                ),
              ),
              Container(
                color: Colors.black,
                child: Center(
                  child: Container(
                    color: Colors.black,
                    width: 100,
                    child: Image.asset(
                      Assets.images.animatedCube.path,
                      scale: 1,
                    ),
                  ),
                ),
              ),
              if (ref.watch(sessionProvider).currentWallet != null)
                Container(
                  color: Colors.black,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0).copyWith(top: 0),
                    child: Center(
                      child: Text(
                        "${ref.watch(sessionProvider).currentWallet!.balance} RBX",
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
              _NavButton(
                title: "Validator",
                icon: Icons.check_circle,
                onPressed: () {
                  tabsRouter.setActiveIndex(4);
                },
                isActive: tabsRouter.activeIndex == 4,
              ),
              _NavButton(
                title: "Datanode",
                icon: Icons.storage,
                onPressed: () {
                  tabsRouter.setActiveIndex(5);
                },
                isActive: tabsRouter.activeIndex == 5,
              ),
              _NavButton(
                title: "NFTs",
                icon: Icons.lightbulb_outline,
                onPressed: () {
                  tabsRouter.setActiveIndex(6);
                },
                isActive: tabsRouter.activeIndex == 6,
              ),
              _NavButton(
                title: "Smart Contracts",
                icon: Icons.receipt_long,
                onPressed: () {
                  tabsRouter.setActiveIndex(7);
                },
                isActive: tabsRouter.activeIndex == 7,
              ),
              _NavButton(
                title: "DSTs",
                icon: Icons.leak_add,
                onPressed: () {
                  tabsRouter.setActiveIndex(8);
                },
                isActive: tabsRouter.activeIndex == 8,
              ),
              _NavButton(
                title: "Explorer",
                icon: Icons.search,
                onPressed: () {
                  // tabsRouter.setActiveIndex(9);
                  launch("https://rbx.network");
                },
                // isActive: tabsRouter.activeIndex == 9,
              ),
            ],
          ),
        ],
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
    final textColor = isActive
        ? Theme.of(context).colorScheme.secondary
        : Theme.of(context).textTheme.bodyText1!.color;

    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.white10, width: 1),
        ),
      ),
      width: double.infinity,
      child: TextButton.icon(
        style: TextButton.styleFrom(
          primary: textColor,
          padding: const EdgeInsets.all(24.0),
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
