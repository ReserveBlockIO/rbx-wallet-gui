import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/base_component.dart';
import '../../../core/components/buttons.dart';
import '../../../core/dialogs.dart';
import '../../../core/theme/app_theme.dart';
import '../../global_loader/global_loading_provider.dart';
import '../../nft/models/nft.dart';
import '../models/token_account.dart';
import '../models/token_sc_feature.dart';
import '../services/token_service.dart';
import '../../../utils/toast.dart';
import '../../../utils/validation.dart';

class MintTokensButton extends BaseComponent {
  final Nft nft;
  final bool elevated;
  final VoidCallback showRaErrorMessage;

  const MintTokensButton({
    super.key,
    required this.nft,
    this.elevated = true,
    required this.showRaErrorMessage,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tokenAccount = TokenAccount.fromNft(nft, ref);
    final token = TokenScFeature.fromNft(nft);

    if (tokenAccount == null || token == null) {
      return SizedBox();
    }

    if (!token.mintable) {
      return SizedBox();
    }
    final isOwnedByRA = nft.currentOwner.startsWith("xRBX");

    return AppButton(
      label: "Mint Tokens",
      variant: AppColorVariant.Success,
      useDisabledColor: isOwnedByRA,
      type: elevated ? AppButtonType.Elevated : AppButtonType.Text,
      onPressed: isOwnedByRA
          ? () {
              showRaErrorMessage();
            }
          : () async {
              final amount = await PromptModal.show(
                title: "Amount to Mint",
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
              ref.read(globalLoadingProvider.notifier).start();
              final success = await TokenService().mint(scId: nft.id, fromAddress: nft.currentOwner, amount: amountDouble);
              ref.read(globalLoadingProvider.notifier).complete();

              if (success) {
                Toast.message("Token mint transaction broadcasted");
              }
            },
    );
  }
}
