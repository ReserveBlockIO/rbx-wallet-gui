import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/base_component.dart';
import 'package:rbx_wallet/features/token/models/web_fungible_token.dart';
import 'package:rbx_wallet/utils/toast.dart';

import '../../../core/components/buttons.dart';
import '../../../core/theme/app_theme.dart';
import '../../../core/theme/components.dart';
import '../providers/web_token_actions_manager.dart';

class WebTokenBalanceListTile extends BaseComponent {
  final WebFungibleTokenDetail tokenDetail;
  final String address;
  final double balance;
  const WebTokenBalanceListTile({
    super.key,
    required this.tokenDetail,
    required this.address,
    required this.balance,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppCard(
      padding: 0,
      child: ListTile(
        leading: tokenDetail.token.imageUrl != null
            ? CachedNetworkImage(
                imageUrl: tokenDetail.token.imageUrl!,
                width: 32,
                height: 32,
              )
            : null,
        title: Text(address),
        subtitle: Text("$balance ${tokenDetail.token.ticker}"),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            WebTransferTokenAmountButton(
              balance: balance,
              address: address,
              tokenDetail: tokenDetail,
            ),
            if (tokenDetail.token.canBurn)
              Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: WebBurnTokenAmountButton(
                  balance: balance,
                  address: address,
                  tokenDetail: tokenDetail,
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class WebBurnTokenAmountButton extends BaseComponent {
  const WebBurnTokenAmountButton({
    super.key,
    required this.balance,
    required this.address,
    required this.tokenDetail,
  });

  final double balance;
  final String address;
  final WebFungibleTokenDetail tokenDetail;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppButton(
      label: "Burn",
      variant: AppColorVariant.Danger,
      onPressed: () async {
        final manager = ref.read(webTokenActionsManager);

        if (!manager.guardIsNotPaused(tokenDetail.token)) {
          return;
        }

        if (!manager.verifyBalance()) {
          return;
        }

        final amount = await manager.promptForAmount(title: "Amount to Burn");
        if (amount == null) {
          return;
        }

        if (amount > balance) {
          Toast.error("This address's ($address) ${tokenDetail.token.ticker} balance is insufficent.");
          return;
        }

        final success = await manager.burnAmount(tokenDetail.token, address, amount);
      },
    );
  }
}

class WebTransferTokenAmountButton extends BaseComponent {
  const WebTransferTokenAmountButton({
    super.key,
    required this.balance,
    required this.address,
    required this.tokenDetail,
  });

  final double balance;
  final String address;
  final WebFungibleTokenDetail tokenDetail;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppButton(
      label: "Transfer",
      onPressed: () async {
        final manager = ref.read(webTokenActionsManager);

        if (!manager.guardIsNotPaused(tokenDetail.token)) {
          return;
        }

        if (!manager.verifyBalance()) {
          return;
        }

        final toAddress = await manager.promptForAddress(title: "Transfer to");
        if (toAddress == null) {
          return;
        }

        final amount = await manager.promptForAmount(title: "Amount to Transfer");
        if (amount == null) {
          return;
        }

        if (amount > balance) {
          Toast.error("This address's ($address) ${tokenDetail.token.ticker} balance is insufficent.");
          return;
        }

        final success = await manager.transferAmount(tokenDetail.token, toAddress, address, amount);
      },
    );
  }
}
