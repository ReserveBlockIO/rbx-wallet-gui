import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/providers/web_session_provider.dart';
import '../../../core/services/explorer_service.dart';
import '../models/web_transaction.dart';

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
    int page = 1,
    List<WebTransaction> appendWith = const [],
  }) async {
    final data = await ExplorerService().getTransactions(
      address: address,
      page: page,
    );
    List<WebTransaction> results = [...appendWith, ...data.results];

    if (data.page < data.num_pages) {
      results = await loadRecursive(address: address, page: page + 1, appendWith: results);
    }

    return results;
  }

  Future<void> load() async {
    final address = read(webSessionProvider).keypair?.public;
    if (address == null) return;

    final transactions = await loadRecursive(address: address);
    state = transactions;
  }
}

final webTransactionListProvider = StateNotifierProvider<WebTransactionListProvider, List<WebTransaction>>((ref) {
  return WebTransactionListProvider(ref.read);
});
