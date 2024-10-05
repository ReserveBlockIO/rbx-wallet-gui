import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/base_component.dart';
import 'package:rbx_wallet/core/components/buttons.dart';
import 'package:rbx_wallet/core/providers/web_session_provider.dart';
import 'package:rbx_wallet/core/theme/app_theme.dart';
import 'package:rbx_wallet/features/token/components/web_token_balance_list_title.dart';
import 'package:rbx_wallet/features/token/components/web_token_management_actions.dart';
import 'package:rbx_wallet/utils/toast.dart';

import '../../../core/theme/components.dart';
import '../models/web_fungible_token.dart';
import '../screens/token_management_screen.dart';

class WebTokenDetailComponent extends BaseComponent {
  final WebFungibleTokenDetail tokenDetail;
  const WebTokenDetailComponent({super.key, required this.tokenDetail});

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    final token = tokenDetail.token;
    final List<String> myAddresses = [];
    final vfxAddress = ref.watch(webSessionProvider.select((value) => value.keypair?.address));
    final raAddress = ref.watch(webSessionProvider.select((value) => value.raKeypair?.address));
    if (vfxAddress != null) {
      myAddresses.add(vfxAddress);
    }
    if (raAddress != null) {
      myAddresses.add(raAddress);
    }

    final vfxIsOwner = vfxAddress == token.ownerAddress;
    final raIsOwner = raAddress == token.ownerAddress;

    return SingleChildScrollView(
      child: Column(
        children: [
          _TokenInfo(token: token),
          if (vfxIsOwner || raIsOwner)
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: WebTokenManagementActions(tokenDetail: tokenDetail, raIsOwner: raIsOwner, vfxIsOwner: vfxIsOwner),
            ),
          _Balances(tokenDetail: tokenDetail, myAddresses: myAddresses),
        ],
      ),
    );
  }
}

class _Balances extends BaseComponent {
  final WebFungibleTokenDetail tokenDetail;
  final List<String> myAddresses;

  const _Balances({
    super.key,
    required this.tokenDetail,
    required this.myAddresses,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final balances = tokenDetail.holders.entries.where((e) => myAddresses.contains(e.key)).toList();

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            "Token Balances",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
        ),
        if (balances.isEmpty)
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text("None of your addresses are holding ${tokenDetail.token.ticker}"),
          ),
        ListView.builder(
          shrinkWrap: true,
          itemCount: balances.length,
          itemBuilder: (context, index) {
            final b = balances[index];
            return Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: WebTokenBalanceListTile(
                tokenDetail: tokenDetail,
                address: b.key,
                balance: b.value,
              ),
            );
          },
        ),
      ],
    );
  }
}

class _TokenInfo extends StatelessWidget {
  const _TokenInfo({
    super.key,
    required this.token,
  });

  final WebFungibleToken token;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TokenDetailRow(
                  label: "Smart Contract UID",
                  value: token.smartContractId,
                  copyable: true,
                ),

                TokenDetailRow(
                  label: "Token Name",
                  value: token.name,
                  copyable: true,
                ),

                TokenDetailRow(
                  label: token.canMint ? 'Initial Issuance' : 'Fixed Supply',
                  value: token.canMint ? "0.0" : "${token.initialSupply}",
                ),
                // if (token.currentSupply > 0)

                TokenDetailRow(
                  label: "Lifetime Cap",
                  value: token.canMint ? 'Infinite' : "${token.initialSupply}",
                ),

                TokenDetailRow(
                  label: "Mintable",
                  value: token.canMint ? "YES" : "NO",
                  dividerBelow: false,
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TokenDetailRow(
                  label: "Owner",
                  value: token.ownerAddress,
                  copyable: true,
                ),
                TokenDetailRow(
                  label: "Token Ticker",
                  value: token.ticker,
                  copyable: true,
                ),
                TokenDetailRow(label: "Circulating Supply", value: "${token.circulatingSupply}"),
                if (!token.canMint && token.circulatingSupply < token.initialSupply)
                  TokenDetailRow(
                    label: "Burned",
                    value: "${token.initialSupply - token.circulatingSupply}",
                  ),
                TokenDetailRow(
                  label: "Burnable",
                  value: token.canBurn ? "YES" : "NO",
                ),
                TokenDetailRow(
                  label: "Voting",
                  value: token.canVote ? "YES" : "NO",
                  dividerBelow: false,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
