import 'package:flutter_riverpod/flutter_riverpod.dart';

class RemoteShopExpandedListingsProvider extends StateNotifier<List<String>> {
  final Ref ref;

  RemoteShopExpandedListingsProvider(this.ref) : super([]);

  void add(String id) {
    state = [...state, id];
  }

  void remove(String id) {
    state = [...state]..removeWhere((listing) => listing == id);
  }

  void clear() {
    state = [];
  }
}

final remoteShopExpandedListingsProvider = StateNotifierProvider<RemoteShopExpandedListingsProvider, List<String>>(
  (ref) => RemoteShopExpandedListingsProvider(ref),
);
