import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/base_component.dart';
import 'package:rbx_wallet/core/web_router.gr.dart';
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
                  SizedBox(width: 8),
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
          Divider(
            height: 1,
          ),
          ListTile(
            title: Text("Dashboard"),
            leading: Icon(Icons.dashboard),
            trailing: Icon(Icons.chevron_right),
            onTap: () {
              tabsRouter.setActiveIndex(WebRouteIndex.home);
              Navigator.of(context).pop();
            },
          ),
          ListTile(
            title: Text("Send"),
            leading: Icon(Icons.outbox),
            trailing: Icon(Icons.chevron_right),
            onTap: () {
              tabsRouter.setActiveIndex(WebRouteIndex.send);
              Navigator.of(context).pop();
            },
          ),
          ListTile(
            title: Text("Receive"),
            leading: Icon(Icons.move_to_inbox),
            trailing: Icon(Icons.chevron_right),
            onTap: () {},
          ),
          ListTile(
            title: Text("NFTs"),
            leading: Icon(Icons.lightbulb_outline),
            trailing: Icon(Icons.chevron_right),
            onTap: () {
              tabsRouter.setActiveIndex(WebRouteIndex.nfts);
              Navigator.of(context).pop();
            },
          ),
          ListTile(
            title: Text("Smart Contracts"),
            leading: Icon(Icons.receipt_long),
            trailing: Icon(Icons.chevron_right),
            onTap: () {},
          ),
          ListTile(
            title: Text("DSTs"),
            leading: Icon(Icons.leak_add),
            trailing: Icon(Icons.chevron_right),
            onTap: () {},
          ),
          ListTile(
            title: Text("Logout"),
            leading: Icon(Icons.logout),
            trailing: Icon(Icons.chevron_right),
            onTap: () {
              logout(context, ref);
            },
          )
        ],
      ),
    );
  }
}
