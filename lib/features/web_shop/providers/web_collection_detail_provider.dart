import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/web_collection.dart';
import '../services/web_shop_service.dart';

final webCollectionDetailProvider = FutureProvider.family<WebCollection?, String>((ref, String identifier) async {
  final parts = identifier.split(",").map((p) => int.tryParse(p)).where((p) => p != null).toList();
  if (parts.length != 2) {
    print("Invalid family identifier");
    return null;
  }
  return WebShopService().retrieveCollection(parts.first!, parts.last!);
});
