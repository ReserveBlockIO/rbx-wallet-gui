import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../app.dart';
import '../../core/app_router.gr.dart';
import '../../core/base_component.dart';
import '../../core/dialogs.dart';
import '../../core/env.dart';
import '../../core/theme/app_theme.dart';
import '../bridge/providers/wallet_info_provider.dart';
import '../encrypt/components/unlock_wallet.dart';
import '../encrypt/providers/startup_password_required_provider.dart';
import '../home/components/footer.dart';
import 'navigation/components/main_menu.dart';
import 'status/components/status_container.dart';

class RootContainer extends BaseComponent {
  const RootContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                    child: const Padding(
                      padding: EdgeInsets.all(4.0),
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
                if (ref.watch(walletInfoProvider) != null &&
                    (ref.watch(walletInfoProvider)!.duplicateValidatorAddress || ref.watch(walletInfoProvider)!.duplicateValidatorIp))
                  Container(
                    width: double.infinity,
                    color: Theme.of(context).colorScheme.danger,
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Center(
                        child: Builder(builder: (context) {
                          String text = "";
                          if (ref.watch(walletInfoProvider)!.duplicateValidatorAddress && ref.watch(walletInfoProvider)!.duplicateValidatorIp) {
                            text = "Duplicate Address and IP is being used to validate.";
                          } else if (ref.watch(walletInfoProvider)!.duplicateValidatorAddress) {
                            text = "Duplicate Address is being used to validate.";
                          } else {
                            text = "Duplicate IP Address is being used to validate.";
                          }

                          return Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                text,
                                style: const TextStyle(
                                  fontSize: 12,
                                  letterSpacing: 1,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              InkWell(
                                onTap: () {
                                  InfoDialog.show(
                                      title: text,
                                      body:
                                          "To fix this issue, please complete the following tasks:\n\n- Stop Validating on all machines\n- All machines with current addresses must be restarted\n- Restart validating on one machine only");
                                },
                                child: const Text(
                                  "Fix Now",
                                  style: TextStyle(
                                    fontSize: 12,
                                    letterSpacing: 1,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ),
                            ],
                          );
                        }),
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
                          Expanded(child: Container(clipBehavior: Clip.antiAlias, decoration: const BoxDecoration(), child: child)),
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
                  : const SizedBox.shrink();
            })
          ],
        );
      },
    );
  }
}
