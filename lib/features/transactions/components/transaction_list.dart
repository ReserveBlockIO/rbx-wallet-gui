import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/base_component.dart';
import '../../../core/providers/session_provider.dart';
import '../models/transaction.dart';
import '../providers/transaction_list_provider.dart';
import '../providers/vfx_transaction_filter_provider.dart';
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

    final filters = ref.watch(vfxTransactionFilterProvider);

    final filteringByAddress = filters.address.isNotEmpty;

    if (filteringByAddress) {
      transactions = transactions
          .where(
            (element) => element.toAddress == filters.address || element.fromAddress == filters.address,
          )
          .toList();
    }

    if (filters.txTypes.isNotEmpty) {
      transactions = transactions.where((t) => filters.txTypes.contains(t.type)).toList();
    }

    if (transactions.isEmpty) {
      return Center(
        child: Text(
          filteringByAddress || filters.txTypes.isNotEmpty ? "No Transactions Found\n[with current filters]" : "No Transactions Found",
          style: TextStyle(
            fontSize: 14,
            height: 1.2,
            fontWeight: FontWeight.w400,
          ),
          textAlign: TextAlign.center,
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
