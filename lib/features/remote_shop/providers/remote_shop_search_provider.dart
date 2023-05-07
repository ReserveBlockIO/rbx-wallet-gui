import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../dst/models/dec_shop.dart';
import '../services/remote_shop_service.dart';

class RemoteShopSearchProvider extends StateNotifier<String> {
  final Ref ref;

  RemoteShopSearchProvider(this.ref) : super("");
  final TextEditingController controller = TextEditingController();

  update(String q) {
    state = q;
  }

  clear() {
    state = '';
    controller.clear();
  }
}

final remoteShopSearchProvider = StateNotifierProvider<RemoteShopSearchProvider, String>(
  (ref) => RemoteShopSearchProvider(ref),
);
