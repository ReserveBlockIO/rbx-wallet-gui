import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/base_component.dart';
import 'package:rbx_wallet/core/components/centered_loader.dart';
import 'package:rbx_wallet/core/theme/app_theme.dart';
import 'package:rbx_wallet/features/btc_web/models/btc_web_transaction.dart';

import '../providers/btc_web_transaction_list_provider.dart';
import 'web_btc_transaction_list_tile.dart';

class WebBtcTransactionList extends BaseComponent {
  final String address;
  const WebBtcTransactionList({super.key, required this.address});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.read(btcWebTransactionListProvider(address).notifier);
    final state = ref.watch(btcWebTransactionListProvider(address));

    if (state.processing) {
      return CenteredLoader();
    }

    final transactions = state.results;

    if (transactions.isEmpty) {
      return Center(
        child: Text("No Transactions found for $address."),
      );
    }

    return RefreshIndicator(
      onRefresh: () async {
        await provider.reload();
      },
      child: ListView.builder(
        itemCount: transactions.length,
        itemBuilder: (context, index) {
          final transaction = transactions[index];
          return WebBtcTransactionListTile(transaction: transaction);
        },
      ),
    );
  }
}
