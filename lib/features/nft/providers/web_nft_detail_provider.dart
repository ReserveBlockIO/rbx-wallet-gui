import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/services/explorer_service.dart';
import '../models/nft.dart';

final webNftDetailProvider = FutureProvider.family<Nft?, String>((ref, String id) async {
  return ExplorerService().retrieveNft(id);
});
