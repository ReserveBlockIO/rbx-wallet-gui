import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/services/explorer_service.dart';
import '../../../bridge/services/bridge_service.dart';

import '../../../../core/base_component.dart';
import '../../../../core/components/badges.dart';
import '../../../../core/providers/session_provider.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../utils/formatting.dart';
import '../../../block/latest_block.dart';
import '../../../bridge/providers/status_provider.dart';
import '../../../bridge/providers/wallet_info_provider.dart';
import '../../../btc/providers/electrum_connected_provider.dart';

class StatusContainer extends BaseComponent {
  const StatusContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final status = ref.watch(statusProvider);
    final walletInfo = ref.watch(walletInfoProvider);

    final cliVersion = ref.read(sessionProvider).cliVersion;
    final blockchainVersion = walletInfo?.blockchainVersion;

    return Container(
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.9),
        border: Border(
          left: BorderSide(
            width: 1,
            color: Colors.black54,
          ),
        ),
      ),
      width: 250,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: ListView(
                // mainAxisSize: MainAxisSize.min,
                shrinkWrap: true,
                children: [
                  if (ref.watch(sessionProvider.select((v) => v.updateAvailable)))
                    Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: SizedBox(
                            width: double.infinity,
                            child: ElevatedButton.icon(
                              icon: const Icon(Icons.download),
                              style: ElevatedButton.styleFrom(backgroundColor: Theme.of(context).colorScheme.danger),
                              label: const Text("Update Available"),
                              onPressed: () {
                                ref.read(sessionProvider.notifier).updateGui();
                              },
                            )),
                      ),
                    ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  // const Text(
                  //   "Status",
                  //   style: TextStyle(fontWeight: FontWeight.bold),
                  // ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      _StatusIndicator(status),
                      Padding(
                        padding: const EdgeInsets.only(left: 4.0),
                        child: _BtcStatusIndicator(),
                      ),
                    ],
                  ),
                  //   ],
                  // ),
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
                              color: Theme.of(context).colorScheme.secondary,
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
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  LatestBlock(),
                  SizedBox(
                    height: 8,
                  ),
                  _BlockStatus(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _BlockStatus extends BaseComponent {
  const _BlockStatus({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFF050505),
        boxShadow: glowingBox,
      ),
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Builder(builder: (context) {
          final walletInfo = ref.watch(walletInfoProvider);

          if (!ref.watch(sessionProvider.select((v) => v.cliStarted))) {
            return const SizedBox(
              width: 16,
              height: 16,
              child: Text(
                "CLI Inactive",
                style: TextStyle(fontSize: 11),
              ),
            );
          }

          if (walletInfo == null) {
            return const SizedBox(
              width: 16,
              height: 16,
              child: Text(
                "Loading...",
                style: TextStyle(fontSize: 11),
              ),
            );
          }

          if (walletInfo.isResyncing) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Resyncing",
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      const SizedBox(
                        width: 12,
                        height: 12,
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  _ProgressIndicator(
                    color: Theme.of(context).colorScheme.danger,
                    fraction: 1,
                    value: walletInfo.blockHeight,
                    remoteBlockHeight: 100,
                    unknownHeight: true,
                  ),
                ],
              ),
            );
          }

          if (!walletInfo.isChainSynced) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Syncing",
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      const SizedBox(
                        width: 12,
                        height: 12,
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  _ProgressIndicator(
                    color: Theme.of(context).colorScheme.warning,
                    fraction: 1,
                    value: walletInfo.blockHeight,
                    remoteBlockHeight: 100,
                    unknownHeight: true,
                  ),
                ],
              ),
            );
          }

          // if (!walletInfo.isSyncing) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Wallet Synced",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const SizedBox(
                  height: 4,
                ),
                _ProgressIndicator(
                  color: Theme.of(context).colorScheme.success,
                  fraction: 1,
                  value: walletInfo.blockHeight,
                  remoteBlockHeight: walletInfo.blockHeight,
                )
              ],
            ),
          );
          // }

          // if (remoteBlockHeight == null || remoteBlockHeight < 1) {
          //   return SizedBox();
          // }

          // final value = walletInfo.blockHeight;

          // if (value > remoteBlockHeight) {
          //   remoteBlockHeight = value;
          // }

          // final fraction = value / remoteBlockHeight;

          // return Column(
          //   crossAxisAlignment: CrossAxisAlignment.start,
          //   mainAxisSize: MainAxisSize.min,
          //   children: [
          //     Text(
          //       "Sync Progress",
          //       style: Theme.of(context).textTheme.caption,
          //     ),
          //     SizedBox(height: 8),
          //     _ProgressIndicator(
          //       color: Theme.of(context).colorScheme.warning,
          //       fraction: fraction,
          //       value: value,
          //       remoteBlockHeight: remoteBlockHeight,
          //     ),
          //   ],
          // );
        }),
      ),
    );
  }
}

class _ProgressIndicator extends StatelessWidget {
  const _ProgressIndicator({
    Key? key,
    required this.fraction,
    required this.value,
    required this.remoteBlockHeight,
    required this.color,
    this.unknownHeight = false,
  }) : super(key: key);

  final double fraction;
  final int value;
  final int remoteBlockHeight;
  final Color color;
  final bool unknownHeight;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        LinearProgressIndicator(
          value: fraction,
          valueColor: AlwaysStoppedAnimation<Color>(color),
        ),
        const SizedBox(height: 4),
        if (!unknownHeight)
          Align(
            alignment: Alignment.bottomRight,
            child: Text(
              "${formatIntWithCommas(value)}/${formatIntWithCommas(remoteBlockHeight)}",
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
      ],
    );
  }
}

class _StatusIndicator extends BaseComponent {
  final BridgeStatus status;

  const _StatusIndicator(this.status, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (!ref.watch(sessionProvider.select((v) => v.cliStarted))) {
      return const AppBadge(
        label: "CLI Inactive",
        variant: AppColorVariant.Danger,
      );
    }

    switch (status) {
      case BridgeStatus.Loading:
        return const AppBadge(
          label: "Loading",
          variant: AppColorVariant.Primary,
        );
      case BridgeStatus.Online:
        return const AppBadge(
          label: "VFX Online",
          variant: AppColorVariant.Success,
        );
      case BridgeStatus.Offline:
        return const AppBadge(
          label: "VFX Offline",
          variant: AppColorVariant.Danger,
        );
    }
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

class _BtcStatusIndicator extends BaseComponent {
  const _BtcStatusIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sessionState = ref.watch(sessionProvider);

    if (!sessionState.cliStarted) {
      return SizedBox();
    }

    final electrumConnected = ref.watch(electrumConnectedProvider);

    final btcAccountSyncInfo = sessionState.btcAccountSyncInfo;

    switch (electrumConnected) {
      case null:
        return const AppBadge(
          label: "BTC Loading",
          variant: AppColorVariant.Light,
        );
      case true:
        return Tooltip(
          message: btcAccountSyncInfo != null
              ? "Last Sync: ${btcAccountSyncInfo.lastSyncFormatted}\nNext Sync: ${btcAccountSyncInfo.nextSyncFormatted}"
              : "",
          child: const AppBadge(
            label: "BTC Online",
            variant: AppColorVariant.Btc,
          ),
        );
      case false:
        return const AppBadge(
          label: "BTC Offline",
          variant: AppColorVariant.Danger,
        );
    }

    return SizedBox();
  }
}
