import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/app.dart';
import 'package:rbx_wallet/core/app_router.gr.dart';
import 'package:rbx_wallet/core/base_component.dart';
import 'package:rbx_wallet/core/theme/app_theme.dart';
import 'package:rbx_wallet/features/btc/components/btc_status_container.dart';
import 'package:rbx_wallet/features/home/components/footer.dart';
import 'package:rbx_wallet/features/root/status/components/status_container.dart';

import 'btc_menu.dart';
import 'btc_rbx_switch.dart';

class BtcRootContainer extends BaseComponent {
  const BtcRootContainer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<PageRouteInfo> routes = [
      BtcDashboardTabRouter(),
      BtcSendTabRouter(),
      BtcReceiveTabRouter(),
    ];

    return AutoTabsScaffold(
      backgroundColor: Colors.black87,
      scaffoldKey: btcRootScaffoldKey,
      routes: routes,
      builder: (context, child, animated) {
        return SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Row(
            children: [
              Container(
                height: double.infinity,
                color: Colors.black,
                child: BtcMenu(),
              ),
              Expanded(
                child: Column(
                  children: [
                    Expanded(
                      child: Container(
                        clipBehavior: Clip.antiAlias,
                        decoration: const BoxDecoration(
                          color: Colors.black87,
                        ),
                        child: child,
                      ),
                    ),
                    Footer(backgroundColor: Theme.of(context).colorScheme.btcDark),
                  ],
                ),
              ),
              const BtcStatusContainer(),
            ],
          ),
        );
      },
    );
  }
}
