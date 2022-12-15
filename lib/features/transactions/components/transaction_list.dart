import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/base_component.dart';
import 'package:rbx_wallet/core/providers/session_provider.dart';
import 'package:rbx_wallet/features/transactions/components/transaction_list_tile.dart';
import 'package:rbx_wallet/features/transactions/models/transaction.dart';
import 'package:rbx_wallet/features/transactions/providers/transaction_list_provider.dart';

class TransactionList extends BaseComponent {
  final TransactionListType type;
  const TransactionList({
    Key? key,
    required this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Transaction> transactions = ref.watch(transactionListProvider(type));

    final filtering = ref.watch(sessionProvider).filteringTransactions;

    if (filtering) {
      final currentWalletAddress = ref.read(sessionProvider).currentWallet?.address;
      transactions = transactions
          .where(
            (element) => element.toAddress == currentWalletAddress || element.fromAddress == currentWalletAddress,
          )
          .toList();
    }

    if (transactions.isEmpty) {
      return Center(
        child: Text(
          "No Transactions Found",
          style: Theme.of(context).textTheme.headline5,
        ),
      );
    }

    return ListView.builder(
      itemCount: transactions.length,
      itemBuilder: (context, index) => TransactionListTile(transactions[index]),
    );
  }
}
