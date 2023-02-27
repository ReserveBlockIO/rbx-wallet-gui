import 'dart:convert';
import 'package:rbx_wallet/features/dst/models/store.dart';

import '../../../core/services/base_service.dart';

class TopicService extends BaseService {
  TopicService() : super(apiBasePathOverride: "/dstapi/DSTV1");

  Future<Store?> retreiveStore(int id) async {
    try {
      final response = await getText("/GetStore/$id");
      final item = jsonDecode(response);

      return Store.fromJson(item);
    } catch (e, st) {
      print(e);
      print(st);
      return null;
    }
  }

  Future<List<Store>> listStores() async {
    try {
      final response = await getText("/GetAllStores", cleanPath: false);
      if (response.isEmpty) {
        return [];
      }
      final items = jsonDecode(response);

      final List<Store> stores = [];
      for (final item in items) {
        stores.add(Store.fromJson(item));
      }
      return stores;
    } catch (e, st) {
      print(e);
      print(st);
      return [];
    }
  }
}
