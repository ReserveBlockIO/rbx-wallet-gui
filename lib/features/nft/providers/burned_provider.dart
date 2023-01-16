import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/singletons.dart';
import '../../../core/storage.dart';

class BurnedProvider extends StateNotifier<List<String>> {
  BurnedProvider() : super([]) {
    final items = singleton<Storage>().getStringList(Storage.BURNED_NFT_IDS) ?? [];
    state = items;
  }

  addId(String id) {
    final update = [...state, id];
    singleton<Storage>().setStringList(Storage.BURNED_NFT_IDS, update);
    state = update;
  }
}

final burnedProvider = StateNotifierProvider<BurnedProvider, List<String>>(
  (_) => BurnedProvider(),
);
