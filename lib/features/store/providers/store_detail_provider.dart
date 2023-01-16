import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/services/transaction_service.dart';
import '../models/store.dart';

final storeDetailProvider = FutureProvider.family<Store?, String>((ref, String slug) async {
  return TransactionService().retrieveStore(slug);
});
