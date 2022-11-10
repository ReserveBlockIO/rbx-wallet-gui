import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/providers/web_session_provider.dart';
import 'package:rbx_wallet/core/services/explorer_service.dart';
import 'package:rbx_wallet/features/transactions/models/web_transaction.dart';

class WebTransactionListProvider extends StateNotifier<List<WebTransaction>> {
  final Reader read;

  WebTransactionListProvider(
    this.read, [
    List<WebTransaction> transactions = const [],
  ]) : super(transactions) {
    load();
  }

  void set(List<WebTransaction> transactions) {
    state = transactions;
  }

  Future<List<WebTransaction>> loadRecursive({
    required String address,
    required bool to,
    int page = 1,
    List<WebTransaction> appendWith = const [],
  }) async {
    final data = await ExplorerService().getTransactions(
      address: address,
      to: to,
      page: page,
    );
    List<WebTransaction> results = [...appendWith, ...data.results];

    //TODO put this back in when filtering works for t/from
    // if (data.page < data.num_pages) {
    //   results = await loadRecursive(address: address, to: to, page: page + 1, appendWith: results);
    // }

    return results;
  }

  Future<void> load() async {
    final address = read(webSessionProvider).keypair?.public;
    if (address == null) return;

    final toTransactions = await loadRecursive(address: address, to: true);
    final fromTransactions = await loadRecursive(address: address, to: false);

    print(toTransactions);
    print("************");

    //TODO: fix sorting based on date
    final transactions = [...toTransactions, ...fromTransactions];
    // final transactions = [...toTransactions, ...fromTransactions]..sort((a, b) => a.timestamp > b.timestamp ? 0 : 1);

    state = transactions;
  }
}

final webTransactionListProvider = StateNotifierProvider<WebTransactionListProvider, List<WebTransaction>>((ref) {
  return WebTransactionListProvider(ref.read);
});
