import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/app_constants.dart';
import 'package:rbx_wallet/core/base_component.dart';
import 'package:rbx_wallet/core/components/buttons.dart';
import 'package:rbx_wallet/core/dialogs.dart';
import 'package:rbx_wallet/core/theme/app_theme.dart';
import 'package:rbx_wallet/features/global_loader/global_loading_provider.dart';
import 'package:rbx_wallet/features/token/services/token_service.dart';
import 'package:rbx_wallet/utils/toast.dart';
import 'package:rbx_wallet/utils/validation.dart';

class TransferTokensButton extends BaseComponent {
  final String scId;
  final String fromAddress;
  final double currentBalance;

  const TransferTokensButton({
    super.key,
    required this.scId,
    required this.fromAddress,
    required this.currentBalance,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppButton(
      label: "Transfer Tokens",
      variant: AppColorVariant.Primary,
      onPressed: () async {
        final amount = await PromptModal.show(
          title: "Amount to Transfer",
          validator: (val) => formValidatorNumber(val, "Amount"),
          labelText: "Amount",
          inputFormatters: [FilteringTextInputFormatter.allow(RegExp("[0-9.]"))],
        );
        if (amount == null || amount.isEmpty) {
          return;
        }

        final amountDouble = double.tryParse(amount);

        if (amountDouble == null) {
          Toast.error("Invalid Amount");
          return;
        }

        if (amountDouble + MIN_RBX_FOR_SC_ACTION > currentBalance) {
          Toast.error("Not enough balance to perform this transaction");
          return;
        }

        final toAddress = await PromptModal.show(
          title: "To Address",
          validator: (val) => formValidatorRbxAddress(val),
          labelText: "To Address",
        );
        if (toAddress == null || toAddress.isEmpty) {
          return;
        }
        ref.read(globalLoadingProvider.notifier).start();
        final success = await TokenService().transfer(
          scId: scId,
          fromAddress: fromAddress,
          toAddress: toAddress,
          amount: amountDouble,
        );
        ref.read(globalLoadingProvider.notifier).complete();

        if (success) {
          Toast.message("Token transfer transaction broadcasted");
        }
      },
    );
  }
}
