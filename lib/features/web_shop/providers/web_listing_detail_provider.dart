import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/web_listing.dart';
import '../services/web_shop_service.dart';

final webListingDetailProvider = FutureProvider.family<WebListing?, String>((ref, String identifier) async {
  final parts = identifier.split(",").map((p) => int.tryParse(p)).where((p) => p != null).toList();
  if (parts.length != 3) {
    print("Invalid family identifier");
    return null;
  }
  return WebShopService().retrieveListing(parts[0]!, parts[1]!, parts[2]!);
});
