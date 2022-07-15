import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/services/transaction_service.dart';
import 'package:rbx_wallet/features/store/models/store_collection.dart';

final storeCollectionDetailProvider = FutureProvider.family<StoreCollection?, String>((ref, String slug) async {
  return TransactionService().retrieveStoreCollection(slug);
});
