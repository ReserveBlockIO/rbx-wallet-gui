import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/components/buttons.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../../../core/base_component.dart';
import '../../../../core/components/badges.dart';
import '../../../../core/providers/session_provider.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../generated/assets.gen.dart';
import '../../../../utils/formatting.dart';
import '../../../block/latest_block.dart';
import '../../../bridge/providers/status_provider.dart';
import '../../../bridge/providers/wallet_info_provider.dart';

class StatusContainer extends BaseComponent {
  const StatusContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final status = ref.watch(statusProvider);
    final walletInfo = ref.watch(walletInfoProvider);

    final cliVersion = ref.read(sessionProvider).cliVersion;

    return Container(
      decoration: const BoxDecoration(
        color: Colors.black38,
        border: Border(
          left: BorderSide(
            width: 1,
            color: Colors.black54,
          ),
        ),
      ),
      width: 250,
      child: Stack(
        children: [
          Image.asset(
            Assets.images.grid.path,
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Opacity(
              opacity: 0.5,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 308.0),
                child: Image.asset(
                  Assets.images.decorBottomRight.path,
                  width: 200,
                  height: 200,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                if (ref.watch(sessionProvider).updateAvailable)
                  Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: SizedBox(
                          width: double.infinity,
                          child: ElevatedButton.icon(
                            icon: const Icon(Icons.download),
                            style: ElevatedButton.styleFrom(primary: Theme.of(context).colorScheme.danger),
                            label: const Text("Update Available"),
                            onPressed: () {
                              final url = ref.read(sessionProvider).remoteInfo!.gui.url;
                              launchUrlString(url);
                            },
                          )),
                    ),
                  ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Status",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    _StatusIndicator(status),
                  ],
                ),
                const _DetailItem(
                  label: "Blockchain Version",
                  value: "1.0",
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
                    value: "${walletInfo.peerCount} / 8",
                    icon: Icons.people_alt,
                  ),
                if (walletInfo != null)
                  _DetailItem(
                    label: "Wallet Started",
                    value: ref.watch(sessionProvider).startTimeFormatted,
                    icon: Icons.timer,
                  ),
                Expanded(
                  child: Align(
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
                  ),
                )
              ],
            ),
          ),
        ],
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
      decoration: const BoxDecoration(
        color: Color(0xFF050505),
        boxShadow: [
          BoxShadow(
            color: Colors.white10,
            spreadRadius: 3,
            blurRadius: 3,
          ),
        ],
      ),
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Builder(builder: (context) {
          final walletInfo = ref.watch(walletInfoProvider);

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
                        style: Theme.of(context).textTheme.caption,
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
                        style: Theme.of(context).textTheme.caption,
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
                  style: Theme.of(context).textTheme.caption,
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
              style: Theme.of(context).textTheme.caption,
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
    if (!ref.watch(sessionProvider).cliStarted) {
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
          label: "Online",
          variant: AppColorVariant.Success,
        );
      case BridgeStatus.Offline:
        return const AppBadge(
          label: "Offline",
          variant: AppColorVariant.Danger,
        );
    }
  }
}

class _DetailItem extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;

  const _DetailItem({
    Key? key,
    required this.label,
    required this.value,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      horizontalTitleGap: 8,
      dense: true,
      visualDensity: VisualDensity.compact,
      title: Text(value),
      subtitle: Text(label),
      leading: Icon(
        icon,
        size: 30,
      ),
    );
  }
}
