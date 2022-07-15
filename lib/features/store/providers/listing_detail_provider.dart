import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/services/transaction_service.dart';
import 'package:rbx_wallet/features/store/models/listing.dart';

final listingDetailProvider = FutureProvider.family<Listing?, String>((ref, String slug) async {
  return TransactionService().retrieveListing(slug);
});
