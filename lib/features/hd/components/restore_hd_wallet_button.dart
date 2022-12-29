import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/base_component.dart';
import 'package:rbx_wallet/core/components/buttons.dart';
import 'package:rbx_wallet/core/dialogs.dart';
import 'package:rbx_wallet/features/bridge/services/bridge_service.dart';
import 'package:rbx_wallet/features/wallet/providers/wallet_list_provider.dart';
import 'package:rbx_wallet/utils/toast.dart';
import 'package:rbx_wallet/utils/validation.dart';

class RestoreHdWalletButton extends BaseComponent {
  const RestoreHdWalletButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppButton(
      label: "Restore HD Wallet",
      onPressed: () async {
        final val = await PromptModal.show(
          title: "Input Recover Phrase",
          validator: (value) => formValidatorNotEmpty(value, "Recovery Phrase"),
          labelText: "Recovery Phrase",
        );

        if (val != null) {
          final success = await BridgeService().restoreHd(val);
          if (success == true) {
            Toast.message("HD Wallet restored. Keys will now be generated deterministically based on phrase.");
          } else {
            Toast.error();
          }
        }
      },
    );
  }
}
