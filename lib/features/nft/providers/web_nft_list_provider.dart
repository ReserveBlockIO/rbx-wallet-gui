import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/services/explorer_service.dart';
import 'package:rbx_wallet/features/nft/models/nft.dart';

class WebNftListProvider extends StateNotifier<List<Nft>> {
  final Reader read;

  WebNftListProvider(
    this.read, [
    List<Nft> nfts = const [],
  ]) : super(nfts) {
    load();
  }

  Future<void> load() async {
    final nfts = await ExplorerService().listNfts();
    state = nfts;
  }
}

final webnftListProvider = StateNotifierProvider<WebNftListProvider, List<Nft>>(
  (ref) => WebNftListProvider(ref.read),
);
