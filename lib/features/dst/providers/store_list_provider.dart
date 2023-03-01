import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/features/dst/models/store.dart';
import 'package:rbx_wallet/features/dst/services/dst_service.dart';

class StoreListProvider extends StateNotifier<List<Store>> {
  final Ref ref;

  StoreListProvider(this.ref, [List<Store> stores = const []]) : super(stores) {
    load();
  }

  Future<void> load() async {
    final data = await DstService().listStores();
    state = data;
  }

  void refresh() {
    load();
  }
}

final storeListProvider = StateNotifierProvider<StoreListProvider, List<Store>>(
  (ref) => StoreListProvider(ref),
);
