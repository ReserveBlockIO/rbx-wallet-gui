import 'package:flutter/material.dart';
import 'package:rbx_wallet/features/bridge/services/bridge_service.dart';
import 'package:rbx_wallet/features/remote_info/services/remote_info_service.dart';
import 'package:rbx_wallet/utils/toast.dart';

import '../../../../core/base_component.dart';
import '../../../../core/components/buttons.dart';
import '../../../../core/providers/session_provider.dart';

class ImportSnapshotButton extends BaseComponent {
  const ImportSnapshotButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final cliStarted = ref.watch(sessionProvider).cliStarted;

    return AppButton(
      label: "Import Snapshot",
      icon: Icons.settings_backup_restore,
      onPressed: cliStarted
          ? () async {
              final data = await BridgeService().walletInfo();
              final int? blockHeight = int.tryParse(data['BlockHeight']);

              if (blockHeight == null) {
                Toast.error("Problem fetching local block height. Please try again.");
                return;
              }

              final remoteInfo = await RemoteInfoService.fetchInfo();
              if (remoteInfo == null) {
                Toast.error("Problem fetching snapshot block height. Please try again.");
                return;
              }
              final snapshotHeight = remoteInfo.snapshot.height;

              if (blockHeight < snapshotHeight) {
                ref.read(sessionProvider.notifier).promptForSnapshotImport();
              } else {
                Toast.message("Your local blockheight is further along than the snapshot.");
              }
            }
          : null,
    );
  }
}
