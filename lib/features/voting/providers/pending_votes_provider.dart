import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/singletons.dart';
import 'package:rbx_wallet/core/storage.dart';

class PendingVotesProvider extends StateNotifier<List<String>> {
  PendingVotesProvider() : super([]);

  addId(String id) {
    state = [...state, id];
  }
}

final pendingVotesProvider = StateNotifierProvider<PendingVotesProvider, List<String>>(
  (_) => PendingVotesProvider(),
);
