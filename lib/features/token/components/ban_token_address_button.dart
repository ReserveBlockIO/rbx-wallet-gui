import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/base_component.dart';
import 'package:rbx_wallet/core/components/buttons.dart';
import 'package:rbx_wallet/core/dialogs.dart';
import 'package:rbx_wallet/core/theme/app_theme.dart';
import 'package:rbx_wallet/features/global_loader/global_loading_provider.dart';
import 'package:rbx_wallet/features/nft/models/nft.dart';
import 'package:rbx_wallet/features/token/services/token_service.dart';
import 'package:rbx_wallet/utils/toast.dart';
import 'package:rbx_wallet/utils/validation.dart';

class BanTokenAddressButton extends BaseComponent {
  final Nft nft;
  final String fromAddress;
  final VoidCallback showRaErrorMessage;

  const BanTokenAddressButton({
    super.key,
    required this.nft,
    required this.fromAddress,
    required this.showRaErrorMessage,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isOwnedByRA = nft.currentOwner.startsWith("xRBX");

    return AppButton(
      label: "Ban Address",
      variant: AppColorVariant.Danger,
      type: AppButtonType.Text,
      useDisabledColor: isOwnedByRA,
      onPressed: () async {
        if (isOwnedByRA) {
          showRaErrorMessage();
          return;
        }
        final banAddress = await PromptModal.show(
          title: "Address To Ban",
          validator: (val) => formValidatorRbxAddress(val),
          labelText: "Address",
        );
        if (banAddress == null || banAddress.isEmpty) {
          return;
        }
        ref.read(globalLoadingProvider.notifier).start();

        final success = await TokenService().banAddress(
          scId: nft.id,
          fromAddress: fromAddress,
          banAddress: banAddress,
        );
        ref.read(globalLoadingProvider.notifier).complete();

        if (success) {
          Toast.message("Token address ban transaction broadcasted");
        }
      },
    );
  }
}
