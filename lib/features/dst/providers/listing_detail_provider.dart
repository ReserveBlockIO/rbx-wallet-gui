import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/listing.dart';
import '../services/dst_service.dart';

final listingDetailProvider = FutureProvider.family<Listing?, int>((ref, int id) async {
  return DstService().retreiveListing(id);
});
