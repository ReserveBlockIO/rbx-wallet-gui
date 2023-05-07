import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/features/web_shop/models/web_shop.dart';

import '../services/web_shop_service.dart';

class WebShopFullListProvider extends StateNotifier<List<WebShop>> {
  final Ref ref;
  Timer? timer;

  WebShopFullListProvider(this.ref, [List<WebShop> initialItems = const []]) : super(initialItems);

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
    final data = await WebShopService().listShops(page: page, myShops: false);

    if (page == 1) {
      state = data.results;
    } else {
      state = [...state, ...data.results];
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

final webShopFullListProvider = StateNotifierProvider<WebShopFullListProvider, List<WebShop>>(
  (ref) => WebShopFullListProvider(ref),
);
