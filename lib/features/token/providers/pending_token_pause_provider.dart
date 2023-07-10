import 'package:flutter_riverpod/flutter_riverpod.dart';

class PendingTokenPauseProvider extends StateNotifier<List<String>> {
  PendingTokenPauseProvider() : super([]);

  addId(String id) {
    state = [...state, id];
  }

  removeId(String id) {
    state = [...state]..removeWhere((i) => i == id);
  }
}

final pendingTokenPauseProvider = StateNotifierProvider<PendingTokenPauseProvider, List<String>>(
  (_) => PendingTokenPauseProvider(),
);
