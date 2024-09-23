import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rbx_wallet/core/app_constants.dart';
import 'package:rbx_wallet/core/base_screen.dart';
import 'package:rbx_wallet/core/components/buttons.dart';
import 'package:rbx_wallet/core/dialogs.dart';
import 'package:rbx_wallet/core/env.dart';
import 'package:rbx_wallet/core/theme/app_theme.dart';
import 'package:rbx_wallet/core/components/back_to_home_button.dart';
import 'package:rbx_wallet/core/theme/colors.dart';
import 'package:rbx_wallet/features/btc/models/tokenized_bitcoin.dart';
import 'package:rbx_wallet/features/btc/providers/tokenized_btc_onboard_provider.dart';

import 'package:rbx_wallet/features/btc/screens/tokenize_btc_screen.dart';
import 'package:rbx_wallet/features/btc/screens/tokenized_btc_detail_screen.dart';
import 'package:rbx_wallet/features/faucet/screens/faucet_screen.dart';

import 'package:rbx_wallet/features/nft/models/nft.dart';
import 'package:rbx_wallet/features/nft/services/nft_service.dart';
import 'package:rbx_wallet/features/wallet/components/wallet_selector.dart';
import 'package:rbx_wallet/features/wallet/models/wallet.dart';
import 'package:rbx_wallet/features/wallet/providers/wallet_list_provider.dart';
import 'package:collection/collection.dart';

import '../../../core/theme/components.dart';
import '../providers/btc_pending_tokenized_address_list_provider.dart';
import '../providers/tokenize_btc_form_provider.dart';
import '../providers/tokenized_bitcoin_list_provider.dart';
import 'tokenize_btc_onboarding_screen.dart';

class TokenizeBtcListScreen extends BaseScreen {
  const TokenizeBtcListScreen({super.key});

  @override
  AppBar? appBar(BuildContext context, WidgetRef ref) {
    return AppBar(
      backgroundColor: Colors.black,
      title: Text("Tokenized Bitcoin (vBTC)"),
      leading: BackToHomeButton(),

      // Padding(
      //   padding: const EdgeInsets.only(right: 8.0),
      //   child: AppButton(
      //     label: "Tokenize BTC",
      //     variant: AppColorVariant.Btc,
      //     icon: FontAwesomeIcons.bitcoin,
      //     onPressed: () {
      //       Navigator.of(context).push(
      //         MaterialPageRoute(
      //           builder: (context) => TokenizeBtcScreen(),
      //         ),
      //       );
      //     },
      //   ),
      // )
    );
  }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    final tokens = ref.watch(tokenizedBitcoinListProvider);

    final pendingIds = ref.watch(btcPendingTokenizedAddressListProvider);

