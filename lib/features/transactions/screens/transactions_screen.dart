// ignore_for_file: unnecessary_const

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/components/currency_segmented_button.dart';
import 'package:rbx_wallet/core/theme/app_theme.dart';
import 'package:rbx_wallet/core/theme/colors.dart';
import 'package:rbx_wallet/features/btc/components/btc_utxo_list.dart';
import 'package:rbx_wallet/core/components/back_to_home_button.dart';

import '../../../core/base_screen.dart';
import '../../../core/providers/session_provider.dart';
import '../../btc/components/btc_transaction_list.dart';
import '../../wallet/components/wallet_selector.dart';
import '../components/transaction_list.dart';
import '../providers/transaction_list_provider.dart';

class TransactionsScreen extends BaseScreen {
  const TransactionsScreen({Key? key}) : super(key: key, verticalPadding: 0, horizontalPadding: 0);

  @override
  AppBar? appBar(BuildContext context, WidgetRef ref) {
    final isBtc = ref.watch(sessionProvider).btcSelected;

    return AppBar(
      title: Text(isBtc ? "BTC Transactions" : "Your Transactions"),
      backgroundColor: Colors.black12,
      shadowColor: Colors.transparent,
      leading: BackToHomeButton(),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: Align(
            alignment: Alignment.centerRight,
            child: CurrencySegementedButton(
              includeAny: false,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    final isBtc = ref.watch(sessionProvider).btcSelected;
    final btcAccount = ref.watch(sessionProvider).currentBtcAccount;

    return Column(
      children: [
        Expanded(
          child: Builder(
            builder: (context) {
              if (isBtc) {
                final btcColor = Theme.of(context).colorScheme.btcOrange;

                return DefaultTabController(
                  length: 2,
                  child: Column(
                    children: [
                      TabBar(
                        indicatorColor: btcColor,
                        tabs: [
                          const Tab(
                            child: Text("Outgoing Transactions"),
                          ),
                          const Tab(
                            child: Text("Inputs"),
                          ),
                        ],
                      ),
                      Expanded(
                        child: TabBarView(
                          children: [
                            BtcTransactionList(),
                            BtcUtxoList(),
                          ],
                        ),
                      )
                    ],
                  ),
                );
              }

              return DefaultTabController(
                length: 6,
                child: Column(
                  children: [
                    TabBar(
                      indicatorColor: AppColors.getBlue(),
                      tabs: [
                        const Tab(
                          child: const Text("All"),
                        ),
                        const Tab(
                          child: const Text("Pending"),
                        ),
                        const Tab(
                          child: const Text("Successful"),
                        ),
                        const Tab(
                          child: Text("Failed"),
                        ),
                        const Tab(
                          child: const Text("Reserve"),
                        ),
                        const Tab(
                          child: const Text("Validated"),
                        ),
                      ],
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: TabBarView(
                          children: [
                            TransactionListType.All,
                            TransactionListType.Pending,
                            TransactionListType.Success,
                            TransactionListType.Failed,
                            TransactionListType.Reserved,
                            TransactionListType.Validated,
                          ].map((type) => TransactionList(type: type)).toList(),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
