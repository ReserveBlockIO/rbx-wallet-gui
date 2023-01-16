import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/transaction_notification.dart';

import 'package:collection/collection.dart';

class TransactionNotificationProvider extends StateNotifier<List<TransactionNotification>> {
  final Reader read;

  TransactionNotificationProvider(this.read) : super([]);

  Future<void> add(TransactionNotification notification, [bool persist = false]) async {
    if (state.firstWhereOrNull((n) => n.identifier == notification.identifier) == null) {
      state = [...state, notification];

      if (!persist) {
        await Future.delayed(const Duration(seconds: 5));
        remove(notification.identifier);
      }
    }
  }

  remove(String identifier) {
    final updated = [...state]..removeWhere((n) => n.identifier == identifier);
    state = updated;
  }
}

final transactionNotificationProvider = StateNotifierProvider<TransactionNotificationProvider, List<TransactionNotification>>((ref) {
  return TransactionNotificationProvider(ref.read);
});
