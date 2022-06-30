import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/services/explorer_service.dart';
import 'package:rbx_wallet/features/nft/models/nft.dart';

final webNftDetailProvider =
    FutureProvider.family<Nft?, String>((ref, String id) async {
  return ExplorerService().retrieveNft(id);
});
