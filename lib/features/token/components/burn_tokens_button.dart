import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/base_component.dart';
import 'package:rbx_wallet/core/components/buttons.dart';
import 'package:rbx_wallet/core/dialogs.dart';
import 'package:rbx_wallet/core/theme/app_theme.dart';
import 'package:rbx_wallet/features/global_loader/global_loading_provider.dart';
import 'package:rbx_wallet/features/nft/services/nft_service.dart';
import 'package:rbx_wallet/features/token/services/token_service.dart';
import 'package:rbx_wallet/utils/toast.dart';
import 'package:rbx_wallet/utils/validation.dart';

class BurnTokensButton extends BaseComponent {
  final String scId;
  final String fromAddress;
  final double currentBalance;
  final bool elevated;
  final VoidCallback showRaErrorMessage;
  final bool isOwnedByRA;

  const BurnTokensButton({
    super.key,
    required this.scId,
    required this.fromAddress,
    required this.currentBalance,
    this.elevated = true,
    required this.showRaErrorMessage,
    required this.isOwnedByRA,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppButton(
      label: "Burn",
      variant: AppColorVariant.Danger,
      useDisabledColor: isOwnedByRA,
      type: elevated ? AppButtonType.Elevated : AppButtonType.Text,
      onPressed: () async {
        if (isOwnedByRA) {
          showRaErrorMessage();
          return;
        }

        final nft = await NftService().getNftData(scId);

        if (nft?.tokenStateDetails?.burnable != true) {
          Toast.error("This token is not burnable");
          return;
        }

        final amount = await PromptModal.show(
          title: "Amount to Burn",
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

        if (amountDouble > currentBalance) {
          Toast.error("Not enough balance to perform this transaction");
          return;
        }
        ref.read(globalLoadingProvider.notifier).start();
        final success = await TokenService().burn(
          scId: scId,
          fromAddress: fromAddress,
          amount: amountDouble,
        );
        ref.read(globalLoadingProvider.notifier).complete();

        if (success) {
          Toast.message("Token burn transaction broadcasted");
        }
      },
    );
  }
}
