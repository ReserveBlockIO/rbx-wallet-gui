import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/providers/web_session_provider.dart';
import '../../../core/services/explorer_service.dart';
import '../../dst/services/dst_service.dart';

class WebListedNftsProvider extends StateNotifier<List<String>> {
  final Ref ref;

  WebListedNftsProvider(this.ref) : super([]) {
    load();
  }

  Future<void> load() async {
    final address = ref.read(webSessionProvider).keypair?.address;
    if (address == null) {
      state = [];
      return;
    }
    state = await ExplorerService().listedNftIds(address);
  }

  Future<void> refresh() async {
    await load();
  }
}

final webListedNftsProvider = StateNotifierProvider<WebListedNftsProvider, List<String>>(
  (ref) => WebListedNftsProvider(ref),
);
