import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../core/base_component.dart';
import '../../../core/providers/session_provider.dart';
import '../../../utils/toast.dart';
import 'root_container_side_nav_item.dart';

class RootContainerSideNavList extends BaseComponent {
  final TabsRouter tabsRouter;
  final bool isExpanded;

  const RootContainerSideNavList({
    super.key,
    required this.tabsRouter,
    required this.isExpanded,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        RootContainerSideNavItem(
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
        RootContainerSideNavItem(
          title: "Reserve Accounts",
          icon: Icons.security,
          onPressed: () {
            tabsRouter.setActiveIndex(14);
          },
          isActive: tabsRouter.activeIndex == 14,
          isExpanded: isExpanded,
        ),
        RootContainerSideNavItem(
          title: "Send",
          icon: Icons.outbox,
          onPressed: () {
            tabsRouter.setActiveIndex(1);
          },
          isActive: tabsRouter.activeIndex == 1,
          isExpanded: isExpanded,
        ),
        RootContainerSideNavItem(
          title: "Receive",
          icon: Icons.move_to_inbox,
          onPressed: () {
            tabsRouter.setActiveIndex(2);
          },
          isActive: tabsRouter.activeIndex == 2,
          isExpanded: isExpanded,
        ),
        RootContainerSideNavItem(
          title: "Transactions",
          icon: Icons.paid,
          onPressed: () {
            tabsRouter.setActiveIndex(3);
          },
          isActive: tabsRouter.activeIndex == 3,
          isExpanded: isExpanded,
        ),
        RootContainerSideNavItem(
          title: "Validator",
          icon: Icons.check_circle,
          onPressed: () {
            tabsRouter.setActiveIndex(4);
          },
          isActive: tabsRouter.activeIndex == 4,
          isExpanded: isExpanded,
        ),
        RootContainerSideNavItem(
          title: "Domains",
          icon: Icons.link,
          onPressed: () {
            tabsRouter.setActiveIndex(10);
          },
          isActive: tabsRouter.activeIndex == 10,
          isExpanded: isExpanded,
        ),
        RootContainerSideNavItem(
          title: "Tokenize Bitcoin",
          icon: FontAwesomeIcons.bitcoin,
          onPressed: () {
            tabsRouter.setActiveIndex(15);
          },
          isActive: tabsRouter.activeIndex == 15,
          isExpanded: isExpanded,
        ),
        RootContainerSideNavItem(
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
        RootContainerSideNavItem(
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
        RootContainerSideNavItem(
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
        RootContainerSideNavItem(
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
        RootContainerSideNavItem(
          title: "Operations",
          icon: Icons.bolt,
          onPressed: () {
            if (tabsRouter.activeIndex == 16) {
              tabsRouter.stackRouterOfIndex(tabsRouter.activeIndex)!.popUntilRoot();
            } else {
              tabsRouter.setActiveIndex(16);
            }
          },
          isActive: tabsRouter.activeIndex == 16,
          isExpanded: isExpanded,
        ),
      ],
    );
  }
}
