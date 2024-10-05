import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/app_constants.dart';
import 'package:rbx_wallet/core/dialogs.dart';
import 'package:rbx_wallet/core/providers/web_session_provider.dart';
import 'package:rbx_wallet/utils/validation.dart';

import '../../../core/base_component.dart';
import '../../../core/components/buttons.dart';
import '../../../core/theme/app_theme.dart';
import '../../../core/theme/components.dart';
import '../../../utils/toast.dart';
import '../models/web_fungible_token.dart';
import '../providers/web_token_actions_manager.dart';

class WebTokenManagementActions extends BaseComponent {
  const WebTokenManagementActions({
    super.key,
    required this.tokenDetail,
    required this.raIsOwner,
    required this.vfxIsOwner,
  });

  final WebFungibleTokenDetail tokenDetail;
  final bool raIsOwner;
  final bool vfxIsOwner;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final token = tokenDetail.token;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "Manage Token",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        SizedBox(
          height: 16,
        ),
        AppCard(
          fullWidth: true,
          child: Wrap(
            alignment: WrapAlignment.center,
            runAlignment: WrapAlignment.center,
            spacing: 16,
            children: [
              if (token.canMint)
                AppButton(
                  label: "Mint Tokens",
                  variant: AppColorVariant.Success,
                  onPressed: () async {
                    if (raIsOwner) {
                      Toast.error("Vault accounts can not mint tokens. Please transfer ownership to your standard VFX account first");
                      return;
                    }

                    final address = ref.read(webSessionProvider).keypair?.address;

                    if (address == null) {
                      Toast.error("A standard VFX account is required to proceed");
                      return;
                    }

                    final balance = ref.read(webSessionProvider).balance;
                    if (balance == null || balance < MIN_RBX_FOR_SC_ACTION) {
                      Toast.error("A balance on your VFX account is required to broadcast this transaction");
                      return;
                    }

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

                    final error = await ref.read(webTokenActionsManager).mintTokens(token, address, amountDouble);
                  },
                ),
              AppButton(
                label: "Change Ownership",
                variant: AppColorVariant.Danger,
                onPressed: () {},
              ),
              //TODO: PAUSE
              //TODO: BAN
              //TODO: VOTE
            ],
          ),
        ),
      ],
    );
  }
}
