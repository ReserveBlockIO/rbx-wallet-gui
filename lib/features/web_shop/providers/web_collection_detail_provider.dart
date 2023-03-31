import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/features/web_shop/models/web_collection.dart';
import 'package:rbx_wallet/features/web_shop/services/web_shop_service.dart';

final webCollectionDetailProvider = FutureProvider.family<WebCollection?, String>((ref, String identifier) async {
  return WebShopService().retrieveCollection(int.parse(identifier.split(',')[0]), int.parse(identifier.split(',')[1]));
});
