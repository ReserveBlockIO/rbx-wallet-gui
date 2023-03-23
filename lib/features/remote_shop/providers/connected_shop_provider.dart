import 'dart:async';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/features/dst/models/dec_shop.dart';
import 'package:rbx_wallet/features/remote_shop/models/shop_data.dart';
import 'package:rbx_wallet/features/remote_shop/services/remote_shop_service.dart';

part 'connected_shop_provider.freezed.dart';

@freezed
class ConnectedShop with _$ConnectedShop {
  const ConnectedShop._();

  factory ConnectedShop({
    String? url,
    DecShop? decShop,
    OrganizedShop? data,
  }) = _ConnectedShop;
}

class ConnectedShopProvider extends StateNotifier<ConnectedShop> {
  final Ref ref;

  Timer? refreshTimer;

  ConnectedShopProvider(this.ref, ConnectedShop initialState) : super(initialState);

  connect(DecShop shop) {
    state = ConnectedShop(url: shop.url, decShop: shop);

    refresh(true);

    refreshTimer = Timer.periodic(Duration(seconds: 30), (timer) {
      refresh();
    });
  }

  disconnect() {
    refreshTimer?.cancel();
    // state = ConnectedShop();
  }

  refresh([bool showErrors = false]) async {
    print("refreshing...");
    final data = await RemoteShopService().getConnectedShopData(showErrors);
    if (data != null) {
      state = state.copyWith(data: data);
    }
  }
}

final connectedShopProvider = StateNotifierProvider<ConnectedShopProvider, ConnectedShop>(
  (ref) => ConnectedShopProvider(ref, ConnectedShop()),
);
