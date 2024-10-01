import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/features/price/models/price_data.dart';

import '../../../core/services/explorer_service.dart';

final vfxPriceDataDetailProvider = FutureProvider<PriceData?>((ref) async {
  return ExplorerService().retrievePriceData('vfx');
});

final btcPriceDataDetailProvider = FutureProvider<PriceData?>((ref) async {
  return ExplorerService().retrievePriceData('btc');
});
