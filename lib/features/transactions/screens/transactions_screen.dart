// ignore_for_file: unnecessary_const

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/components/currency_segmented_button.dart';
import 'package:rbx_wallet/core/theme/app_theme.dart';
import 'package:rbx_wallet/features/btc/components/btc_utxo_list.dart';

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
      leading: IconButton(
        icon: const Icon(Icons.refresh),
        onPressed: () {
          ref.read(sessionProvider.notifier).loadTransactions();
        },
      ),
      actions: const [WalletSelector()],
    );
  }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    final isBtc = ref.watch(sessionProvider).btcSelected;
    final btcAccount = ref.watch(sessionProvider).currentBtcAccount;

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: CurrencySegementedButton(
            family: "TRANSACTIONS",
            includeAny: false,
          ),
        ),
        Expanded(
          child: Builder(
            builder: (context) {
              if (isBtc) {
                final btcColor = Theme.of(context).colorScheme.btcOrange;

                if (btcAccount == null) {
                  return Center(
                    child: Text("No BTC Account Selected"),
                  );
                }

                return DefaultTabController(
                  length: 2,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          btcAccount.address,
                          style: TextStyle(
                            color: btcColor,
                            fontSize: 16,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
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
                            BtcTransactionList(
                              address: btcAccount.address,
                            ),
                            BtcUtxoList(address: btcAccount.address),
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
                    const TabBar(
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
                          child: const Text("Mined"),
                        ),
                      ],
                    ),
                    Expanded(
                      child: TabBarView(
                        children: [
                          TransactionListType.All,
                          TransactionListType.Pending,
                          TransactionListType.Success,
                          TransactionListType.Failed,
                          TransactionListType.Reserved,
                          TransactionListType.Mined,
                        ].map((type) => TransactionList(type: type)).toList(),
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
