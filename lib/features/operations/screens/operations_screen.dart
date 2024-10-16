import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../core/app_constants.dart';
import '../../../core/base_screen.dart';
import '../../../core/env.dart';
import '../../../core/providers/session_provider.dart';
import '../../../core/services/explorer_service.dart';
import '../../../core/theme/components.dart';
import '../../bridge/providers/wallet_info_provider.dart';
import '../../bridge/services/bridge_service.dart';
import '../../wallet/providers/wallet_list_provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../../core/theme/colors.dart';
import '../../bridge/providers/log_provider.dart';
import '../../home/components/home_buttons.dart';
import '../../home/components/log_item.dart';

class OperationsScreen extends BaseScreen {
  const OperationsScreen({super.key});

  @override
  AppBar? appBar(BuildContext context, WidgetRef ref) {
    return AppBar(
      title: Text("Operations"),
      backgroundColor: Colors.transparent,
      shadowColor: Colors.transparent,
      actions: [
        // WalletSelector(),
      ],
    );
  }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    final logEntries = ref.watch(logProvider);

    return Column(
      children: [
        HomeButtons(
          includeRestoreHd: ref.watch(walletListProvider.select((v) => v.isEmpty)),
        ),
        SizedBox(
          height: 16,
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 32.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Activity Log"),
                      ),
                      Expanded(
                        child: AppCard(
                          padding: 0,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: ListView.builder(
                              controller: ref.read(logProvider.notifier).scrollController,
                              itemCount: logEntries.length,
                              itemBuilder: (context, index) {
                                final entry = logEntries[index];
                                return Padding(
                                  padding: EdgeInsets.only(top: index == 0 ? 8 : 0, bottom: index + 1 == logEntries.length ? 28 : 0),
                                  child: LogItem(entry),
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 16,
                ),
                SizedBox(
                  width: 250,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Status"),
                      ),
                      NewStatusContainer(),
                      SizedBox(
                        height: 16,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            iconSize: 16,
                            onPressed: () {
                              launchUrl(Uri.parse("https://discord.com/invite/PnS2HRETDh"));
                            },
                            icon: FaIcon(
                              FontAwesomeIcons.discord,
                              color: Colors.white.withOpacity(0.8),
                            ),
                          ),
                          IconButton(
                            iconSize: 16,
                            onPressed: () {
                              launchUrl(Uri.parse("https://github.com/ReserveBlockIO"));
                            },
                            icon: FaIcon(
                              FontAwesomeIcons.github,
                              color: Colors.white.withOpacity(0.8),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              launchUrlString("https://wiki.reserveblock.io/docs/introduction/what-is-rbx/");
                            },
                            child: Text(
                              "Wiki",
                              style: TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 12, decoration: TextDecoration.underline),
                            ),
                          ),

                          // RootContainerRotatingCube(),
                        ],
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Text(
                        "VFX Wallet${Env.isTestNet ? ' [TESTNET]' : ''}\nVersion $APP_VERSION ($APP_VERSION_NICKNAME)",
                        style: TextStyle(
                          fontSize: 11,
                          color: AppColors.getBlue(ColorShade.s50),
                          height: 1.5,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class NewStatusContainer extends ConsumerWidget {
  const NewStatusContainer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final walletInfo = ref.watch(walletInfoProvider);

    final cliVersion = ref.watch(sessionProvider.select((v) => v.cliVersion));
    final blockchainVersion = walletInfo?.blockchainVersion;

    return AppCard(
      padding: 8,
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        if (blockchainVersion != null)
          _DetailItem(
            label: "Blockchain Version",
            value: blockchainVersion,
            icon: Icons.sentiment_very_satisfied_outlined,
          ),
        if (cliVersion != null)
          _DetailItem(
            label: "CLI Version",
            value: cliVersion,
            icon: Icons.code,
          ),
        if (walletInfo != null)
          _DetailItem(
            label: "Block Height",
            value: "${walletInfo.blockHeight}",
            icon: Icons.summarize,
          ),
        if (walletInfo != null)
          _DetailItem(
            label: "Peers (In / Out)",
            value: "${walletInfo.peerCount} / 14",
            icon: Icons.people_alt,
          ),
        if (walletInfo != null)
          _DetailItem(
            label: "Wallet Started",
            value: ref.watch(sessionProvider.select((v) => v.startTimeFormatted)),
            icon: Icons.timer,
          ),
        if (walletInfo?.networkMetrics != null)
          _DetailItem(
            label: "Network Metrics",
            value: "",
            content: Align(
              alignment: Alignment.centerLeft,
              child: InkWell(
                child: Text(
                  "View Metrics",
                  style: TextStyle(
                    // color: Theme.of(context).colorScheme.secondary,
                    decoration: TextDecoration.underline,
                    fontSize: 13,
                  ),
                ),
                onTap: () async {
                  final m = await BridgeService().networkMetrics();

                  final validatorCount = await ExplorerService().validatorCount();
                  showDialog(
                      context: context,
                      builder: (context) {
                        final metrics = m ?? walletInfo!.networkMetrics!;

                        const style = TextStyle(
                          fontSize: 14,
                          fontFamily: 'RobotoMono',
                          height: 1.5,
                        );

                        return AlertDialog(
                          title: const Text("Network Metrics"),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Block Diff Avg: ${metrics.blockDiffAvg}", style: style),
                              Text("Block Last Received: ${metrics.blockLastReceived.toLocal()}", style: style),
                              Text("Block Last Delay: ${metrics.blockLastDelay}", style: style),
                              Text("Time Since Last Block: ${metrics.timeSinceLastBlockSeconds}s", style: style),
                              Text("Blocks Averaged: ${metrics.blocksAveraged}", style: style),
                              if (validatorCount != null) Text("Active Validators: $validatorCount", style: style),
                            ],
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text(
                                "Close",
                                style: TextStyle(
                                  color: Colors.white70,
                                ),
                              ),
                            )
                          ],
                        );
                      });
                },
              ),
            ),
            icon: Icons.analytics,
          ),
      ]),
    );
  }
}

class _DetailItem extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;
  final Widget? content;

  const _DetailItem({
    Key? key,
    required this.label,
    required this.value,
    required this.icon,
    this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        children: [
          Icon(icon, size: 20),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              content ?? Text(value, style: const TextStyle(fontSize: 13)),
              const SizedBox(height: 1),
              Text(
                label,
                style: const TextStyle(fontSize: 10, color: Colors.white60),
              ),
            ],
          )
        ],
      ),
    );
  }
}
