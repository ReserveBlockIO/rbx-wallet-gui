import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/web_listing.dart';
import '../services/web_shop_service.dart';

class WebListingFullListProvider extends StateNotifier<List<WebListing>> {
  final int shopId;
  final int collectionId;

  Timer? timer;

  WebListingFullListProvider(this.shopId, this.collectionId, [List<WebListing> initialItems = const []]) : super(initialItems);

  init() async {
    await fetch(1);
    timer = Timer.periodic(Duration(seconds: 30), (timer) {
      fetch(1);
    });
  }

  pauseTimer() {
    timer?.cancel();
  }

  fetch([int page = 1]) async {
    print("Fetching page $page");
    final data = await WebShopService().listListings(shopId, collectionId, page);

    if (page == 1) {
      state = data.results;
    } else {
      state = [...state, ...data.results];
    }

    if (data.page < data.num_pages) {
      fetch(page + 1);
    }
  }

  reload() async {
    state = [];

    await Future.delayed(Duration(milliseconds: 200));

    timer?.cancel();
    init();
  }
}

final webListingFullListProvider = StateNotifierProvider.family<WebListingFullListProvider, List<WebListing>, String>(
  (ref, identifier) => WebListingFullListProvider(int.parse(identifier.split(',')[0]), int.parse(identifier.split(',')[1])),
);
