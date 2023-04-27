import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:rbx_wallet/core/models/paginated_response.dart';
import 'package:rbx_wallet/core/providers/session_provider.dart';
import 'package:rbx_wallet/core/providers/web_session_provider.dart';
import 'package:rbx_wallet/features/web_shop/models/web_shop.dart';

import '../services/web_shop_service.dart';

enum WebShopListType {
  public,
  mine,
}

class WebShopListProvider extends StateNotifier<List<WebShop>> {
  final Ref ref;
  final WebShopListType type;
  final PagingController<int, WebShop> pagingController = PagingController(firstPageKey: 1);

  WebShopListProvider(this.ref, this.type, [List<WebShop> initialItems = const []]) : super(initialItems) {
    pagingController.addPageRequestListener((page) {
      _fetchPage(page);
    });
  }

  Future<void> _fetchPage(int page) async {
    try {
      late ServerPaginatedReponse<WebShop> data;

      if (type == WebShopListType.public) {
        data = await WebShopService().listShops(page: page);
      } else {
        final address = kIsWeb ? ref.read(webSessionProvider).keypair?.public : ref.read(sessionProvider).currentWallet?.address;
        if (address == null) {
          print("No Address");
          return;
        }

        data = await WebShopService().listShops(page: page, ownerAddress: address);
      }

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

final webShopListProvider = StateNotifierProvider.family<WebShopListProvider, List<WebShop>, WebShopListType>(
  (ref, type) => WebShopListProvider(ref, type),
);
