import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rbx_wallet/core/base_component.dart';
import 'package:rbx_wallet/core/providers/session_provider.dart';
import 'package:rbx_wallet/core/theme/app_theme.dart';
import 'package:rbx_wallet/generated/assets.gen.dart';

class BtcMenu extends BaseComponent {
  BtcMenu({super.key});

  final scrollController = ScrollController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tabsRouter = AutoTabsRouter.of(context);

    final totalRbxBalance = ref.watch(sessionProvider).totalBalance;
    const totalBtcBalance = 0;

    return Scrollbar(
      controller: scrollController,
      thumbVisibility: true,
      // trackVisibility: true,
      child: SingleChildScrollView(
          controller: scrollController,
          child: Container(
            color: Colors.black,
            width: 200,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "RBX+BTC",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Container(
                  color: Colors.black,
                  child: Center(child: _RotatingCube()),
                ),
                if (totalRbxBalance != null)
                  Container(
                    color: Colors.black,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0).copyWith(top: 0),
                      child: Center(
                        child: Text(
                          "$totalRbxBalance RBX",
                          style: Theme.of(context).textTheme.caption!.copyWith(
                                fontWeight: FontWeight.w600,
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
                      child: Text(
                        "$totalBtcBalance BTC",
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
                    if (tabsRouter.activeIndex == 0) {
                      tabsRouter.stackRouterOfIndex(tabsRouter.activeIndex)!.popUntilRoot();
                    } else {
                      tabsRouter.setActiveIndex(0);
                    }
                  },
                  isActive: tabsRouter.activeIndex == 0,
                ),
                _NavButton(
                  title: "Send",
                  icon: Icons.outbox,
                  onPressed: () {
                    if (tabsRouter.activeIndex == 1) {
                      tabsRouter.stackRouterOfIndex(tabsRouter.activeIndex)!.popUntilRoot();
                    } else {
                      tabsRouter.setActiveIndex(1);
                    }
                  },
                  isActive: tabsRouter.activeIndex == 1,
                ),
                _NavButton(
                  title: "Receive",
                  icon: Icons.move_to_inbox,
                  onPressed: () {
                    if (tabsRouter.activeIndex == 2) {
                      tabsRouter.stackRouterOfIndex(tabsRouter.activeIndex)!.popUntilRoot();
                    } else {
                      tabsRouter.setActiveIndex(2);
                    }
                  },
                  isActive: tabsRouter.activeIndex == 2,
                ),
                _NavButton(
                  title: "Transactions",
                  icon: Icons.paid,
                  onPressed: () {},
                  isActive: false,
                ),
                _NavButton(
                  title: "Reserve Bitcoin",
                  icon: FontAwesomeIcons.bitcoin,
                  onPressed: () {},
                  isActive: false,
                ),
              ],
            ),
          )),
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
        Assets.images.animatedCubeOrange.path,
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
    final textColor = isActive ? Theme.of(context).colorScheme.btcOrange : Theme.of(context).textTheme.bodyText1!.color;

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
