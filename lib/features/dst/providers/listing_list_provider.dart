import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/features/dst/providers/listed_nfts_provider.dart';
import 'package:rbx_wallet/features/dst/services/dst_service.dart';

import '../models/listing.dart';

class ListingListProvider extends StateNotifier<List<Listing>> {
  final Ref ref;
  final storeId;

  ListingListProvider(this.ref, this.storeId, [List<Listing> listings = const []]) : super(listings) {
    load(storeId);
  }

  Future<void> load(int storeId) async {
    state = await DstService().listListings(storeId);
  }

  void refresh() {
    load(storeId);
    ref.read(listedNftsProvider.notifier).refresh();
  }
}

final listingListProvider = StateNotifierProvider.family<ListingListProvider, List<Listing>, int>(
  (ref, storeId) => ListingListProvider(ref, storeId),
);
