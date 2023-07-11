import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/app_router.gr.dart';
import 'package:rbx_wallet/core/base_component.dart';
import 'package:rbx_wallet/core/components/buttons.dart';
import 'package:rbx_wallet/core/providers/session_provider.dart';
import 'package:rbx_wallet/core/theme/app_theme.dart';
import 'package:rbx_wallet/features/token/components/token_list_tile.dart';
import 'package:rbx_wallet/features/token/providers/token_nfts_provider.dart';

class TokenList extends BaseComponent {
  const TokenList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final accounts = ref.watch(sessionProvider).balances.where((b) => b.tokens.isNotEmpty).toList();
    if (accounts.isEmpty) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "No Tokens",
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      );
    }
    return ListView.builder(
      itemCount: accounts.length,
      itemBuilder: (context, index) {
        final account = accounts[index];

        final tokens = account.tokens;

        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary.withOpacity(0.7),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  account.address,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
            ...tokens.map((t) {
              return TokenListTile(
                tokenAccount: t,
                address: account.address,
                token: ref.read(tokenNftsProvider)[t.smartContractId],
              );
            }),
            SizedBox(
              height: 16,
            ),
          ],
        );
      },
    );
  }
}
