import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/services/transaction_service.dart';
import 'package:rbx_wallet/features/nft/models/nft.dart';
import 'package:rbx_wallet/features/nft/services/nft_service.dart';
import 'package:rbx_wallet/features/smart_contracts/providers/asset_location_provider.dart';

class NftListProvider extends StateNotifier<List<Nft>> {
  final Reader read;
  final dynamic refresh;

  NftListProvider(
    this.read,
    this.refresh, [
    List<Nft> nfts = const [],
  ]) : super(nfts) {
    load();
  }

  Future<void> load([String? email, String? address]) async {
    final nfts = kIsWeb ? await TransactionService().listNfts(email ?? "", address ?? "") : await NftService().list();
    state = nfts;

    for (final nft in nfts) {
      refresh(assetLocationProvider(nft.primaryAsset.locationData(nft.id)));
    }
  }
}

final nftListProvider = StateNotifierProvider<NftListProvider, List<Nft>>(
  (ref) => NftListProvider(ref.read, ref.refresh),
);
