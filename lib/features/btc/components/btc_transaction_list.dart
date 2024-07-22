import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/features/btc/providers/btc_transaction_list_provider.dart';
import 'package:rbx_wallet/features/btc/providers/combined_btc_transaction_list_provider.dart';
import '../../../core/base_component.dart';
import 'btc_transaction_list_tile.dart';

class BtcTransactionList extends BaseComponent {
  const BtcTransactionList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final transactions = ref.watch(btcTransactionListProvider);

    return ListView.builder(
      itemCount: transactions.length,
      itemBuilder: (context, index) {
        final transaction = transactions[index];

        return BtcTransactionListTile(transaction: transaction, address: transaction.fromAddress);
      },
    );
  }
}
