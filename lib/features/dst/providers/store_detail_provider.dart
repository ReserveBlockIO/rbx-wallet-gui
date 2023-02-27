import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/features/dst/models/store.dart';
import 'package:rbx_wallet/features/dst/services/dst_service.dart';

final storeDetailProvider = FutureProvider.family<Store?, int>((ref, int id) async {
  return DstService().retreiveStore(id);
});
