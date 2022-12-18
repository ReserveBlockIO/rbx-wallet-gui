import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/base_component.dart';
import 'package:rbx_wallet/core/dialogs.dart';
import 'package:rbx_wallet/core/theme/app_theme.dart';
import 'package:rbx_wallet/features/beacon/models/beacon.dart';
import 'package:rbx_wallet/features/beacon/providers/beacon_list_provider.dart';
import 'package:rbx_wallet/features/beacon/services/beacon_service.dart';
import 'package:rbx_wallet/utils/toast.dart';

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
