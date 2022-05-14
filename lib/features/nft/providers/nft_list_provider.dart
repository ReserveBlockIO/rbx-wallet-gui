import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/features/nft/models/nft.dart';
import 'package:rbx_wallet/features/nft/services/nft_service.dart';

class NftListProvider extends StateNotifier<List<Nft>> {
  final Reader read;

  NftListProvider(
    this.read, [
    List<Nft> nfts = const [],
  ]) : super(nfts) {
    load();
  }

  Future<void> load() async {
    final nfts = await NftService().list();
    state = nfts;
  }
}

final nftListProvider = StateNotifierProvider<NftListProvider, List<Nft>>(
  (ref) => NftListProvider(ref.read),
);
