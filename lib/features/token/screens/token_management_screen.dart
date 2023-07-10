import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/base_screen.dart';
import 'package:rbx_wallet/core/components/buttons.dart';
import 'package:rbx_wallet/core/dialogs.dart';
import 'package:rbx_wallet/core/providers/session_provider.dart';
import 'package:rbx_wallet/core/theme/app_theme.dart';
import 'package:rbx_wallet/features/nft/models/nft.dart';
import 'package:rbx_wallet/features/nft/providers/nft_detail_watcher.dart';
import 'package:rbx_wallet/features/nft/providers/nft_list_provider.dart';
import 'package:rbx_wallet/features/token/components/mint_tokens_button.dart';
import 'package:rbx_wallet/features/token/models/token_account.dart';
import 'package:rbx_wallet/features/token/models/token_sc_feature.dart';
import 'package:rbx_wallet/features/token/providers/token_nfts_provider.dart';
import 'package:rbx_wallet/utils/toast.dart';
import 'package:collection/collection.dart';

import '../components/ban_token_address_button.dart';
import '../components/burn_tokens_button.dart';
import '../components/change_token_ownership_button.dart';
import '../components/pause_token_button.dart';
import '../components/transfer_tokens_button.dart';

class TokenManagementScreen extends BaseScreen {
  final TokenAccount tokenAccount;
  final TokenScFeature token;
  final String nftId;

  const TokenManagementScreen(this.tokenAccount, this.token, this.nftId, {super.key})
      : super(
          backgroundColor: Colors.black87,
          horizontalPadding: 0,
          verticalPadding: 0,
        );

  @override
  AppBar? appBar(BuildContext context, WidgetRef ref) {
    return AppBar(
      backgroundColor: Colors.black54,
      title: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (token.imageBase64 != null && token.imageBase64!.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: SizedBox(
                width: 32,
                height: 32,
                child: Image.memory(
                  Base64Decoder().convert(token.imageBase64!),
                  width: 32,
                  height: 32,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          Text(tokenAccount.label),
        ],
      ),
    );
  }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    final data = ref.watch(nftDetailWatcher(nftId));
    return data.when(
      loading: () => SizedBox(),
      error: (_, __) => SizedBox(),
      data: (nft) {
        if (nft == null) {
          return SizedBox();
        }

        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Builder(builder: (context) {
                  final balance = ref.watch(sessionProvider).balances.firstWhereOrNull((b) => b.address == nft.currentOwner);

                  if (balance == null) {
                    return SizedBox();
                  }

                  final token = balance.tokens.firstWhereOrNull((t) => t.smartContractId == nftId);
                  if (token == null) {
                    return SizedBox();
                  }

                  return Text(
                    "Balance: ${token.balance}",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  );
                }),
                Divider(),
                TokenDetailsContent(
                  tokenAccount: tokenAccount,
                  token: token,
                  owner: nft.currentOwner,
                ),
                Divider(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Wrap(
                    alignment: WrapAlignment.center,
                    spacing: 12.0,
                    runSpacing: 12.0,
                    children: [
                      if (token.mintable) MintTokensButton(nft: nft),
                      TransferTokensButton(
                        scId: nft.id,
                        fromAddress: nft.currentOwner,
                        currentBalance: tokenAccount.balance,
                      ),
                      PauseTokenButton(
                        scId: nft.id,
                        fromAddress: nft.currentOwner,
                      ),
                      ChangeTokenOwnershipButton(
                        nft: nft,
                        fromAddress: nft.currentOwner,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Wrap(
                    alignment: WrapAlignment.center,
                    spacing: 12.0,
                    runSpacing: 12.0,
                    children: [
                      if (token.burnable)
                        BurnTokensButton(
                          scId: nft.id,
                          fromAddress: nft.currentOwner,
                          currentBalance: tokenAccount.balance,
                          elevated: false,
                        ),
                      BanTokenAddressButton(
                        nft: nft,
                        fromAddress: nft.currentOwner,
                      ),
                      if (nft.tokenStateDetails != null &&
                          nft.tokenStateDetails!.addressBlackList != null &&
                          nft.tokenStateDetails!.addressBlackList!.isNotEmpty)
                        AppButton(
                          label: "List Bans",
                          variant: AppColorVariant.Light,
                          type: AppButtonType.Text,
                          onPressed: () {
                            final content = nft.tokenStateDetails!.addressBlackList!.join("\n");
                            InfoDialog.show(title: "Banned Addresses", body: content);
                          },
                        ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

class TokenDetailsContent extends StatelessWidget {
  const TokenDetailsContent({
    super.key,
    required this.tokenAccount,
    required this.token,
    required this.owner,
  });

  final TokenAccount tokenAccount;
  final TokenScFeature token;
  final String owner;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _DetailRow(
          label: "Smart Contract UID",
          value: tokenAccount.smartContractId,
          copyable: true,
        ),
        _DetailRow(
          label: "Owner",
          value: owner,
          copyable: true,
        ),
        _DetailRow(
          label: "Token Name",
          value: token.name,
          copyable: true,
        ),
        _DetailRow(
          label: "Token Ticker",
          value: token.ticker,
          copyable: true,
        ),
        _DetailRow(
          label: "Mintable",
          value: token.mintable ? "YES" : "NO",
        ),
        if (!token.mintable)
          _DetailRow(
            label: "Supply",
            value: token.supply.toString(),
          ),
        _DetailRow(
          label: "Burnable",
          value: token.burnable ? "YES" : "NO",
        ),
      ],
    );
  }
}

class _DetailRow extends StatelessWidget {
  final String label;
  final String value;
  final bool copyable;

  const _DetailRow({
    super.key,
    required this.label,
    required this.value,
    this.copyable = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Text(
            "$label: ",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          Text(
            value,
            style: TextStyle(fontSize: 18),
          ),
          if (copyable)
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: InkWell(
                  onTap: () async {
                    await Clipboard.setData(ClipboardData(text: value));
                    Toast.message("$label copied to clipboard");
                  },
                  child: Icon(
                    Icons.copy,
                    size: 16,
                  )),
            ),
        ],
      ),
    );
  }
}
