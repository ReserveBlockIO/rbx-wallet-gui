import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/features/dst/services/dst_service.dart';

import '../models/listing.dart';

class ListingListProvider extends StateNotifier<List<Listing>> {
  final Ref ref;
  final storeId;

  ListingListProvider(this.ref, this.storeId, [List<Listing> listings = const []]) : super(listings) {
    load(storeId);
  }

  Future<void> load(int storeId) async {
    final data = await DstService().listListings(storeId);

    state = data;

    state = data;
  }

  void refresh() {
    load(storeId);
  }
}

final listingListProvider = StateNotifierProvider.family<ListingListProvider, List<Listing>, int>(
  (ref, storeId) => ListingListProvider(ref, storeId),
);