    return Column(
      children: [
        AppCard(
          fullWidth: true,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: AppButton(
                  label: "Create a Verified BTC Token",
                  // iconOffset: Offset(0, 3),
                  variant: AppColorVariant.Vbtc,
                  icon: FontAwesomeIcons.bitcoin,
                  onPressed: () async {
                    Wallet? wallet = ref.read(walletListProvider).firstWhereOrNull((a) => a.balance > MIN_RBX_FOR_SC_ACTION && !a.isReserved);

                    if (wallet == null) {
                      final confirmContinue = await ConfirmDialog.show(
                        title: "VFX Address with Balance Required",
                        body: "A VFX address with a balance is required to proceed. Would you like to set this up now?",
                        confirmText: "Yes",
                        cancelText: "No",
                      );
                      if (confirmContinue != true) {
                        return;
                      }

                      ref.read(vBtcOnboardProvider.notifier).reset();

                      final token = await Navigator.of(context).push(MaterialPageRoute(builder: (_) => TokenizeBtcOnboardingScreen()));
                      if (token == null) {
                        return;
                      }

                      if (token is TokenizedBitcoin) {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => TokenizedBtcDetailScreen(tokenId: token.id),
                          ),
                        );
                        return;
                      }

                      wallet = ref.read(walletListProvider).firstWhereOrNull((a) => a.balance > MIN_RBX_FOR_SC_ACTION && !a.isReserved);

                      if (wallet == null) {
                        InfoDialog.show(
                          title: "VFX Address with Balance Required",
                          body: "A VFX address with a balance is required to proceed.",
                        );
                        return;
                      }
                    }

                    ref.read(tokenizeBtcFormProvider.notifier).setAddress(wallet.address);

                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => TokenizeBtcScreen(),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: AppButton(
                  label: "Use Wizard",
                  type: AppButtonType.Text,
                  onPressed: () async {
                    ref.read(vBtcOnboardProvider.notifier).reset();

                    final token = await Navigator.of(context).push(MaterialPageRoute(builder: (_) => TokenizeBtcOnboardingScreen()));
                    if (token == null) {
                      return;
                    }

                    if (token is TokenizedBitcoin) {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => TokenizedBtcDetailScreen(tokenId: token.id),
                        ),
                      );
                      return;
                    }
                  },
                  variant: AppColorVariant.Light,
                  underlined: true,
                ),
              ),
              TextButton.icon(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        content: _vBTCInfo(),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text(
                              "Close",
                              style: TextStyle(color: AppColors.getVbtc()),
                            ),
                          )
                        ],
                      );
                    },
                  );
                },
                icon: Icon(
                  Icons.help,
                  size: 16,
                  color: AppColors.getVbtc(),
                ),
                label: Text(
                  "What is vBTC?",
                  style: TextStyle(
                    color: AppColors.getVbtc(),
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 16,
        ),
        Expanded(
          child: tokens.isEmpty
              ? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("No Tokenized Bitcoin found in wallet."),
                )
              : ListView.builder(
                  itemCount: tokens.length,
                  itemBuilder: (context, index) {
                    final token = tokens[index];

                    return Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          boxShadow: glowingBoxBtc,
                        ),
                        child: Card(
                          color: Colors.black,
                          child: TokenizedBtcListTile(token: token),
                        ),
                      ),
                    );
                  },
                ),
        ),
      ],
    );
  }
}

class _vBTCInfo extends StatelessWidget {
  const _vBTCInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "This wallet provides a specific smart contract that enables tokenizing actual Bitcoin! This will allow you to lock any denomination of Bitcoin you choose into a smart contract with or without media / documents.\n\nOnce minted, you will then hold a Verified Bitcoin Token that you may send to any other person at any time in whole or in part without moving it across the BTC network and without paying any BTC fees. Only you or the holder of a vBTC token may unlock the underlying BTC from the smart contract. You may also add additional BTC to your token at anytime without creating an additional one should you choose.\n\nAny and all vBTC tokens may also be stored in your registered Reserve (Protected) Account feature enabling full on-chain recovery and call-back options providing incredibly secure self-custodial vaulting.",
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 12,
        ),
        Text(
          "Welcome to true on-chain utility for your BTC!",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

class TokenizedBtcListTile extends StatelessWidget {
  const TokenizedBtcListTile({
    super.key,
    required this.token,
  });

  final TokenizedBitcoin token;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(token.tokenName),
      // subtitle: Text("${token.myBalance} vBTC"),
      subtitle: Text(
        token.rbxAddress,
        style: TextStyle(
          color: token.rbxAddress.startsWith("xRBX") ? Colors.deepPurple.shade200 : null,
        ),
      ),
      leading: BtcTokenImage(
        nftId: token.smartContractUid,
        size: 48,
      ),
      trailing: Text(
        "${token.myBalance} vBTC",
        style: TextStyle(color: Theme.of(context).colorScheme.btcOrange),
      ),
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => TokenizedBtcDetailScreen(tokenId: token.id),
          ),
        );
        // InfoDialog.show(
        //   contextOverride: context,
        //   title: "Token Info",
        //   content: Builder(builder: (context) {
        //     return ConstrainedBox(
        //       constraints: BoxConstraints(maxWidth: 600),
        //       child: Column(
        //         mainAxisSize: MainAxisSize.min,
        //         crossAxisAlignment: CrossAxisAlignment.start,
        //         children: [
        //           Text("Name: ${token.tokenName}"),
        //           Text("Description: ${token.tokenDescription}"),
        //           SelectableText("VFX Owner: ${token.rbxAddress}"),
        //           SelectableText("BTC Address: ${token.btcAddress ?? '-'}"),
        //           SelectableText("Smart Contract ID: ${token.smartContractUid}"),
        //         ],
        //       ),
        //     );
        //   }),
        // );
      },
    );
  }
}
