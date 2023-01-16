import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/services/transaction_service.dart';
import '../models/listing.dart';

final listingDetailProvider = FutureProvider.family<Listing?, String>((ref, String slug) async {
  return TransactionService().retrieveListing(slug);
});
