import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/features/nft/models/nft.dart';
import 'package:rbx_wallet/features/nft/services/nft_service.dart';
import 'package:rbx_wallet/features/wallet/providers/wallet_list_provider.dart';

class MintedNftListProvider extends StateNotifier<List<Nft>> {
  final Reader read;

  MintedNftListProvider(
    this.read, [
    List<Nft> nfts = const [],
  ]) : super(nfts) {
    load();
  }

  Future<void> load() async {
    final nfts = await NftService().minted();
    state = nfts.where((nft) => nft.manageable == true).toList();
  }
}

final mintedNftListProvider =
    StateNotifierProvider<MintedNftListProvider, List<Nft>>(
  (ref) => MintedNftListProvider(ref.read),
);
