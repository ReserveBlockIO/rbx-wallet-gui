import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/app_router.gr.dart';
import 'package:rbx_wallet/core/base_component.dart';
import 'package:rbx_wallet/core/components/buttons.dart';
import 'package:rbx_wallet/core/providers/session_provider.dart';
import 'package:rbx_wallet/core/providers/web_session_provider.dart';
import 'package:rbx_wallet/core/theme/app_theme.dart';
import 'package:rbx_wallet/core/web_router.gr.dart';
import 'package:rbx_wallet/features/token/components/token_list_tile.dart';
import 'package:rbx_wallet/features/token/models/token_account.dart';
import 'package:rbx_wallet/features/token/providers/token_nfts_provider.dart';
import 'package:rbx_wallet/utils/toast.dart';

import '../../../core/components/badges.dart';
import '../../../core/theme/components.dart';
import '../../../core/theme/pretty_icons.dart';
import '../models/web_fungible_token.dart';
import '../providers/web_token_list_provider.dart';

class WebTokenList extends BaseComponent {
  final String? filterByToken;
  final bool shrinkWrap;
  const WebTokenList({
    super.key,
    this.filterByToken,
    this.shrinkWrap = false,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final accounts = ref.watch(webTokenListProvider);

    if (accounts.isEmpty) {
      if (shrinkWrap) {
        return SizedBox();
      }
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "No Fungible Tokens",
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 8),
            Text("You have no fungible tokens with supply in any of your accounts."),
            SizedBox(height: 16),
            AppButton(
              label: "Create Token",
              variant: AppColorVariant.Success,
              onPressed: () {
                AutoRouter.of(context).push(TokenCreateScreenRoute());
              },
            ),
          ],
        ),
      );
    }
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ListView.builder(
        shrinkWrap: shrinkWrap,
        itemCount: accounts.length,
        itemBuilder: (context, index) {
          final account = accounts[index];
          final token = account.token;

          return Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: AppCard(
              padding: 0,
              child: ListTile(
                leading: token.imageUrl != null && token.imageUrl!.isNotEmpty
                    ? Image.network(token.imageUrl!, width: 48, height: 48, fit: BoxFit.cover)
                    : PrettyIcon(
                        type: PrettyIconType.fungibleToken,
                      ),
                title: Text("[${token.ticker}] ${token.name}"),
                subtitle: Text(account.address),
                trailing: AppBadge(
                  label: "${account.balance} ${token.ticker}",
                  variant: account.address.startsWith("xRBX") ? AppColorVariant.Reserve : AppColorVariant.Secondary,
                ),
                onTap: () {
                  AutoRouter.of(context).push(WebTokenDetailScreenRoute(scId: token.smartContractId));
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
