import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/base_component.dart';
import 'package:rbx_wallet/core/theme/colors.dart';
import 'package:rbx_wallet/features/btc/models/btc_transaction.dart';
import 'package:rbx_wallet/features/transactions/components/transaction_list_tile.dart';
import 'package:rbx_wallet/features/transactions/models/transaction.dart';
import 'package:rbx_wallet/features/transactions/providers/combined_tx_list_provider.dart';

import '../../btc/components/btc_transaction_list_tile.dart';

class CombinedTransactionsList extends BaseComponent {
  const CombinedTransactionsList({super.key});

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    final transactions = ref.watch(combinedTxListProvider);
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
        itemBuilder: (context, index) {
          final tx = transactions[index];

          if (tx is Transaction) {
            return Padding(
              padding: EdgeInsets.only(bottom: index + 1 == transactions.length ? 36 : 12.0),
              child: IntrinsicHeight(
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: Container(
                        width: 6,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            stops: [0, .8],
                            colors: [
                              AppColors.getBlue(ColorShade.s100),
                              AppColors.getBlue(ColorShade.s200),
                            ],
                          ),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(4),
                            bottomLeft: Radius.circular(4),
                          ),
                        ),
                      ),
                    ),
                    Expanded(child: TransactionListTile(tx)),
                  ],
                ),
              ),
            );
          }

          if (tx is BtcTransaction) {
            return Padding(
              padding: EdgeInsets.only(bottom: index + 1 == transactions.length ? 36 : 12.0),
              child: IntrinsicHeight(
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: Container(
                        width: 6,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            stops: [0, .8],
                            colors: [
                              AppColors.getBtc(),
                              AppColors.getBtcSubtle(),
                            ],
                          ),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(4),
                            bottomLeft: Radius.circular(4),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: BtcTransactionListTile(
                        transaction: tx,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
        });
  }
}
