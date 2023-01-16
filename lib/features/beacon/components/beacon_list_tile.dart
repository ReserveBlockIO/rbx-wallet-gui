import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/base_component.dart';
import '../../../core/components/badges.dart';
import '../../../core/theme/app_theme.dart';
import '../models/beacon.dart';
import 'beacon_context_menu.dart';

class BeaconListTile extends BaseComponent {
  final Beacon beacon;
  const BeaconListTile(this.beacon, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      color: Theme.of(context).colorScheme.primary,
      child: ListTile(
        leading: const Icon(Icons.wifi),
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
                : const AppBadge(
                    label: "Remote",
                    variant: AppColorVariant.Warning,
                  ),
            BeaconContextMenu(beacon)
          ],
        ),
      ),
    );
  }
}
