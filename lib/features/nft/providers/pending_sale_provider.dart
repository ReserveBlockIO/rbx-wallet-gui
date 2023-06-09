import 'package:flutter_riverpod/flutter_riverpod.dart';

class PendingSaleProvider extends StateNotifier<List<String>> {
  PendingSaleProvider() : super([]);

  addHash(String hash) {
    state = [...state, hash];
  }
}

final pendingSaleProvider = StateNotifierProvider<PendingSaleProvider, List<String>>(
  (_) => PendingSaleProvider(),
);
