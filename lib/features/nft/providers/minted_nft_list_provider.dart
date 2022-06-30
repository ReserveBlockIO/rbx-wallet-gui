import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/features/nft/models/nft.dart';
import 'package:rbx_wallet/features/nft/services/nft_service.dart';

class MintedNftListProvider extends StateNotifier<List<Nft>> {
  final Reader read;

  MintedNftListProvider(
    this.read, [
    List<Nft> nfts = const [],
  ]) : super(nfts) {
    load();
  }

  Future<void> load() async {
    // REMOVING THE SAVED STUFF for now at least...

    // final saved = (await NftService().getSaved())
    //     .where((nft) => nft.manageable == true && nft.isPublished)
    //     .toList();
    final nfts = (await NftService().minted())
        .where((nft) => nft.manageable == true && nft.isPublished)
        .toList();

    List<Nft> output = [...nfts];
    // for (final s in saved) {
    //   final exists = nfts.firstWhereOrNull((n) => n.id == s.id) != null;
    //   if (!exists) {
    //     output.add(s);
    //   }
    // }

    state = output;
  }
}

final mintedNftListProvider =
    StateNotifierProvider<MintedNftListProvider, List<Nft>>(
  (ref) => MintedNftListProvider(ref.read),
);
