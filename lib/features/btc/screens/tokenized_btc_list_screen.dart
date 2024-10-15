import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../core/app_constants.dart';
import '../../../core/base_screen.dart';
import '../../../core/breakpoints.dart';
import '../../../core/components/buttons.dart';
import '../../../core/dialogs.dart';
import '../../../core/theme/app_theme.dart';
import '../../../core/components/back_to_home_button.dart';
import '../../../core/theme/colors.dart';
import '../../web/components/web_mobile_drawer_button.dart';
import '../models/tokenized_bitcoin.dart';
import '../providers/tokenized_btc_onboard_provider.dart';

import 'tokenize_btc_screen.dart';
import 'tokenized_btc_detail_screen.dart';

import '../../wallet/models/wallet.dart';
import '../../wallet/providers/wallet_list_provider.dart';
import 'package:collection/collection.dart';

import '../../../core/providers/web_session_provider.dart';
import '../../../core/theme/components.dart';
import '../../btc_web/components/web_tokenized_btc_list_tile.dart';
import '../../btc_web/providers/btc_web_vbtc_token_list_provider.dart';
import '../providers/btc_pending_tokenized_address_list_provider.dart';
import '../providers/tokenize_btc_form_provider.dart';
import '../providers/tokenized_bitcoin_list_provider.dart';
import 'tokenize_btc_onboarding_screen.dart';

class TokenizeBtcListScreen extends BaseScreen {
  const TokenizeBtcListScreen({super.key});

  @override
  AppBar? appBar(BuildContext context, WidgetRef ref) {
    final isMobile = BreakPoints.useMobileLayout(context);

    return AppBar(
      leading: isMobile ? WebMobileDrawerButton() : null,
      backgroundColor: Colors.black,
      title: Text("Tokenized Bitcoin (vBTC)"),
      // leading: BackToHomeButton(),

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
    final pendingIds = ref.watch(btcPendingTokenizedAddressListProvider);

    return Column(
      children: [
        AppCard(
          fullWidth: true,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              VBtcButton(
                label: "Create Verified BTC Token",
                icon: FontAwesomeIcons.bitcoin,
                onPressed: () async {
                  if (kIsWeb) {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => TokenizeBtcScreen(),
                      ),
                    );

                    return;
                  }
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
              if (!kIsWeb)
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
              if (kIsWeb)
                SizedBox(
                  height: 8,
                ),
              TextButton.icon(
                onPressed: () {
                  SpecialDialog().show(
                    context,
                    content: VbtcInfo(),
                    title: "vBTC",
                    maxWidth: 800,
                  );
                },
                icon: Icon(
                  Icons.help,
                  size: 16,
                  color: AppColors.getWhite(),
                ),
                label: Text(
                  "What is vBTC?",
                  style: TextStyle(
                    color: AppColors.getWhite(),
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
        Consumer(builder: (context, ref, _) {
          if (kIsWeb) {
            final tokens = ref.watch(btcWebVbtcTokenListProvider);

            return Expanded(
                child: ListView.builder(
              itemCount: tokens.length,
              itemBuilder: (context, index) {
                final token = tokens[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: AppCard(
                    padding: 0,
                    child: WebTokenizedBtcListTile(token: token),
                  ),
                );
              },
            ));
          }

          final tokens = ref.watch(tokenizedBitcoinListProvider);

          return Expanded(
            child: tokens.isEmpty
                ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("No Tokenized Bitcoin found in account."),
                  )
                : ListView.builder(
                    itemCount: tokens.length,
                    itemBuilder: (context, index) {
                      final token = tokens[index];

                      return Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: AppCard(
                          padding: 0,
                          child: TokenizedBtcListTile(token: token),
                        ),
                      );
                    },
                  ),
          );
        }),
      ],
    );
  }
}

class VbtcInfo extends StatelessWidget {
  const VbtcInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
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
      ),
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
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)),
            clipBehavior: Clip.antiAlias,
            child: BtcTokenImage(
              nftId: token.smartContractUid,
              size: 100,
            ),
          ),
        ),
        Expanded(
          child: ListTile(
            title: Text(
              token.tokenName,
              style: TextStyle(
                fontSize: 22,
              ),
            ),
            // subtitle: Text("${token.myBalance} vBTC"),
            subtitle: Text(
              token.rbxAddress,
              style: TextStyle(
                color: token.rbxAddress.startsWith("xRBX") ? Colors.deepPurple.shade200 : null,
                fontSize: 16,
              ),
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
            },
          ),
        ),
      ],
    );
  }
}
