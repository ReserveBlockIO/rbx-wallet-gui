import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/services/explorer_service.dart';

import '../models/btc_web_vbtc_token.dart';

class BtcWebVbtcTokenListProvider extends StateNotifier<List<BtcWebVbtcToken>> {
  final Ref ref;

  BtcWebVbtcTokenListProvider(this.ref) : super([]) {
    // load();
  }

  Future<void> load(String vfxAddress) async {
    final transactions = await ExplorerService().getWebVbtcTokens(vfxAddress);
    state = transactions;
  }

  Future<void> reload(String vfxAddress) async {
    await load(vfxAddress);
  }
}

final btcWebVbtcTokenListProvider = StateNotifierProvider<BtcWebVbtcTokenListProvider, List<BtcWebVbtcToken>>((ref) {
  return BtcWebVbtcTokenListProvider(ref);
});
