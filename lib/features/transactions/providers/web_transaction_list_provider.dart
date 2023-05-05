import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/features/transactions/providers/transaction_signal_provider.dart';

import '../../../core/providers/web_session_provider.dart';
import '../../../core/services/explorer_service.dart';
import '../models/web_transaction.dart';
import 'package:collection/collection.dart';

class WebTransactionListModel {
  final List<WebTransaction> transactions;
  final bool isLoading;
  final bool canLoadMore;

  const WebTransactionListModel({
    this.transactions = const [],
    this.isLoading = false,
    this.canLoadMore = true,
  });

  WebTransactionListModel copyWith({
    List<WebTransaction>? transactions,
    bool? isLoading,
    bool? canLoadMore,
  }) {
    return WebTransactionListModel(
      transactions: transactions ?? this.transactions,
      isLoading: isLoading ?? this.isLoading,
      canLoadMore: canLoadMore ?? this.canLoadMore,
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
  ]) : super(model);

  init() {
    load(address: address, page: 1, invokeLoop: true);
  }

  Future<void> load({
    required String address,
    required int page,
    required bool invokeLoop,
  }) async {
    state = state.copyWith(isLoading: true);
    final data = await ExplorerService().getTransactions(
      address: address,
      page: page,
    );

    state = state.copyWith(
      transactions: [...state.transactions, ...data.results],
      isLoading: false,
      canLoadMore: data.num_pages > data.page,
    );

    if (invokeLoop) {
      await Future.delayed(const Duration(seconds: 10));
      checkForNew(address);
    }
  }

  Future<void> refresh() async {
    state = state.copyWith(isLoading: true, transactions: []);
    load(address: address, page: 1, invokeLoop: false);
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
      for (final tx in newItems) {
        handleNewTx(tx);
      }
    }

    await Future.delayed(const Duration(seconds: 10));
    checkForNew(address);
  }

  void handleNewTx(WebTransaction tx) {
    ref.read(transactionSignalProvider.notifier).insert(tx.toNative());
  }
}

final webTransactionListProvider = StateNotifierProvider.family<WebTransactionListProvider, WebTransactionListModel, String>((ref, address) {
  return WebTransactionListProvider(ref, address);
});
