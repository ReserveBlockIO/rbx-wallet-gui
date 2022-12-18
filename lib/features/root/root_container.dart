import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/features/encrypt/providers/startup_password_required_provider.dart';
import 'package:rbx_wallet/features/encrypt/components/unlock_wallet.dart';

import '../../app.dart';
import '../../core/app_router.gr.dart';
import '../../core/env.dart';
import '../home/components/footer.dart';
import 'navigation/components/main_menu.dart';
import 'status/components/status_container.dart';

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
      const VotingTabRouter(),
      const BeaconTabRouter(),
    ];

    return AutoTabsScaffold(
      scaffoldKey: rootScaffoldKey,
      routes: routes,
      builder: (context, child, animated) {
        return Stack(
          children: [
            Column(
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
                      Container(color: Colors.black, height: double.infinity, child: MainMenu()),
                      Expanded(
                          child: Column(
                        children: [
                          Expanded(child: Container(clipBehavior: Clip.antiAlias, decoration: BoxDecoration(), child: child)),
                          const Footer(),
                        ],
                      )),
                      const StatusContainer(),
                    ],
                  ),
                ),
              ],
            ),
            Consumer(builder: (context, ref, _) {
              return ref.watch(startupPasswordRequiredProvider)
                  ? UnlockWallet(
                      read: ref.read,
                    )
                  : SizedBox.shrink();
            })
          ],
        );
      },
    );
  }
}
