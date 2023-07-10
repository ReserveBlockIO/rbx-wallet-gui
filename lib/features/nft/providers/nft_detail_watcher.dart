import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/features/nft/models/nft.dart';
import 'package:rbx_wallet/features/nft/services/nft_service.dart';

final nftDetailWatcher = FutureProvider.family<Nft?, String>((ref, String uid) async {
  return NftService().retrieve(uid);
});
