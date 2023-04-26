import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/features/remote_shop/providers/remote_shop_expanded_listings_provider.dart';

class ShopListViewProvider extends StateNotifier<bool> {
  final Ref ref;

  ShopListViewProvider(this.ref, [bool isExpanded = true]) : super(isExpanded);

  void setExpanded() {
    state = true;
  }

  void setCondensed() {
    state = false;

    ref.read(remoteShopExpandedListingsProvider.notifier).clear();
  }
}

final shopListViewProvider = StateNotifierProvider<ShopListViewProvider, bool>(
  (ref) => ShopListViewProvider(ref),
);
