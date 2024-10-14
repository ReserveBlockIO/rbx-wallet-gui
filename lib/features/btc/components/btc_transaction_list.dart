import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/btc_transaction_list_provider.dart';
import '../../../core/base_component.dart';
import 'btc_transaction_list_tile.dart';

class BtcTransactionList extends BaseComponent {
  const BtcTransactionList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final transactions = ref.watch(btcTransactionListProvider);

    if (transactions.isEmpty) {
      return Center(
        child: Text("No Transactions"),
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ListView.builder(
        itemCount: transactions.length,
        itemBuilder: (context, index) {
          final transaction = transactions[index];

          return Padding(
            padding: EdgeInsets.only(bottom: index + 1 == transactions.length ? 36 : 12.0),
            child: BtcTransactionListTile(transaction: transaction),
          );
        },
      ),
    );
  }
}
