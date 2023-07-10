import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/base_component.dart';
import 'package:rbx_wallet/core/dialogs.dart';
import 'package:rbx_wallet/core/theme/app_theme.dart';
import 'package:rbx_wallet/features/nft/services/nft_service.dart';
import 'package:rbx_wallet/features/token/components/burn_tokens_button.dart';
import 'package:rbx_wallet/features/token/components/transfer_tokens_button.dart';
import 'package:rbx_wallet/features/token/models/token_account.dart';
import 'package:rbx_wallet/features/token/models/token_sc_feature.dart';
import 'package:rbx_wallet/features/token/screens/token_management_screen.dart';

class TokenCard extends BaseComponent {
  final String address;
  final TokenAccount tokenAccount;
  final TokenScFeature? token;
  const TokenCard({
    super.key,
    required this.address,
    required this.tokenAccount,
    required this.token,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: glowingBox,
        ),
        child: Card(
          color: Colors.black,
          child: ListTile(
            leading: token != null && token!.imageBase64 != null
                ? SizedBox(
                    width: 32,
                    height: 32,
                    child: Image.memory(Base64Decoder().convert(token!.imageBase64!), width: 32, height: 32),
                  )
                : Icon(Icons.toll),
            title: Text(tokenAccount.label),
            subtitle: Text("Balance: ${tokenAccount.balance}"),
            trailing: token != null
                ? Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TransferTokensButton(
                        scId: tokenAccount.smartContractId,
                        fromAddress: address,
                        currentBalance: tokenAccount.balance,
                      ),
                      if (token!.burnable)
                        Padding(
                          padding: const EdgeInsets.only(left: 6.0),
                          child: BurnTokensButton(
                            scId: tokenAccount.smartContractId,
                            fromAddress: address,
                            currentBalance: tokenAccount.balance,
                          ),
                        ),
                    ],
                  )
                : SizedBox(),
            onTap: token != null
                ? () async {
                    final detail = await NftService().getNftData(tokenAccount.smartContractId);
                    if (detail != null && detail.isToken) {
                      if (detail.currentOwner == address) {
                        final tokenAccount = TokenAccount.fromNft(detail, ref);
                        final tokenFeature = TokenScFeature.fromNft(detail);
                        if (tokenAccount != null && tokenFeature != null) {
                          Navigator.of(context).push(MaterialPageRoute(builder: (_) => TokenManagementScreen(tokenAccount, tokenFeature, detail)));
                          return;
                        }
                      }
                    }

                    InfoDialog.show(
                      title: "Token Details",
                      content: TokenDetails(
                        token: token!,
                        tokenAccount: tokenAccount,
                      ),
                    );
                  }
                : null,
          ),
        ),
      ),
    );
  }
}
