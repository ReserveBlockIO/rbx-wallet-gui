import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/base_component.dart';
import '../../../core/components/buttons.dart';
import '../../../core/dialogs.dart';
import '../../../core/providers/session_provider.dart';
import '../../../utils/toast.dart';
import '../../../utils/validation.dart';
import '../../bridge/services/bridge_service.dart';

class RestoreHdWalletButton extends BaseComponent {
  const RestoreHdWalletButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppButton(
      label: "Restore HD Account",
      icon: Icons.hd_outlined,
      onPressed: !ref.watch(sessionProvider.select((v) => v.cliStarted))
          ? null
          : () async {
              final val = await PromptModal.show(
                title: "Input Recover Phrase",
                validator: (value) => formValidatorNotEmpty(value, "Recovery Phrase"),
                labelText: "Recovery Phrase",
              );

              if (val != null) {
                final success = await BridgeService().restoreHd(val);
                if (success == true) {
                  Toast.message("HD Account restored. Keys will now be generated deterministically based on phrase.");
                } else {
                  Toast.error();
                }
              }
            },
    );
  }
}
