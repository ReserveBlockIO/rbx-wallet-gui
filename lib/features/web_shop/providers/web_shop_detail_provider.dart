import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/web_shop.dart';
import '../services/web_shop_service.dart';

final webShopDetailProvider = FutureProvider.family<WebShop?, int>((ref, int id) async {
  return WebShopService().retrieveShop(id);
});
