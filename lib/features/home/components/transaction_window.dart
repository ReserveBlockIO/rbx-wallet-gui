import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/base_component.dart';
import 'package:rbx_wallet/core/components/buttons.dart';
import 'package:rbx_wallet/features/transactions/components/transaction_list_tile.dart';
import 'package:rbx_wallet/features/transactions/providers/transaction_list_provider.dart';

class TransactionWindow extends BaseComponent {
  const TransactionWindow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final transactions = ref.watch(transactionListProvider(TransactionListType.All));

    final recentTransactions = transactions.take(5);

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Your Recent Transactions",
          style: Theme.of(context).textTheme.subtitle2,
        ),
        const SizedBox(height: 8),
        Card(
          margin: EdgeInsets.zero,
          child: SizedBox(
            height: 200,
            width: double.infinity,
            child: recentTransactions.isEmpty
                ? Center(
                    child: Text(
                      "No Transactions Found",
                      style: Theme.of(context).textTheme.headline5,
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
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
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
