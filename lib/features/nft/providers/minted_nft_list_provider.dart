import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/providers/web_session_provider.dart';
import 'package:rbx_wallet/core/services/transaction_service.dart';
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
    final nfts = kIsWeb
        ? (await TransactionService().listMintedNfts(read(webSessionProvider).keypair!.email, read(webSessionProvider).keypair!.public))
        : (await NftService().minted()).where((nft) => nft.manageable == true).toList();

    // List<Nft> output = kIsWeb ? [...nfts] : [...nfts];

    // if (!kIsWeb) {
    //   for (final nft in nfts) {
    //     final n = await NftService().retrieve(nft.id);

    //     if (n != null) {
    //       output.add(n);
    //     }
    //   }
    // }

    state = nfts;
  }
}

final mintedNftListProvider = StateNotifierProvider<MintedNftListProvider, List<Nft>>(
  (ref) => MintedNftListProvider(ref.read),
);
