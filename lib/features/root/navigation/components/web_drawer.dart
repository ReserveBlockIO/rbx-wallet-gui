import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/base_component.dart';
import 'package:rbx_wallet/features/auth/auth_utils.dart';
import 'package:rbx_wallet/features/root/web_dashboard_container.dart';
import 'package:rbx_wallet/generated/assets.gen.dart';

class WebDrawer extends BaseComponent {
  const WebDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tabsRouter = AutoTabsRouter.of(context);

    return Drawer(
      backgroundColor: Colors.black87.withOpacity(.7),
      child: Column(
        children: [
          Container(
            color: Colors.black,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  SizedBox(
                    width: 54,
                    height: 54,
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
          const Divider(
            height: 1,
          ),
          ListTile(
            title: const Text("Dashboard"),
            leading: const Icon(Icons.dashboard),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              tabsRouter.setActiveIndex(WebRouteIndex.home);
              Navigator.of(context).pop();
            },
          ),
          ListTile(
            title: const Text("Send"),
            leading: const Icon(Icons.outbox),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              tabsRouter.setActiveIndex(WebRouteIndex.send);
              Navigator.of(context).pop();
            },
          ),
          ListTile(
            title: const Text("Receive"),
            leading: const Icon(Icons.move_to_inbox),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {},
          ),
          ListTile(
            title: const Text("NFTs"),
            leading: const Icon(Icons.lightbulb_outline),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              tabsRouter.setActiveIndex(WebRouteIndex.nfts);
              Navigator.of(context).pop();
            },
          ),
          ListTile(
            title: const Text("Smart Contracts"),
            leading: const Icon(Icons.receipt_long),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {},
          ),
          ListTile(
            title: const Text("DSTs"),
            leading: const Icon(Icons.leak_add),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {},
          ),
          ListTile(
            title: const Text("Logout"),
            leading: const Icon(Icons.logout),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              logout(context, ref);
            },
          )
        ],
      ),
    );
  }
}
