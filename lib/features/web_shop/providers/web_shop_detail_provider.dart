import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/features/web_shop/models/web_shop.dart';
import 'package:rbx_wallet/features/web_shop/services/web_shop_service.dart';

final webShopDetailProvider = FutureProvider.family<WebShop?, int>((ref, int id) async {
  return WebShopService().retrieveShop(id);
});
