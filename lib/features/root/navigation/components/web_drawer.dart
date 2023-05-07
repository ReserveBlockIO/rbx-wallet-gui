import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/dialogs.dart';

import '../../../../core/base_component.dart';
import '../../../../generated/assets.gen.dart';
import '../../../auth/auth_utils.dart';
import '../../web_dashboard_container.dart';

class WebDrawer extends BaseComponent {
  const WebDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Drawer(
      backgroundColor: Colors.black87.withOpacity(.7),
      child: WebMenu(
        inDrawer: true,
      ),
    );
  }
}

class WebMenu extends BaseComponent {
  final bool inDrawer;
  // ignore: prefer_const_constructors_in_immutables
  WebMenu({
    Key? key,
    this.inDrawer = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tabsRouter = AutoTabsRouter.of(context);

    final color = Theme.of(context).textTheme.bodyText1!.color;
    final activeColor = Theme.of(context).colorScheme.secondary;
    return Column(
      children: [
        Container(
          color: Colors.black,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                // if (ref.read(webSessionProvider).keypair != null) {
                //   AutoRouter.of(context).push(WebDashboardContainerRoute());
                // } else {
                //   AutoRouter.of(context).push(WebAuthRouter());
                // }
              },
              child: Row(
                children: [
                  SizedBox(
                    width: 40,
                    height: 40,
                    child: Image.asset(
                      Assets.images.animatedCube.path,
                      scale: 1,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Image.asset(
                    Assets.images.rbxWallet.path,
                    width: 120,
                    height: 20,
                    fit: BoxFit.contain,
                  ),
                ],
              ),
            ),
          ),
        ),
        const Divider(
          height: 1,
        ),
        ListTile(
          title: Text(
            "Dashboard",
            style: TextStyle(
              color: tabsRouter.activeIndex == WebRouteIndex.home ? activeColor : color,
            ),
          ),
          leading: const Icon(Icons.dashboard),
          trailing: const Icon(Icons.chevron_right),
          onTap: () {
            if (tabsRouter.activeIndex == WebRouteIndex.home) {
              tabsRouter.stackRouterOfIndex(tabsRouter.activeIndex)!.popUntilRoot();
            } else {
              tabsRouter.setActiveIndex(WebRouteIndex.home);
            }

            if (inDrawer) {
              Navigator.of(context).pop();
            }
          },
        ),
        ListTile(
          title: Text(
            "Send",
            style: TextStyle(
              color: tabsRouter.activeIndex == WebRouteIndex.send ? activeColor : color,
            ),
          ),
          leading: const Icon(Icons.outbox),
          trailing: const Icon(Icons.chevron_right),
          onTap: () {
            tabsRouter.setActiveIndex(WebRouteIndex.send);
            if (inDrawer) {
              Navigator.of(context).pop();
            }
          },
        ),
        ListTile(
          title: Text(
            "Receive",
            style: TextStyle(
              color: tabsRouter.activeIndex == WebRouteIndex.recieve ? activeColor : color,
            ),
          ),
          leading: const Icon(Icons.move_to_inbox),
          trailing: const Icon(Icons.chevron_right),
          onTap: () {
            tabsRouter.setActiveIndex(WebRouteIndex.recieve);
            if (inDrawer) {
              Navigator.of(context).pop();
            }
          },
        ),
        ListTile(
          title: Text(
            "Transactions",
            style: TextStyle(
              color: tabsRouter.activeIndex == WebRouteIndex.transactions ? activeColor : color,
            ),
          ),
          leading: const Icon(Icons.paid),
          trailing: const Icon(Icons.chevron_right),
          onTap: () {
            if (tabsRouter.activeIndex == WebRouteIndex.transactions) {
              tabsRouter.stackRouterOfIndex(WebRouteIndex.transactions)!.popUntilRoot();
            } else {
              tabsRouter.setActiveIndex(WebRouteIndex.transactions);
            }

            if (inDrawer) {
              Navigator.of(context).pop();
            }
          },
        ),
        ListTile(
          title: Text(
            "RBX Domains",
            style: TextStyle(
              color: tabsRouter.activeIndex == WebRouteIndex.adnrs ? activeColor : color,
            ),
          ),
          leading: const Icon(Icons.link),
          trailing: const Icon(Icons.chevron_right),
          onTap: () {
            tabsRouter.setActiveIndex(WebRouteIndex.adnrs);
            if (inDrawer) {
              Navigator.of(context).pop();
            }
          },
        ),
        ListTile(
          title: Text(
            "Smart Contracts",
            style: TextStyle(
              color: tabsRouter.activeIndex == WebRouteIndex.smartContracts ? activeColor : color,
            ),
          ),
          leading: const Icon(Icons.receipt_long),
          trailing: const Icon(Icons.chevron_right),
          onTap: () {
            if (tabsRouter.activeIndex == WebRouteIndex.smartContracts) {
              tabsRouter.stackRouterOfIndex(tabsRouter.activeIndex)!.popUntilRoot();
            } else {
              tabsRouter.setActiveIndex(WebRouteIndex.smartContracts);
            }
            if (inDrawer) {
              Navigator.of(context).pop();
            }
          },
        ),
        ListTile(
          title: Text(
            "NFTs",
            style: TextStyle(
              color: tabsRouter.activeIndex == WebRouteIndex.nfts ? activeColor : color,
            ),
          ),
          leading: const Icon(Icons.lightbulb_outline),
          trailing: const Icon(Icons.chevron_right),
          onTap: () {
            if (tabsRouter.activeIndex == WebRouteIndex.nfts) {
              tabsRouter.stackRouterOfIndex(tabsRouter.activeIndex)!.popUntilRoot();
            } else {
              tabsRouter.setActiveIndex(WebRouteIndex.nfts);
            }
            if (inDrawer) {
              Navigator.of(context).pop();
            }
          },
        ),
        ListTile(
          title: Text(
            "P2P Auctions",
            style: TextStyle(
              color: tabsRouter.activeIndex == WebRouteIndex.shop ? activeColor : color,
            ),
          ),
          leading: const Icon(Icons.leak_add),
          trailing: const Icon(Icons.chevron_right),
          onTap: () {
            if (tabsRouter.activeIndex == WebRouteIndex.shop) {
              tabsRouter.stackRouterOfIndex(tabsRouter.activeIndex)!.popUntilRoot();
            } else {
              tabsRouter.setActiveIndex(WebRouteIndex.shop);
            }
            if (inDrawer) {
              Navigator.of(context).pop();
            }
          },
        ),
        ListTile(
          title: Text(
            "Logout",
            style: TextStyle(color: Colors.red.shade600),
          ),
          leading: Icon(
            Icons.logout,
            color: Colors.red.shade600,
          ),
          trailing: Icon(Icons.chevron_right, color: Colors.red.shade600),
          onTap: () async {
            final confirmed = await ConfirmDialog.show(
              title: "Logout",
              body: "Are you sure you want to logout of the RBX Web Wallet?",
              destructive: true,
              confirmText: "Logout",
              cancelText: "Cancel",
            );
            if (confirmed == true) {
              await logout(context, ref);
            }
          },
        )
      ],
    );
  }
}
