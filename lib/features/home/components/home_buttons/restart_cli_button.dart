import 'package:flutter/material.dart';

import '../../../../core/base_component.dart';
import '../../../../core/components/buttons.dart';
import '../../../../core/dialogs.dart';
import '../../../../core/providers/session_provider.dart';

class RestartCliButton extends BaseComponent {
  const RestartCliButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final cliStarted = ref.watch(sessionProvider.select((v) => v.cliStarted));

    return AppButton(
      label: "Restart CLI",
      icon: Icons.restart_alt,
      onPressed: cliStarted
          ? () async {
              final confirmed = await ConfirmDialog.show(
                title: "Restart",
                body: "Are you sure you want to restart the CLI?",
                confirmText: "Restart",
                cancelText: "Cancel",
                destructive: true,
              );

              if (confirmed == true) {
                ref.read(sessionProvider.notifier).restartCli();
              }
            }
          : null,
    );
  }
}
