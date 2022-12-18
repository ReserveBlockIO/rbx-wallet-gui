import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/base_component.dart';
import 'package:rbx_wallet/core/components/badges.dart';
import 'package:rbx_wallet/core/theme/app_theme.dart';
import 'package:rbx_wallet/features/beacon/components/beacon_context_menu.dart';
import 'package:rbx_wallet/features/beacon/models/beacon.dart';

class BeaconListTile extends BaseComponent {
  final Beacon beacon;
  const BeaconListTile(this.beacon, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      color: Theme.of(context).colorScheme.primary,
      child: ListTile(
        leading: Icon(Icons.wifi),
        title: Text(beacon.name),
        subtitle: Text(beacon.ipAddressLabel),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            beacon.selfBeacon
                ? AppBadge(
                    label: beacon.selfBeaconActive ? "Active" : "Inactive",
                    variant: beacon.selfBeaconActive ? AppColorVariant.Success : AppColorVariant.Danger,
                  )
                : AppBadge(
                    label: "Remote",
                    variant: AppColorVariant.Primary,
                  ),
            BeaconContextMenu(beacon)
          ],
        ),
      ),
    );
  }
}
