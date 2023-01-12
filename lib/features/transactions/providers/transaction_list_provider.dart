import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/app_constants.dart';
import 'package:rbx_wallet/features/bridge/services/bridge_service.dart';
import 'package:rbx_wallet/features/transactions/models/transaction.dart';
import 'package:rbx_wallet/features/transactions/providers/transaction_signal_provider.dart';
import 'package:rbx_wallet/features/transactions/services/local_transaction_service.dart';

enum TransactionListType {
  All,
  Success,
  Failed,
  Pending,
  Mined,
}

class TransactionListProvider extends StateNotifier<List<Transaction>> {
  final Reader read;
  final TransactionListType type;

  TransactionListProvider(
    this.read,
    this.type, [
    List<Transaction> transactions = const [],
  ]) : super(transactions) {
    load();
  }

  void set(List<Transaction> transactions) {
    state = transactions;
  }

  Future<void> load() async {
    late final List<Transaction> transactions;

    switch (type) {
      case TransactionListType.All:
        transactions = await LocalTransactionService().transactionsAll();
        break;
      case TransactionListType.Success:
        transactions = await LocalTransactionService().transactionsSuccess();
        break;
      case TransactionListType.Failed:
        transactions = await LocalTransactionService().transactionsFailed();
        break;
      case TransactionListType.Pending:
        transactions = await LocalTransactionService().transactionsPending();
        break;
      case TransactionListType.Mined:
        transactions = await LocalTransactionService().transactionsMined();
        break;
    }

    state = transactions;

    if (type == TransactionListType.Success) {
      final recentTimestamp = (DateTime.now().millisecondsSinceEpoch / 1000).round() - (5 * 60); // 5 min
      final recentTransactions = transactions.where((t) => t.timestamp > recentTimestamp).toList();
      read(transactionSignalProvider.notifier).insertAll(recentTransactions);
    }
  }
}

final transactionListProvider = StateNotifierProvider.family<TransactionListProvider, List<Transaction>, TransactionListType>((ref, type) {
  return TransactionListProvider(ref.read, type);
});
