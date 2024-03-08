import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/base_component.dart';
import '../providers/btc_transaction_list_provider.dart';
import 'btc_transaction_list_tile.dart';

class BtcTransactionList extends BaseComponent {
  final String address;
  const BtcTransactionList({super.key, required this.address});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final transactions = ref.watch(btcTransactionListProvider(address));

    if (transactions.isEmpty) {
      return Center(
        child: Text("No Transactions for $address"),
      );
    }

    return ListView.builder(
      itemCount: transactions.length,
      itemBuilder: (context, index) {
        final transaction = transactions[index];

        return BtcTransactionListTile(transaction: transaction, address: address);
      },
    );
  }
}
