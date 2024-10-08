import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/providers/web_session_provider.dart';
import '../../../core/services/explorer_service.dart';

class WebListedNftsProvider extends StateNotifier<List<String>> {
  final Ref ref;

  WebListedNftsProvider(this.ref) : super([]);

  Future<void> load(String? address) async {
    if (address == null) {
      state = [];
      return;
    }
    state = await ExplorerService().listedNftIds(address);
  }

  Future<void> refresh(String? address) async {
    await load(address);
  }
}

final webListedNftsProvider = StateNotifierProvider<WebListedNftsProvider, List<String>>(
  (ref) => WebListedNftsProvider(ref),
);
