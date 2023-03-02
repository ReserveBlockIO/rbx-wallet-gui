import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/features/dst/models/listing.dart';
import 'package:rbx_wallet/features/dst/services/dst_service.dart';

final listingDetailProvider = FutureProvider.family<Listing?, int>((ref, int id) async {
  return DstService().retreiveListing(id);
});
