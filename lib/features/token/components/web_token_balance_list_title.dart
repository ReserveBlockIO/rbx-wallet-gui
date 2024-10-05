import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/base_component.dart';
import 'package:rbx_wallet/features/token/models/web_fungible_token.dart';

import '../../../core/components/buttons.dart';
import '../../../core/theme/app_theme.dart';
import '../../../core/theme/components.dart';

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
            AppButton(
              label: "Transfer",
              onPressed: () {},
            ),
            if (tokenDetail.token.canBurn)
              Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: AppButton(
                  label: "Burn",
                  variant: AppColorVariant.Danger,
                  onPressed: () {},
                ),
              ),
          ],
        ),
      ),
    );
  }
}
