import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:rbx_wallet/features/web_shop/models/web_shop.dart';

import '../services/web_shop_service.dart';

class WebShopListProvider extends StateNotifier<List<WebShop>> {
  final PagingController<int, WebShop> pagingController = PagingController(firstPageKey: 1);

  WebShopListProvider([List<WebShop> initialItems = const []]) : super(initialItems) {
    pagingController.addPageRequestListener((page) {
      _fetchPage(page);
    });
  }

  Future<void> _fetchPage(int page) async {
    try {
      final data = await WebShopService().listShops();

      if (data.page >= data.num_pages) {
        pagingController.appendLastPage(data.results);
      } else {
        pagingController.appendPage(data.results, data.page + 1);
      }

      state = [...state, ...data.results];
    } catch (error) {
      pagingController.error = error;
    }
  }

  void refresh() {
    state = [];
    pagingController.refresh();
  }
}

final webShopListProvider = StateNotifierProvider<WebShopListProvider, List<WebShop>>(
  (ref) => WebShopListProvider(),
);
