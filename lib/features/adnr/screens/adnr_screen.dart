import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/components/currency_segmented_button.dart';
import '../../../core/providers/currency_segmented_button_provider.dart';
import '../../btc/models/btc_account.dart';
import '../../../core/components/back_to_home_button.dart';

import '../../../core/app_constants.dart';
import '../../../core/base_screen.dart';
import '../../btc/components/btc_adnr_card.dart';
import '../../btc/components/btc_adnr_list.dart';
import '../../btc/providers/btc_account_list_provider.dart';
import '../../transactions/components/combined_transactions_list.dart';
import '../../wallet/models/wallet.dart';
import '../../wallet/providers/wallet_list_provider.dart';
import '../components/adrn_list.dart';
import '../components/vfx_adnr_component.dart';

class AdnrScreen extends BaseScreen {
  const AdnrScreen({Key? key}) : super(key: key);

  @override
  AppBar? appBar(BuildContext context, WidgetRef ref) {
    final mode = ref.watch(currencySegementedButtonProvider);

    late final String title;
    switch (mode) {
      case CurrencyType.any:
        title = "Domains";
        break;
      case CurrencyType.vfx:
        title = "VFX Domains";
        break;
      case CurrencyType.btc:
        title = "BTC Domains";
        break;
    }

    return AppBar(
      title: Text(title),
      backgroundColor: Colors.black12,
      shadowColor: Colors.transparent,
      // leading: BackToHomeButton(),
    );
  }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: CurrencySegementedButton(includeAny: true),
        ),
        Expanded(
          child: Builder(
            builder: (context) {
              final mode = ref.watch(currencySegementedButtonProvider);

              switch (mode) {
                case CurrencyType.any:
                  final vfxAccounts = ref.watch(walletListProvider).where((w) => !w.isReserved).toList();
                  final btcAccounts = ref.watch(btcAccountListProvider);

                  final combined = [
                    ...vfxAccounts,
                    ...btcAccounts,
                  ];

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Text(
                              "Create a domain as an alias to your address for receiving funds.",
                              style: TextStyle(
                                fontSize: 17,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            const Text(
                              "Domains cost $ADNR_COST VFX plus the transaction fee.",
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemCount: combined.length,
                          itemBuilder: (context, index) {
                            final item = combined[index];

                            if (item is Wallet) {
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 16.0),
                                child: IntrinsicHeight(
                                  child: Row(
                                    children: [
                                      CardIndicatorVfx(verticalPadding: 12),
                                      Expanded(child: VfxAdnrCard(wallet: item)),
                                    ],
                                  ),
                                ),
                              );
                            }

                            if (item is BtcAccount) {
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 16.0),
                                child: IntrinsicHeight(
                                  child: Row(
                                    children: [
                                      CardIndicatorBtc(
                                        verticalPadding: 12,
                                      ),
                                      Expanded(child: BtcAdnrCard(account: item)),
                                    ],
                                  ),
                                ),
                              );
                            }

                            return SizedBox();
                          },
                        ),
                      ),
                    ],
                  );
                case CurrencyType.vfx:
                  final wallets = ref.watch(walletListProvider).where((w) => !w.isReserved).toList();

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Text(
                              "Create a VFX domain as an alias to your address for receiving funds.",
                              style: TextStyle(
                                fontSize: 17,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            const Text(
                              "VFX domains cost $ADNR_COST VFX plus the transaction fee.",
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 6.0),
                          child: AdnrList(wallets: wallets),
                        ),
                      ),
                    ],
                  );
                case CurrencyType.btc:
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Text(
                              "Create a BTC domain as an alias to your BTC address for receiving funds.",
                              style: TextStyle(
                                fontSize: 17,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            const Text(
                              "BTC domains cost $ADNR_COST VFX plus the transaction fee.",
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: BtcAdnrList(),
                      )
                    ],
                  );
              }
            },
          ),
        ),
      ],
    );
  }
}
