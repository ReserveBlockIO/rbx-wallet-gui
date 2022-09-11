import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:rbx_wallet/app.dart';
import 'package:rbx_wallet/core/app_router.gr.dart';
import 'package:rbx_wallet/core/env.dart';
import 'package:rbx_wallet/features/home/components/footer.dart';
import 'package:rbx_wallet/features/root/navigation/components/main_menu.dart';
import 'package:rbx_wallet/features/root/status/components/status_container.dart';

class RootContainer extends StatelessWidget {
  const RootContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<PageRouteInfo> routes = [
      const HomeTabRouter(),
      const SendTabRouter(),
      const ReceiveTabRouter(),
      const TransactionsTabRouter(),
      const ValidatorTabRouter(),
      const AdjudicatorTabRouter(),
      const NodesTabsRouter(),
      // const DatanodeTabRouter(),
      const NftTabRouter(),
      const SmartContractsTabRouter(),
      const DstsTabRouter(),
      const AdnrTabRouter(),
    ];

    return AutoTabsScaffold(
      scaffoldKey: rootScaffoldKey,
      routes: routes,
      builder: (context, child, animated) {
        return Column(
          children: [
            if (Env.isTestNet)
              Container(
                width: double.infinity,
                color: Colors.green.shade800,
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Center(
                    child: Text(
                      "RBX TEST NET",
                      style: TextStyle(
                        fontSize: 12,
                        letterSpacing: 1,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            Expanded(
              child: Row(
                children: [
                  MainMenu(),
                  Expanded(
                      child: Column(
                    children: [
                      Expanded(child: child),
                      const Footer(),
                    ],
                  )),
                  const StatusContainer(),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
