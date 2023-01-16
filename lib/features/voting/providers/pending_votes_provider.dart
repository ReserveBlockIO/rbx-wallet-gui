import 'package:flutter_riverpod/flutter_riverpod.dart';

class PendingVotesProvider extends StateNotifier<List<String>> {
  PendingVotesProvider() : super([]);

  addId(String id) {
    state = [...state, id];
  }
}

final pendingVotesProvider = StateNotifierProvider<PendingVotesProvider, List<String>>(
  (_) => PendingVotesProvider(),
);
