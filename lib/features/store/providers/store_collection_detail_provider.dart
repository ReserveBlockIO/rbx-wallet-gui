import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/services/transaction_service.dart';
import '../models/store_collection.dart';

final storeCollectionDetailProvider = FutureProvider.family<StoreCollection?, String>((ref, String slug) async {
  return TransactionService().retrieveStoreCollection(slug);
});
