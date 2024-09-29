import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import '../models/web_listing.dart';

import '../services/web_shop_service.dart';

class WebListingListProvider extends StateNotifier<List<WebListing>> {
  final PagingController<int, WebListing> pagingController = PagingController(firstPageKey: 1);
  final int shopId;
  final int collectionId;
  WebListingListProvider(this.shopId, this.collectionId, [List<WebListing> initialItems = const []]) : super(initialItems) {
    pagingController.addPageRequestListener((page) {
      _fetchPage(page);
    });
  }

  Future<void> _fetchPage(int page) async {
    try {
      final data = await WebShopService().listListings(shopId, collectionId, page);

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

final webListingListProvider = StateNotifierProvider.family<WebListingListProvider, List<WebListing>, String>(
  (ref, identifier) => WebListingListProvider(int.parse(identifier.split(',')[0]), int.parse(identifier.split(',')[1])),
);
