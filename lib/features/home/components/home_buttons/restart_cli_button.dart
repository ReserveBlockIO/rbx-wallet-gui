import 'package:flutter/material.dart';
import 'package:rbx_wallet/core/theme/app_theme.dart';

import '../../../../core/base_component.dart';
import '../../../../core/components/buttons.dart';
import '../../../../core/dialogs.dart';
import '../../../../core/providers/session_provider.dart';

class RestartCliButton extends BaseComponent {
  final bool forBtc;
  const RestartCliButton({
    Key? key,
    this.forBtc = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final cliStarted = ref.watch(sessionProvider).cliStarted;

    return AppButton(
      label: "Restart CLI",
      icon: Icons.restart_alt,
      variant: forBtc ? AppColorVariant.Btc : AppColorVariant.Primary,
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
