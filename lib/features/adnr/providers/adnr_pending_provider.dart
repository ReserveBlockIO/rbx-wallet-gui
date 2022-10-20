import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/singletons.dart';
import 'package:rbx_wallet/core/storage.dart';

class AdnrPendingProvider extends StateNotifier<List<String>> {
  AdnrPendingProvider() : super([]) {
    final items = singleton<Storage>().getStringList(Storage.PENDING_ADNRS) ?? [];
    state = items;
  }

  addId(String id) {
    final update = [...state, id];
    singleton<Storage>().setStringList(Storage.PENDING_ADNRS, update);
    state = update;
  }
}

final adnrPendingProvider = StateNotifierProvider<AdnrPendingProvider, List<String>>(
  (_) => AdnrPendingProvider(),
);
