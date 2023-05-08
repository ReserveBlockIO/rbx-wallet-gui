import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../dst/models/dec_shop.dart';
import '../services/remote_shop_service.dart';

final remoteShopDetailProvider = FutureProvider.family<DecShop?, String>((ref, String url) async {
  return RemoteShopService().getShopInfo(url);
});
