import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/providers/web_session_provider.dart';
import '../../../core/services/explorer_service.dart';

import '../models/web_fungible_token.dart';

class WebTokenListProvider extends StateNotifier<List<WebFungibleTokenBalance>> {
  final Ref ref;
  WebTokenListProvider(this.ref) : super([]);

  Future<void> load(List<String?> addresses) async {
    final List<WebFungibleTokenBalance> tokenBalances = [];

    for (final address in addresses) {
      if (address != null) {
        final balances = await ExplorerService().getTokenBalances(address);
        tokenBalances.addAll(balances);
      }
    }

    state = [...tokenBalances];
  }
}

final webTokenListProvider = StateNotifierProvider<WebTokenListProvider, List<WebFungibleTokenBalance>>((ref) {
  return WebTokenListProvider(ref);
});
