import 'package:flutter_riverpod/flutter_riverpod.dart';

class PendingCallbackProvider extends StateNotifier<List<String>> {
  PendingCallbackProvider() : super([]);

  addHash(String hash) {
    state = [...state, hash];
  }
}

final pendingCallbackProvider = StateNotifierProvider<PendingCallbackProvider, List<String>>(
  (_) => PendingCallbackProvider(),
);
