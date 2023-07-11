import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/base_component.dart';
import 'package:rbx_wallet/core/components/buttons.dart';
import 'package:rbx_wallet/core/dialogs.dart';
import 'package:rbx_wallet/core/providers/session_provider.dart';
import 'package:rbx_wallet/core/theme/app_theme.dart';
import 'package:rbx_wallet/features/nft/services/nft_service.dart';
import 'package:rbx_wallet/utils/toast.dart';
import 'package:rbx_wallet/utils/validation.dart';

class ImportSmartContractButton extends BaseComponent {
  final bool elevated;
  const ImportSmartContractButton({
    super.key,
    this.elevated = true,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppButton(
      label: "Import Smart Contract",
      type: elevated ? AppButtonType.Elevated : AppButtonType.Text,
      onPressed: () async {
        final scId = await PromptModal.show(
          title: "Smart Contract Identifier",
          body: "Paste in the smart contract's unique identifier.",
          validator: (val) => formValidatorNotEmpty(val, "Identifier"),
          labelText: "Identifier",
        );

        if (scId != null && scId.isNotEmpty) {
          final success = await NftService().importFromNetwork(scId);
          if (success) {
            ref.read(sessionProvider.notifier).smartContractLoop(false);
            Toast.message("Smart Contract imported from network");
          }
        }
      },
      variant: AppColorVariant.Light,
    );
  }
}
