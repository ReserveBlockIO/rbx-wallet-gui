import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:rbx_wallet/app.dart';
import 'package:rbx_wallet/core/app_router.gr.dart';
import 'package:rbx_wallet/features/home/components/footer.dart';
import 'package:rbx_wallet/features/root/navigation/components/main_menu.dart';
import 'package:rbx_wallet/features/root/status/components/status_container.dart';

class RootContainer extends StatelessWidget {
  const RootContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<PageRouteInfo> routes = [
      HomeTabRouter(),
      SendTabRouter(),
      ReceiveTabRouter(),
      TransactionsTabRouter(),
      ValidatorTabRouter(),
      DatanodeTabRouter(),
      NftTabRouter(),
      SmartContractsTabRouter(),
      DstsTabRouter(),
      ExplorerTabRouter(),
    ];

    return AutoTabsScaffold(
      scaffoldKey: rootScaffoldKey,
      routes: routes,
      builder: (context, child, animated) {
        return Row(
          children: [
            MainMenu(),
            Expanded(
                child: Column(
              children: [
                Expanded(child: child),
                Footer(),
              ],
            )),
            StatusContainer(),
          ],
        );
      },
    );
  }
}
