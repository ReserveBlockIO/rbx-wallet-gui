import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/features/dst/models/dec_shop.dart';
import 'package:rbx_wallet/features/remote_shop/services/remote_shop_service.dart';

final remoteShopDetailProvider = FutureProvider.family<DecShop?, String>((ref, String url) async {
  return RemoteShopService().getShopInfo(url);
});
