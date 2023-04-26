import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/features/dst/providers/listed_nfts_provider.dart';
import 'package:rbx_wallet/features/dst/services/dst_service.dart';

import '../models/listing.dart';

class ListingListProvider extends StateNotifier<List<Listing>> {
  final Ref ref;
  final collectionId;

  ListingListProvider(this.ref, this.collectionId, [List<Listing> listings = const []]) : super(listings) {
    load(collectionId);
  }

  Future<void> load(int collectionId) async {
    print("Getting collections");
    state = await DstService().listListings(collectionId);
  }

  void refresh() {
    load(collectionId);
    ref.read(listedNftsProvider.notifier).refresh();
  }
}

final listingListProvider = StateNotifierProvider.family<ListingListProvider, List<Listing>, int>(
  (ref, collectionId) => ListingListProvider(ref, collectionId),
);
