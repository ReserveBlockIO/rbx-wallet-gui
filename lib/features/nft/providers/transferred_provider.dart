import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/singletons.dart';
import '../../../core/storage.dart';

class TransferredProvider extends StateNotifier<List<String>> {
  TransferredProvider() : super([]) {
    final items = singleton<Storage>().getStringList(Storage.TRANSFERRED_NFT_IDS) ?? [];
    state = items;
  }

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
}

final transferredProvider = StateNotifierProvider<TransferredProvider, List<String>>(
  (_) => TransferredProvider(),
);
