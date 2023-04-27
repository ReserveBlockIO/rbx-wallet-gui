import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/features/dst/services/dst_service.dart';

import '../models/collection.dart';

final storeDetailProvider = FutureProvider.family<Collection?, int>((ref, int id) async {
  return DstService().retreiveCollection(id);
});
