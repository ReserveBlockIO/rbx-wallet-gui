import '../../btc/providers/btc_transaction_list_provider.dart';
import '../models/transaction.dart';
import 'transaction_list_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../btc/models/btc_transaction.dart';

part 'combined_tx_list_provider.g.dart';

@Riverpod(keepAlive: true)
List<Object> combinedTxList(CombinedTxListRef ref) {
  final vfxTransactions = ref.watch(transactionListProvider(TransactionListType.All)).where((tx) => tx.fromAddress != 'Coinbase_BlkRwd').toList();

  final btcTransactions = ref.watch(btcTransactionListProvider);

  final combined = [...vfxTransactions, ...btcTransactions];

  combined.sort((a, b) {
    late final int timestampA;
    late final int timestampB;

    if (a is Transaction) {
      timestampA = a.timestamp;
    } else if (a is BtcTransaction) {
      timestampA = a.timestamp;
    }

    if (b is Transaction) {
      timestampB = b.timestamp;
    } else if (b is BtcTransaction) {
      timestampB = b.timestamp;
    }

    return timestampA > timestampB ? -1 : 1;
  });
  return combined;
}
