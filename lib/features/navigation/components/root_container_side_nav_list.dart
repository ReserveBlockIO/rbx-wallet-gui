import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../root/web_dashboard_container.dart';

import '../../../core/base_component.dart';
import '../../../core/providers/session_provider.dart';
import '../../../core/theme/pretty_icons.dart';
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
          iconType: PrettyIconType.dashboard,
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
          title: "Vault Accounts",
          iconType: PrettyIconType.lock,
          onPressed: () {
            tabsRouter.setActiveIndex(kIsWeb ? WebRouteIndex.reserve : 14);
          },
          isActive: tabsRouter.activeIndex == (kIsWeb ? WebRouteIndex.reserve : 14),
          isExpanded: isExpanded,
        ),
        RootContainerSideNavItem(
          title: "Domains",
          iconType: PrettyIconType.domain,
          onPressed: () {
            tabsRouter.setActiveIndex(kIsWeb ? WebRouteIndex.adnrs : 10);
          },
          isActive: tabsRouter.activeIndex == (kIsWeb ? WebRouteIndex.adnrs : 10),
          isExpanded: isExpanded,
        ),
        RootContainerSideNavItem(
          title: "Send",
          iconType: PrettyIconType.send,
          onPressed: () {
            tabsRouter.setActiveIndex(1);
          },
          isActive: tabsRouter.activeIndex == 1,
          isExpanded: isExpanded,
        ),
        RootContainerSideNavItem(
          title: "Receive",
          iconType: PrettyIconType.receive,
          onPressed: () {
            tabsRouter.setActiveIndex(2);
          },
          isActive: tabsRouter.activeIndex == 2,
          isExpanded: isExpanded,
        ),
        RootContainerSideNavItem(
          title: "Transactions",
          iconType: PrettyIconType.transactions,
          onPressed: () {
            tabsRouter.setActiveIndex(3);
          },
          isActive: tabsRouter.activeIndex == 3,
          isExpanded: isExpanded,
        ),
        RootContainerSideNavItem(
          title: "Tokenize BTC",
          iconType: PrettyIconType.bitcoin,
          onPressed: () {
            if (kIsWeb) {
              tabsRouter.setActiveIndex(WebRouteIndex.vbtc);
              return;
            }
            tabsRouter.setActiveIndex(15);
          },
          isActive: tabsRouter.activeIndex == (kIsWeb ? WebRouteIndex.vbtc : 15),
          isExpanded: isExpanded,
        ),
        RootContainerSideNavItem(
          title: "Fungible Tokens",
          iconType: PrettyIconType.fungibleToken,
          onPressed: () {
            if (kIsWeb) {
              tabsRouter.setActiveIndex(WebRouteIndex.tokens);
              return;
            }

            if (tabsRouter.activeIndex == 13) {
              tabsRouter.stackRouterOfIndex(tabsRouter.activeIndex)!.popUntilRoot();
            } else {
              tabsRouter.setActiveIndex(13);
            }
          },
          isActive: tabsRouter.activeIndex == (kIsWeb ? WebRouteIndex.tokens : 13),
          isExpanded: isExpanded,
        ),
        RootContainerSideNavItem(
          title: "Smart Contracts",
          iconType: PrettyIconType.smartContract,
          onPressed: () {
            if (kIsWeb) {
              tabsRouter.setActiveIndex(WebRouteIndex.smartContracts);
              return;
            }
            if (ref.read(sessionProvider).currentWallet == null) {
              Toast.error("An account is required to access this section.");
              return;
            }
            tabsRouter.setActiveIndex(8);
            tabsRouter.popTop();
          },
          isActive: tabsRouter.activeIndex == (kIsWeb ? WebRouteIndex.smartContracts : 8),
          isExpanded: isExpanded,
        ),
        RootContainerSideNavItem(
          title: "Manage NFTs",
          iconType: PrettyIconType.nft,
          onPressed: () {
            if (kIsWeb) {
              tabsRouter.setActiveIndex(WebRouteIndex.nfts);
              return;
            }
            if (ref.read(sessionProvider).currentWallet == null) {
              Toast.error("An account is required to access this section.");
              return;
            }
            tabsRouter.setActiveIndex(7);
            tabsRouter.popTop();
          },
          isActive: tabsRouter.activeIndex == (kIsWeb ? WebRouteIndex.nfts : 7),
          isExpanded: isExpanded,
        ),
        RootContainerSideNavItem(
          title: "P2P Auctions",
          iconType: PrettyIconType.p2p,
          onPressed: () {
            if (kIsWeb) {
              tabsRouter.setActiveIndex(WebRouteIndex.shop);
              return;
            }

            if (tabsRouter.activeIndex == 9) {
              tabsRouter.stackRouterOfIndex(tabsRouter.activeIndex)!.popUntilRoot();
            } else {
              tabsRouter.setActiveIndex(9);
            }
          },
          isActive: tabsRouter.activeIndex == (kIsWeb ? WebRouteIndex.shop : 9),
          isExpanded: isExpanded,
        ),
        if (!kIsWeb)
          RootContainerSideNavItem(
            title: "Validator",
            iconType: PrettyIconType.validator,
            onPressed: () {
              tabsRouter.setActiveIndex(4);
            },
            isActive: tabsRouter.activeIndex == 4,
            isExpanded: isExpanded,
          ),
        if (!kIsWeb)
          RootContainerSideNavItem(
            title: "Operations",
            iconType: PrettyIconType.operations,
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
