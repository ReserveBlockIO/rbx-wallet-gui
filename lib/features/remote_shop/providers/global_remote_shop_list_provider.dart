import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/features/dst/models/dec_shop.dart';
import 'package:rbx_wallet/features/remote_shop/services/remote_shop_service.dart';

class GlobalRemoteShopListProvider extends StateNotifier<List<DecShop>> {
  final Ref ref;

  GlobalRemoteShopListProvider(this.ref, [List<DecShop> shops = const []]) : super(shops) {
    load();
  }

  Future<void> load() async {
    state = [];
    final data = await RemoteShopService().listRemoteShops();
    state = data;
  }

  void refresh() {
    load();
  }
}

final globalRemoteShopListProvider = StateNotifierProvider<GlobalRemoteShopListProvider, List<DecShop>>(
  (ref) => GlobalRemoteShopListProvider(ref),
);
