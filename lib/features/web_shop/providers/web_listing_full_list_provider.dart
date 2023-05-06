import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/features/web_shop/models/web_listing.dart';
import 'package:rbx_wallet/features/web_shop/services/web_shop_service.dart';

class WebListingFullListProvider extends StateNotifier<List<WebListing>> {
  final int shopId;
  final int collectionId;

  Timer? timer;

  WebListingFullListProvider(this.shopId, this.collectionId, [List<WebListing> initialItems = const []]) : super(initialItems);

  init() async {
    await fetch(1);
    timer = Timer.periodic(Duration(seconds: 5), (timer) {
      fetch(1);
    });
  }

  pauseTimer() {
    timer?.cancel();
  }

  fetch(int page) async {
    print("Fetching page $page");
    final data = await WebShopService().listListings(shopId, collectionId, page);

    for (final listing in data.results) {
      final currentIndex = state.indexWhere((l) => l.id == listing.id);
      if (currentIndex < 0) {
        state = [...state, listing];
      } else {
        state = [...state]
          ..removeAt(currentIndex)
          ..insert(currentIndex, listing);
      }
    }

    if (data.page < data.num_pages) {
      fetch(page + 1);
    }
  }

  reload() {
    state = [];
    timer?.cancel();
    init();
  }
}

final webListingFullListProvider = StateNotifierProvider.family<WebListingFullListProvider, List<WebListing>, String>(
  (ref, identifier) => WebListingFullListProvider(int.parse(identifier.split(',')[0]), int.parse(identifier.split(',')[1])),
);
