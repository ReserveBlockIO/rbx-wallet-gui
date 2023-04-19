import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/features/dst/services/dst_service.dart';

class ListedNftsProvider extends StateNotifier<List<String>> {
  final Ref ref;

  ListedNftsProvider(this.ref) : super([]) {
    load();
  }

  Future<void> load() async {
    final items = await DstService().listedNftIds();
    if (items != null) {
      state = items;
    }
  }

  void refresh() {
    load();
  }
}

final listedNftsProvider = StateNotifierProvider<ListedNftsProvider, List<String>>(
  (ref) => ListedNftsProvider(ref),
);
