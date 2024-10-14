import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/nft.dart';
import '../services/nft_service.dart';

final nftDetailWatcher = FutureProvider.family<Nft?, String>((ref, String uid) async {
  return NftService().retrieve(uid);
});
