import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/services/explorer_service.dart';

import '../models/btc_web_vbtc_token.dart';

final btcWebVbtcTokenDetailProvider = FutureProvider.family<BtcWebVbtcToken?, String>((ref, arg) async {
  return ExplorerService().getWebVbtcTokenDetail(arg);
});
