import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/features/bridge/services/bridge_service.dart';
import 'package:rbx_wallet/features/transactions/models/transaction.dart';

class TransactionListProvider extends StateNotifier<List<Transaction>> {
  final Reader read;

  TransactionListProvider(
    this.read, [
    List<Transaction> transactions = const [],
  ]) : super(transactions) {
    load();
  }

  void set(List<Transaction> transactions) {
    state = transactions;
  }

  Future<void> load() async {
    final transactions = await BridgeService().transactions();

    if (transactions != null) {
      state = transactions;
    }
  }
}

final transactionListProvider =
    StateNotifierProvider<TransactionListProvider, List<Transaction>>((ref) {
  return TransactionListProvider(ref.read);
});
