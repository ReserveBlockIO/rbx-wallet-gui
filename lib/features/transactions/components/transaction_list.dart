import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/base_component.dart';
import '../../../core/providers/session_provider.dart';
import '../models/transaction.dart';
import '../providers/transaction_list_provider.dart';
import 'transaction_list_tile.dart';

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
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      );
    }

    return ListView.builder(
      itemCount: transactions.length,
      itemBuilder: (context, index) => Padding(
        padding: EdgeInsets.only(bottom: index + 1 == transactions.length ? 36 : 12.0),
        child: TransactionListTile(transactions[index]),
      ),
    );
  }
}
