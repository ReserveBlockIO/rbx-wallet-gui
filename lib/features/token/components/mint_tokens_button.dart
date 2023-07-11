import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/base_component.dart';
import 'package:rbx_wallet/core/components/buttons.dart';
import 'package:rbx_wallet/core/dialogs.dart';
import 'package:rbx_wallet/core/theme/app_theme.dart';
import 'package:rbx_wallet/features/global_loader/global_loading_provider.dart';
import 'package:rbx_wallet/features/nft/models/nft.dart';
import 'package:rbx_wallet/features/token/models/token_account.dart';
import 'package:rbx_wallet/features/token/models/token_sc_feature.dart';
import 'package:rbx_wallet/features/token/services/token_service.dart';
import 'package:rbx_wallet/utils/toast.dart';
import 'package:rbx_wallet/utils/validation.dart';

class MintTokensButton extends BaseComponent {
  final Nft nft;
  final bool elevated;

  const MintTokensButton({
    super.key,
    required this.nft,
    this.elevated = true,
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

    return AppButton(
      label: "Mint Tokens",
      variant: AppColorVariant.Success,
      type: elevated ? AppButtonType.Elevated : AppButtonType.Text,
      onPressed: () async {
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
