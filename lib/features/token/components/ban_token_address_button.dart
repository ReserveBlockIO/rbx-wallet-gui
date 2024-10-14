import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/base_component.dart';
import '../../../core/components/buttons.dart';
import '../../../core/dialogs.dart';
import '../../../core/theme/app_theme.dart';
import '../../global_loader/global_loading_provider.dart';
import '../../nft/models/nft.dart';
import '../services/token_service.dart';
import '../../../utils/toast.dart';
import '../../../utils/validation.dart';

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
