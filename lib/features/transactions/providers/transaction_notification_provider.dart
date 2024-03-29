import 'package:collection/collection.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/transaction_notification.dart';

class TransactionNotificationProvider extends StateNotifier<List<TransactionNotification>> {
  final Ref ref;

  TransactionNotificationProvider(this.ref) : super([]);

  Future<void> add(TransactionNotification notification, [int seconds = 5]) async {
    if (state.firstWhereOrNull((n) => n.identifier == notification.identifier) == null) {
      state = [...state, notification];

      await Future.delayed(Duration(seconds: seconds));
      remove(notification.identifier);
    }
  }

  remove(String identifier) {
    final updated = [...state]..removeWhere((n) => n.identifier == identifier);
    state = updated;
  }
}

final transactionNotificationProvider = StateNotifierProvider<TransactionNotificationProvider, List<TransactionNotification>>((ref) {
  return TransactionNotificationProvider(ref);
});
