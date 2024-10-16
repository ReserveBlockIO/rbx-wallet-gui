import 'package:flutter/material.dart';

import '../../../../core/base_component.dart';
import '../../../../core/components/buttons.dart';
import '../../../../core/providers/session_provider.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../bridge/models/log_entry.dart';
import '../../../bridge/providers/log_provider.dart';
import '../../../validator/providers/validator_list_provider.dart';

class PrintValidatorsButton extends BaseComponent {
  const PrintValidatorsButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final cliStarted = ref.watch(sessionProvider.select((v) => v.cliStarted));

    return AppButton(
      label: "Print Validators",
      icon: Icons.wifi,
      onPressed: !cliStarted
          ? null
          : () async {
              final _log = ref.read(logProvider.notifier);

              final validators = ref.read(validatorListProvider);

              if (validators.isEmpty) {
                _log.append(LogEntry(
                  message: "No validators",
                  variant: AppColorVariant.Danger,
                ));
                return;
              }
              _log.append(LogEntry(
                message: "Validators:",
                variant: AppColorVariant.Secondary,
              ));

              for (final validator in validators) {
                _log.append(
                  LogEntry(
                    message: "${validator.address} => ${validator.isValidating ? 'Validating' : 'Not Validating'}",
                    variant: validator.isValidating ? AppColorVariant.Success : AppColorVariant.Info,
                    textToCopy: validator.address,
                  ),
                );
              }
            },
    );
  }
}
