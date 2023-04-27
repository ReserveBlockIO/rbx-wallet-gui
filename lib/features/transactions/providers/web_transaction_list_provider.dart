import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/providers/web_session_provider.dart';
import '../../../core/services/explorer_service.dart';
import '../models/web_transaction.dart';
import 'package:collection/collection.dart';

class WebTransactionListModel {
  final List<WebTransaction> transactions;
  final bool isLoading;

  const WebTransactionListModel({
    this.transactions = const [],
    this.isLoading = false,
  });

  WebTransactionListModel copyWith({
    List<WebTransaction>? transactions,
    bool? isLoading,
  }) {
    return WebTransactionListModel(
      transactions: transactions ?? this.transactions,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

class WebTransactionListProvider extends StateNotifier<WebTransactionListModel> {
  final Ref ref;
  final String address;

  WebTransactionListProvider(
    this.ref,
    this.address, [
    WebTransactionListModel model = const WebTransactionListModel(),
  ]) : super(model) {
    load();
  }

  void set(List<WebTransaction> transactions, bool isLoading) {
    state = state.copyWith(
      transactions: transactions,
      isLoading: isLoading,
    );
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

  Future<void> load([bool invokeLoop = false]) async {
    // final address = ref.read(webSessionProvider).keypair?.public;
    // if (address == null) return;

    state = state.copyWith(isLoading: true);

    final transactions = await loadRecursive(address: address);
    set(transactions, false);

    if (invokeLoop) {
      await Future.delayed(const Duration(seconds: 10));
      checkForNew(address);
    }
  }

  Future<void> checkForNew(String address) async {
    final data = await ExplorerService().getTransactions(
      address: address,
      page: 1,
    );

    final List<WebTransaction> newItems = [];
    for (final tx in data.results) {
      final exists = state.transactions.firstWhereOrNull((t) => t.hash == tx.hash) != null;
      if (!exists) {
        newItems.add(tx);
      }
    }
    if (newItems.isNotEmpty) {
      state = state.copyWith(transactions: [...newItems, ...state.transactions]);
    }

    await Future.delayed(const Duration(seconds: 10));
    checkForNew(address);
  }
}

final webTransactionListProvider = StateNotifierProvider.family<WebTransactionListProvider, WebTransactionListModel, String>((ref, address) {
  return WebTransactionListProvider(ref, address);
});
