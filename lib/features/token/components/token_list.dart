import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/app_router.gr.dart';
import '../../../core/base_component.dart';
import '../../../core/components/buttons.dart';
import '../../../core/providers/session_provider.dart';
import '../../../core/theme/app_theme.dart';
import 'token_list_tile.dart';
import '../models/token_account.dart';
import '../providers/token_nfts_provider.dart';
import '../../../utils/toast.dart';

class TokenList extends BaseComponent {
  final String? filterByToken;
  final bool shrinkWrap;
  const TokenList({
    super.key,
    this.filterByToken,
    this.shrinkWrap = false,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final accounts = ref.watch(sessionProvider.select((v) => v.balances)).where((b) => b.tokens.isNotEmpty).toList();

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
    return ListView.builder(
      shrinkWrap: shrinkWrap,
      itemCount: accounts.length,
      itemBuilder: (context, index) {
        final account = accounts[index];

        List<TokenAccount> tokens = account.tokens;
        final isOwnedByRA = account.address.startsWith("xRBX");

        if (filterByToken != null) {
          tokens = tokens.where((t) => t.smartContractId == filterByToken).toList();
        }

        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (index == 0)
              SizedBox(
                height: 8,
              ),
            Container(
              decoration: BoxDecoration(
                // color: Theme.of(context).colorScheme.primary.withOpacity(0.7),
                color: Colors.white.withOpacity(0.03),
                border: Border.all(color: Colors.white.withOpacity(0.03)),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () async {
                        await Clipboard.setData(ClipboardData(text: account.address));
                        Toast.message("Address copied to clipboard (${account.address})");
                      },
                      child: Icon(
                        Icons.copy,
                        size: 14,
                        color: isOwnedByRA ? Theme.of(context).colorScheme.reserve : null,
                      ),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    SelectableText(
                      account.address,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: isOwnedByRA ? Theme.of(context).colorScheme.reserve : null,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            ...tokens.map((t) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: TokenListTile(
                  tokenAccount: t,
                  address: account.address,
                  token: ref.read(tokenNftsProvider)[t.smartContractId],
                ),
              );
            }),
            SizedBox(
              height: 8,
            ),
            if (index + 1 == accounts.length)
              SizedBox(
                height: 32,
              ),
          ],
        );
      },
    );
  }
}
