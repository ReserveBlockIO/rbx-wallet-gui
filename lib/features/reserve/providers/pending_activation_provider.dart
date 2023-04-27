import 'package:flutter_riverpod/flutter_riverpod.dart';

class PendingActivationProvider extends StateNotifier<List<String>> {
  PendingActivationProvider() : super([]);

  addId(String id) {
    state = [...state, id];
  }
}

final pendingActivationProvider = StateNotifierProvider<PendingActivationProvider, List<String>>(
  (_) => PendingActivationProvider(),
);
