import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/services/transaction_service.dart';
import '../../store/models/listing.dart';

final myStoreListingProvider = FutureProvider.family<List<Listing>, String>((ref, storeSlug) async {
  return TransactionService().listListings(storeSlug: storeSlug);
});
