import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/services/explorer_service.dart';

import '../models/web_fungible_token.dart';

final webTokenDetailProvider = FutureProvider.family<WebFungibleTokenDetail?, String>((ref, String scId) async {
  return ExplorerService().retrieveToken(scId);
});
