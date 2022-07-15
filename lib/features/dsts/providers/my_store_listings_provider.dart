import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/services/transaction_service.dart';
import 'package:rbx_wallet/features/store/models/listing.dart';

final myStoreListingProvider = FutureProvider.family<List<Listing>, String>((ref, storeSlug) async {
  return TransactionService().listListings(storeSlug: storeSlug);
});
