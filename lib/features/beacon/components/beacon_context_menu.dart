import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/base_component.dart';
import '../../../core/dialogs.dart';
import '../../../utils/toast.dart';
import '../models/beacon.dart';
import '../providers/beacon_list_provider.dart';
import '../services/beacon_service.dart';

class BeaconContextMenu extends BaseComponent {
  final Beacon beacon;
  const BeaconContextMenu(this.beacon, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PopupMenuButton(
      padding: EdgeInsets.zero,
      icon: const Icon(Icons.more_vert),
      itemBuilder: (context) {
        return [
          PopupMenuItem(
            child: const Text("Remove"),
            onTap: () async {
              final confirmed = await ConfirmDialog.show(
                  title: "Remove Beacon",
                  body: "Are you sure you want to remove this beacon?",
                  confirmText: "Remove",
                  cancelText: "Cancel",
                  destructive: true);

              if (confirmed == true) {
                final success = await BeaconService().delete(beacon.id);
                if (success) {
                  ref.read(beaconListProvider.notifier).refresh();
                } else {
                  Toast.error();
                }
              }
            },
          ),
        ];
      },
    );
  }
}
