import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/base_component.dart';
import '../../../core/theme/colors.dart';
import '../../btc/models/btc_transaction.dart';
import 'transaction_list_tile.dart';
import '../models/transaction.dart';
import '../providers/combined_tx_list_provider.dart';

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
          style: Theme.of(context).textTheme.headlineSmall,
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
                    CardIndicatorVfx(),
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
                    CardIndicatorBtc(),
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
          return null;
        });
  }
}

class CardIndicatorBtc extends StatelessWidget {
  final double verticalPadding;
  const CardIndicatorBtc({super.key, this.verticalPadding = 12.0});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: verticalPadding),
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
    );
  }
}

class CardIndicatorVfx extends StatelessWidget {
  final double verticalPadding;

  const CardIndicatorVfx({super.key, this.verticalPadding = 12.0});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: verticalPadding),
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
    );
  }
}
