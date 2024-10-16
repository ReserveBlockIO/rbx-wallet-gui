import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/components/currency_segmented_button.dart';
import '../../../core/providers/session_provider.dart';
import '../../btc/components/btc_transaction_list_tile.dart';
import '../../btc/providers/btc_transaction_list_provider.dart';
import '../../../core/theme/app_theme.dart';

import '../../../core/base_component.dart';
import '../../../core/components/buttons.dart';
import '../../transactions/components/transaction_list_tile.dart';
import '../../transactions/providers/transaction_list_provider.dart';

class TransactionWindow extends BaseComponent {
  const TransactionWindow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final transactions = ref.watch(transactionListProvider(TransactionListType.All));

    final recentTransactions = transactions.take(5).toList();
    final recentBtcTranscations = ref.watch(btcTransactionListProvider).take(5).toList();

    final isBtc = ref.watch(sessionProvider.select((v) => v.btcSelected));

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Recent Transactions",
              style: Theme.of(context).textTheme.titleSmall,
            ),
            CurrencySegementedButton(
              includeAny: false,
            ),
          ],
        ),
        const SizedBox(height: 12),
        isBtc
            ? Container(
                decoration: BoxDecoration(
                  boxShadow: glowingBox,
                  color: Colors.black,
                ),
                height: MediaQuery.of(context).size.height * 0.4,
                width: double.infinity,
                child: recentBtcTranscations.isEmpty
                    ? Center(
                        child: Text(
                          "No BTC Transactions Found",
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                      )
                    : ListView.builder(
                        itemCount: recentBtcTranscations.length,
                        itemBuilder: (context, index) {
                          final tx = recentBtcTranscations[index];
                          return Padding(
                            padding: EdgeInsets.only(bottom: index + 1 == recentBtcTranscations.length ? 36 : 12.0),
                            child: BtcTransactionListTile(transaction: tx),
                          );
                        },
                      ),
              )
            : Container(
                decoration: BoxDecoration(
                  boxShadow: glowingBox,
                  color: Colors.black,
                ),
                height: MediaQuery.of(context).size.height * 0.4,
                width: double.infinity,
                child: recentTransactions.isEmpty
                    ? Center(
                        child: Text(
                          "No VFX Transactions Found",
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                      )
                    : SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: recentTransactions
                              .map((tx) => TransactionListTile(
                                    tx,
                                    compact: true,
                                  ))
                              .toList(),
                        ),
                      ),
              ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: AppButton(
              label: "View All",
              onPressed: () {
                final tabsRouter = AutoTabsRouter.of(context);
                tabsRouter.setActiveIndex(3);
              },
            ),
          ),
        )
      ],
    );
  }
}
