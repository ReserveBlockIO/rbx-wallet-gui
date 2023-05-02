import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/features/web_shop/models/web_bid.dart';

import '../services/web_shop_service.dart';

final webBidDetailProvider = FutureProvider.family<WebBid?, int>((ref, int id) async {
  return WebShopService().getBid(id);
});
