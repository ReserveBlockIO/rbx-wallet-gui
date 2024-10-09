// ignore_for_file: unnecessary_const

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/components/currency_segmented_button.dart';
import 'package:rbx_wallet/core/theme/app_theme.dart';
import 'package:rbx_wallet/core/theme/colors.dart';
import 'package:rbx_wallet/features/btc/components/btc_utxo_list.dart';
import 'package:rbx_wallet/core/components/back_to_home_button.dart';

import '../../../core/base_screen.dart';
import '../../../core/providers/currency_segmented_button_provider.dart';
import '../../btc/components/btc_transaction_list.dart';
import '../components/combined_transactions_list.dart';
import '../components/transaction_list.dart';
import '../components/vfx_transaction_filter_button.dart';
import '../providers/transaction_list_provider.dart';

class TransactionsScreen extends BaseScreen {
  const TransactionsScreen({Key? key}) : super(key: key, verticalPadding: 0, horizontalPadding: 0);

  @override
  AppBar? appBar(BuildContext context, WidgetRef ref) {
    final mode = ref.watch(currencySegementedButtonProvider);

    late final String title;
    switch (mode) {
      case CurrencyType.any:
        title = "All Transactions";
        break;
      case CurrencyType.vfx:
        title = "VFX Transactions";
        break;
      case CurrencyType.btc:
        title = "BTC Transactions";
        break;
    }

    return AppBar(
      title: Text(title),
      backgroundColor: Colors.black12,
      shadowColor: Colors.transparent,
      leading: mode == CurrencyType.vfx ? VfxTransactionFilterButton() : null,
      // leading: BackToHomeButton(),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: Align(
            alignment: Alignment.centerRight,
            child: CurrencySegementedButton(
              includeAny: true,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    final mode = ref.watch(currencySegementedButtonProvider);
    final btcColor = Theme.of(context).colorScheme.btcOrange;
    switch (mode) {
      case CurrencyType.btc:
        return DefaultTabController(
          length: 2,
          child: Column(
            children: [
              TabBar(
                indicatorColor: btcColor,
                tabs: [
                  const Tab(
                    child: Text("Transactions"),
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
      case CurrencyType.vfx:
        return DefaultTabController(
          length: 5,
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
                    child: const Text("Vaulted"),
                  ),
                  // const Tab(
                  //   child: const Text("Validated"),
                  // ),
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
                      // TransactionListType.Validated,
                    ].map((type) => TransactionList(type: type)).toList(),
                  ),
                ),
              ),
            ],
          ),
        );
      case CurrencyType.any:
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: CombinedTransactionsList(),
        );
    }
  }
}
