import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/base_component.dart';
import 'package:rbx_wallet/core/components/badges.dart';
import 'package:rbx_wallet/core/providers/session_provider.dart';
import 'package:rbx_wallet/core/theme/app_theme.dart';
import 'package:rbx_wallet/features/block/latest_block.dart';
import 'package:rbx_wallet/features/bridge/providers/status_provider.dart';
import 'package:rbx_wallet/features/bridge/providers/wallet_info_provider.dart';
import 'package:rbx_wallet/generated/assets.gen.dart';
import 'package:rbx_wallet/utils/formatting.dart';

class StatusContainer extends BaseComponent {
  const StatusContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final status = ref.watch(statusProvider);
    final walletInfo = ref.watch(walletInfoProvider);

    final cliVersion = ref.read(sessionProvider).cliVersion;

    return Container(
      decoration: BoxDecoration(
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Status",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    _StatusIndicator(status),
                  ],
                ),
                _DetailItem(
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
                    value: "${walletInfo.peerCount} / 6",
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
                      children: [
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
      decoration: BoxDecoration(
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
        padding: EdgeInsets.all(6.0),
        child: Builder(builder: (context) {
          final walletInfo = ref.watch(walletInfoProvider);
          int? remoteBlockHeight = ref.watch(sessionProvider).remoteBlockHeight;

          if (walletInfo == null) {
            return SizedBox();
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
                      SizedBox(
                        width: 12,
                        height: 12,
                        child: CircularProgressIndicator(
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.white),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
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
                      SizedBox(
                        width: 12,
                        height: 12,
                        child: CircularProgressIndicator(
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.white),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
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
                SizedBox(
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
        SizedBox(height: 4),
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

class _StatusIndicator extends StatelessWidget {
  final BridgeStatus status;

  const _StatusIndicator(this.status, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (status) {
      case BridgeStatus.Loading:
        return AppBadge(
          label: "Loading",
          variant: AppColorVariant.Primary,
        );
      case BridgeStatus.Online:
        return AppBadge(
          label: "Online",
          variant: AppColorVariant.Success,
        );
      case BridgeStatus.Offline:
        return AppBadge(
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
