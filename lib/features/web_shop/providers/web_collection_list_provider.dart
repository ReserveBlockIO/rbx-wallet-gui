import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../models/web_collection.dart';
import '../services/web_shop_service.dart';

class WebCollectionListProvider extends StateNotifier<List<WebCollection>> {
  final PagingController<int, WebCollection> pagingController = PagingController(firstPageKey: 1);
  final int shopId;
  WebCollectionListProvider(this.shopId, [List<WebCollection> initialItems = const []]) : super(initialItems) {
    pagingController.addPageRequestListener((page) {
      _fetchPage(page);
    });
  }

  Future<void> _fetchPage(int page) async {
    try {
      final data = await WebShopService().listCollections(shopId, page);

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

final webCollectionListProvider = StateNotifierProvider.family<WebCollectionListProvider, List<WebCollection>, int>(
  (ref, shopId) => WebCollectionListProvider(shopId),
);
