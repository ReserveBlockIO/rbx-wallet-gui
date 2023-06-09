import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/singletons.dart';
import '../../../core/storage.dart';

class SaleProvider extends StateNotifier<List<String>> {
  SaleProvider() : super([]);

  addId(String id) {
    final update = [...state, id];
    singleton<Storage>().setStringList(Storage.TRANSFERRED_NFT_IDS, update);
    state = update;
  }

  removeId(String id) {
    final update = [...state]..removeWhere((_id) => id == _id);
    singleton<Storage>().setStringList(Storage.TRANSFERRED_NFT_IDS, update);
    state = update;
  }

  clear() {
    state = [];
  }
}

final saleProvider = StateNotifierProvider<SaleProvider, List<String>>(
  (_) => SaleProvider(),
);
