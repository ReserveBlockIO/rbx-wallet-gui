import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/services/transaction_service.dart';
import 'package:rbx_wallet/features/store/models/store.dart';

final storeDetailProvider = FutureProvider.family<Store?, String>((ref, String slug) async {
  return TransactionService().retrieveStore(slug);
});
