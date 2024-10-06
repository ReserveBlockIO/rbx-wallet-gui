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

    final isOwner = vfxIsOwner || raIsOwner;

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
              if (isOwner) WebChangeTokenOwnershipButton(token: token),
              if (isOwner) WebPauseTokenButton(token: token),
              if (isOwner) WebTokenBanAddressButton(token: token),
              if (isOwner && token.bannedAddresses.isNotEmpty) WebTokenListBannedAddressesButton(token: token)
              //TODO: VOTE
            ],
          ),
        ),
      ],
    );
  }
}

class WebTokenListBannedAddressesButton extends StatelessWidget {
  const WebTokenListBannedAddressesButton({
    super.key,
    required this.token,
  });

  final WebFungibleToken token;

  @override
  Widget build(BuildContext context) {
    return AppButton(
      label: "List Bans (${token.bannedAddresses.length})",
      variant: AppColorVariant.Dark,
      onPressed: () {
        InfoDialog.show(
          title: "Banned Addresses",
          body: token.bannedAddresses.join("\n"),
          closeText: "Close",
        );
      },
    );
  }
}

class WebTokenBanAddressButton extends BaseComponent {
  const WebTokenBanAddressButton({
    super.key,
    required this.token,
  });

  final WebFungibleToken token;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppButton(
      label: "Ban Address",
      variant: AppColorVariant.Danger,
      onPressed: () async {
        final manager = ref.read(webTokenActionsManager);
        if (!manager.guardIsTokenOwnerAndNotVault(token)) {
          return;
        }
        if (!manager.verifyBalance()) {
          return;
        }
        final address = await manager.promptForAddress(title: "Address to Ban");
        if (address == null) {
          return;
        }

        final success = await manager.banAddress(token, token.ownerAddress, address);
      },
    );
  }
}

class WebPauseTokenButton extends BaseComponent {
  const WebPauseTokenButton({
    super.key,
    required this.token,
  });

  final WebFungibleToken token;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppButton(
      label: token.isPaused ? 'Resume TXs' : 'Pause Txs',
      variant: AppColorVariant.Light,
      onPressed: () async {
        final manager = ref.read(webTokenActionsManager);

        if (!manager.guardIsTokenOwnerAndNotVault(token)) {
          return;
        }
        if (!manager.verifyBalance()) {
          return;
        }

        final confirmed = await ConfirmDialog.show(
          title: token.isPaused ? "Resume Transactions" : "Pause Transactions",
          body: token.isPaused
              ? "Are you sure you want resume transactions with this token?"
              : "Are you sure you want to pause all transactions with this token?",
          confirmText: "Yes",
          cancelText: "No",
        );
        if (confirmed == true) {
          final success = await manager.pause(token, token.ownerAddress, !token.isPaused);
        }
      },
    );
  }
}

class WebChangeTokenOwnershipButton extends BaseComponent {
  const WebChangeTokenOwnershipButton({
    super.key,
    required this.token,
  });

  final WebFungibleToken token;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppButton(
      label: "Change Ownership",
      variant: AppColorVariant.Secondary,
      onPressed: () async {
        final manager = ref.read(webTokenActionsManager);

        if (!manager.guardIsTokenOwner(token)) {
          return;
        }

        if (!manager.verifyBalance(isRa: token.ownerAddress.startsWith('xRBX'))) {
          return;
        }
        final address = await manager.promptForAddress(title: "New Owner's Address");
        if (address == null) {
          return;
        }

        if (token.ownerAddress.startsWith("xRBX")) {
          final raKeypair = ref.read(webSessionProvider).raKeypair;

          if (raKeypair == null || raKeypair.address != token.ownerAddress) {
            Toast.error("Could not locate vault keypair for address ${token.ownerAddress}.");
            return;
          }

          final hoursString = await PromptModal.show(
            title: "Timelock Duration",
            validator: (_) => null,
            labelText: "Hours (24 Minimum)",
            initialValue: "24",
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          );

          int unlockHours = (hoursString != null ? int.tryParse(hoursString) : 24) ?? 24;
          if (unlockHours < 24) {
            unlockHours = 24;
          }
          final success = await manager.transferOwnershipFromVault(
            token,
            address,
            token.ownerAddress,
            raKeypair,
            unlockHours,
          );
          return;
        }
        final success = await manager.transferOwnership(
          token,
          address,
          token.ownerAddress,
        );
      },
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
