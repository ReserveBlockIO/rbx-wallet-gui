import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/base_component.dart';
import 'package:rbx_wallet/core/components/buttons.dart';
import 'package:rbx_wallet/core/dialogs.dart';
import 'package:rbx_wallet/core/theme/app_theme.dart';
import 'package:rbx_wallet/features/global_loader/global_loading_provider.dart';
import 'package:rbx_wallet/features/nft/models/nft.dart';
import 'package:rbx_wallet/features/nft/providers/transferred_provider.dart';
import 'package:rbx_wallet/features/token/models/token_account.dart';
import 'package:rbx_wallet/features/token/models/token_sc_feature.dart';
import 'package:rbx_wallet/features/token/services/token_service.dart';
import 'package:rbx_wallet/utils/toast.dart';
import 'package:rbx_wallet/utils/validation.dart';

class ChangeTokenOwnershipButton extends BaseComponent {
  final Nft nft;
  final String fromAddress;

  const ChangeTokenOwnershipButton({
    super.key,
    required this.nft,
    required this.fromAddress,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tokenAccount = TokenAccount.fromNft(nft, ref);
    final token = TokenScFeature.fromNft(nft);

    if (tokenAccount == null || token == null) {
      return SizedBox();
    }

    return AppButton(
      label: "Change Ownership",
      variant: AppColorVariant.Danger,
      onPressed: () async {
        final toAddress = await PromptModal.show(
          title: "Transfer To Address",
          validator: (val) => formValidatorRbxAddress(val),
          labelText: "To Address",
        );
        if (toAddress == null || toAddress.isEmpty) {
          return;
        }
        ref.read(globalLoadingProvider.notifier).start();

        final success = await TokenService().changeOwnership(
          scId: nft.id,
          fromAddress: fromAddress,
          toAddress: toAddress,
        );
        ref.read(globalLoadingProvider.notifier).complete();

        if (success) {
          Toast.message("Token ownership change transaction broadcasted");
          ref.read(transferredProvider.notifier).addId(nft.id);
          Navigator.of(context).pop();
        }
      },
    );
  }
}
