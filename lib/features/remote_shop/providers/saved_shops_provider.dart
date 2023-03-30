import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/features/dst/models/dec_shop.dart';
import 'package:collection/collection.dart';
import '../../../core/singletons.dart';
import '../../../core/storage.dart';

class SavedShopsProvider extends StateNotifier<List<String>> {
  SavedShopsProvider() : super([]) {
    final items = singleton<Storage>().getStringList(Storage.SAVED_SHOPS) ?? [];
    state = items;
  }

  save(DecShop shop) {
    if (state.firstWhereOrNull((url) => url == shop.url) != null) {
      print("Already saved.");
      return;
    }

    final update = [...state, shop.url];
    singleton<Storage>().setStringList(Storage.SAVED_SHOPS, update);
    state = update;
  }

  remove(DecShop shop) {
    if (state.firstWhereOrNull((url) => url == shop.url) == null) {
      print("Doesn't exist.");
      return;
    }

    final update = [...state]..removeWhere((url) => url == shop.url);
    singleton<Storage>().setStringList(Storage.SAVED_SHOPS, update);
    state = update;
  }
}

final savedShopsProvider = StateNotifierProvider<SavedShopsProvider, List<String>>(
  (_) => SavedShopsProvider(),
);
