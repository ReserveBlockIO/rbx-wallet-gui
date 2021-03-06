import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/base_screen.dart';
import 'package:rbx_wallet/core/providers/session_provider.dart';
import 'package:rbx_wallet/features/transactions/components/transaction_list.dart';
import 'package:rbx_wallet/features/wallet/components/wallet_selector.dart';
import 'package:rbx_wallet/features/wallet/providers/wallet_list_provider.dart';

class TransactionsScreen extends BaseScreen {
  const TransactionsScreen({Key? key}) : super(key: key);

  @override
  AppBar? appBar(BuildContext context, WidgetRef ref) {
    return AppBar(
      title: const Text("Your Transactions"),
      backgroundColor: Colors.black12,
      shadowColor: Colors.transparent,
      actions: const [WalletSelector()],
    );
  }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    final filtering = ref.watch(sessionProvider).filteringTransactions;

    return Column(
      children: [
        if (ref.watch(walletListProvider).length > 1)
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Text("Filter by Active Wallet"),
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
        if (ref.read(sessionProvider).blocksAreSyncing)
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "Blocks are still syncing so not all transactions may be visible yet.",
              style: Theme.of(context).textTheme.caption,
            ),
          ),
        const Expanded(child: TransactionList()),
      ],
    );
  }
}
