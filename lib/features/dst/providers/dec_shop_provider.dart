import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/features/dst/models/dec_shop.dart';
import 'package:rbx_wallet/features/dst/services/dst_service.dart';

final decShopProvider = FutureProvider<DecShop?>((ref) async {
  return DstService().retreiveShop();
});
