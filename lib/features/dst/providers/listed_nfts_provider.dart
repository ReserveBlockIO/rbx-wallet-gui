import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../services/dst_service.dart';

class ListedNftsProvider extends StateNotifier<List<String>> {
  final Ref ref;

  ListedNftsProvider(this.ref) : super([]) {
    load();
  }

  Future<void> load() async {
    state = await DstService().listedNftIds();
  }

  void refresh() {
    load();
  }
}

final listedNftsProvider = StateNotifierProvider<ListedNftsProvider, List<String>>(
  (ref) => ListedNftsProvider(ref),
);
