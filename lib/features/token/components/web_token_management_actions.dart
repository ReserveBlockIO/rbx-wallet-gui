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
              if (token.canMint) WebMintTokenButton(raIsOwner: raIsOwner, token: token),
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

class WebMintTokenButton extends BaseComponent {
  const WebMintTokenButton({
    super.key,
    required this.raIsOwner,
    required this.token,
  });

  final bool raIsOwner;
  final WebFungibleToken token;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppButton(
      label: "Mint Tokens",
      variant: AppColorVariant.Success,
      onPressed: () async {
        final manager = ref.read(webTokenActionsManager);

        if (!manager.guardIsTokenOwnerAndNotVault(token)) {
          return;
        }

        if (!manager.verifyBalance()) {
          return;
        }

        final amount = await manager.promptForAmount(title: "Amount to Mint");

        if (amount == null) {
          return;
        }

        final success = await manager.mintTokens(token, token.ownerAddress, amount);
      },
    );
  }
}
