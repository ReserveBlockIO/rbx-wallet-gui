import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/web_collection.dart';
import '../services/web_shop_service.dart';

class WebCollectionFullListProvider extends StateNotifier<List<WebCollection>> {
  final int shopId;

  Timer? timer;

  WebCollectionFullListProvider(this.shopId, [List<WebCollection> initialItems = const []]) : super(initialItems);

  init() async {
    await fetch(1);
    timer = Timer.periodic(Duration(seconds: 30), (timer) {
      fetch(1);
    });
  }

  pauseTimer() {
    timer?.cancel();
  }

  fetch(int page) async {
    print("Fetching page $page");
    final data = await WebShopService().listCollections(shopId, page);

    if (page == 1) {
      state = data.results;
    } else {
      state = [...state, ...data.results];
    }

    // for (final collection in data.results) {
    //   final currentIndex = state.indexWhere((c) => c.id == collection.id);
    //   if (currentIndex < 0) {
    //     state = [...state, collection];
    //   } else {
    //     state = [...state]
    //       ..removeAt(currentIndex)
    //       ..insert(currentIndex, collection);
    //   }
    // }

    // await Future.delayed(Duration(milliseconds: 300));

    // int stateIndex = 0;
    // for (final collection in state) {
    //   final currentIndex = state.indexWhere((c) => c.id == collection.id);

    //   if (currentIndex < 1) {
    //     state = [...state]..removeAt(stateIndex);
    //   } else {

    //   }

    //   stateIndex += 1;
    // }

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

final webCollectionFullListProvider = StateNotifierProvider.family<WebCollectionFullListProvider, List<WebCollection>, int>(
  (ref, shopId) => WebCollectionFullListProvider(shopId),
);
