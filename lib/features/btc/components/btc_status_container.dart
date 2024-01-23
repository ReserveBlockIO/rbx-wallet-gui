import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/base_component.dart';
import 'package:rbx_wallet/core/components/badges.dart';
import 'package:rbx_wallet/core/theme/app_theme.dart';
import 'package:rbx_wallet/features/bridge/providers/status_provider.dart';
import 'package:rbx_wallet/features/bridge/providers/wallet_info_provider.dart';
import 'package:rbx_wallet/features/btc/components/btc_rbx_switch.dart';

import '../../../core/providers/session_provider.dart';

class BtcStatusContainer extends BaseComponent {
  const BtcStatusContainer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final status = ref.watch(statusProvider);
    final cliVersion = ref.read(sessionProvider).cliVersion;
    final walletInfo = ref.watch(walletInfoProvider);

    return Container(
      decoration: BoxDecoration(
        color: Colors.black,
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
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: BtcRbxSwitch(),
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
            _DetailItem(
              label: "Blockchain Version",
              value: "1.0.0",
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
                label: "Wallet Started",
                value: ref.watch(sessionProvider).startTimeFormatted,
                icon: Icons.timer,
              ),
          ],
        ),
      ),
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
