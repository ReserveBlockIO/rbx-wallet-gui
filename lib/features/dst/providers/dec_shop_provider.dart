import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/dec_shop.dart';
import '../services/dst_service.dart';

final decShopProvider = FutureProvider<DecShop?>((ref) async {
  if (kIsWeb) {
    return null;
  }
  return DstService().retreiveShop();
});
