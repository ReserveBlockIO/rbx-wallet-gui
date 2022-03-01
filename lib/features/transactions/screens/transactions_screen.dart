import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/base_screen.dart';
import 'package:rbx_wallet/core/providers/session_provider.dart';
import 'package:rbx_wallet/features/transactions/components/transaction_list.dart';
import 'package:rbx_wallet/features/wallet/components/wallet_selector.dart';

class TransactionsScreen extends BaseScreen {
  const TransactionsScreen({Key? key}) : super(key: key);

  @override
  AppBar? appBar(BuildContext context, WidgetRef ref) {
    return AppBar(
      title: Text("Transactions"),
      backgroundColor: Colors.black12,
      shadowColor: Colors.transparent,
      actions: [WalletSelector()],
    );
  }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    final filtering = ref.watch(sessionProvider).filteringTransactions;

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text("Filter by Active Wallet"),
            Switch(
              value: filtering,
              inactiveThumbColor: Theme.of(context).colorScheme.primary,
              activeColor: Theme.of(context).colorScheme.secondary,
              onChanged: (val) {
                ref
                    .read(sessionProvider.notifier)
                    .setFilteringTransactions(!filtering);
              },
            ),
          ],
        ),
        Expanded(child: TransactionList()),
      ],
    );
  }
}
