import 'dart:async';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/app_router.gr.dart';
import 'package:rbx_wallet/core/dialogs.dart';
import 'package:rbx_wallet/core/providers/session_provider.dart';
import 'package:rbx_wallet/features/dst/models/dec_shop.dart';
import 'package:rbx_wallet/features/global_loader/global_loading_provider.dart';
import 'package:rbx_wallet/features/remote_shop/models/shop_data.dart';
import 'package:rbx_wallet/features/remote_shop/providers/saved_shops_provider.dart';
import 'package:rbx_wallet/features/remote_shop/providers/shop_loading_provider.dart';
import 'package:rbx_wallet/features/remote_shop/services/remote_shop_service.dart';
import 'package:rbx_wallet/utils/toast.dart';

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

  Future<void> connect(DecShop shop) async {
    state = ConnectedShop(url: shop.url, decShop: shop);

    await refresh(true);

    refreshTimer = Timer.periodic(Duration(seconds: 15), (timer) {
      refresh();
    });
  }

  disconnect() {
    refreshTimer?.cancel();
    // state = ConnectedShop();
  }

  refresh([bool showErrors = false]) async {
    print("refreshing...");

    int listingCount = 0;
    if (state.data != null) {
      for (final c in state.data!.collections) {
        listingCount += c.listings.length;
      }
    }

    await Future.delayed(Duration(seconds: 2));

    final data = await RemoteShopService().getConnectedShopData(
      showErrors: showErrors,
      listingCount: listingCount,
    );
    if (data != null) {
      state = state.copyWith(data: data);
    }
  }

  Future<void> removeBookmarkedShop(BuildContext context, WidgetRef ref, String url) async {
    final confirmed = await ConfirmDialog.show(
      title: "Remove shop?",
      body: "Are you sure you want to remove $url from your saved shops?",
      confirmText: "Remove",
      cancelText: "Cancel",
    );
    if (confirmed) {
      ref.read(savedShopsProvider.notifier).remove(url);
    }
  }

  Future<void> loadShop(BuildContext context, WidgetRef ref, String url) async {
    final address = ref.read(sessionProvider).currentWallet?.address;
    if (address == null) {
      Toast.error("No wallet selected");
      return;
    }

    final shop = await RemoteShopService().getShopInfo(url);

    if (shop == null) {
      Toast.error("Could not find auction house with url of $url");
      return;
    }

    ref.read(savedShopsProvider.notifier).save(shop);

    final confirmed = await ConfirmDialog.show(
      title: "Connect to Auction House?",
      body: "Would you like to connect to ${shop.name} (${shop.url})?",
      confirmText: "Connect",
      cancelText: "Cancel",
    );

    if (confirmed == true) {
      ref.read(shopLoadingProvider.notifier).start("Connecting to shop...");
      await RemoteShopService().connectToShop(myAddress: address, shopUrl: shop.url);
      ref.read(shopLoadingProvider.notifier).start("Connected to ${shop.url}. Fetching data...");

      await Future.delayed(Duration(milliseconds: 2500));
      ref.read(shopLoadingProvider.notifier).start("Getting collections and listings...");
      // await RemoteShopService().getConnectedShopData();
      await ref.read(connectedShopProvider.notifier).connect(shop);
      AutoRouter.of(context).push(RemoteShopDetailScreenRoute(shopUrl: shop.url));
      // AutoRouter.of(context).push(RemoteShopContainerScreenRoute());
      ref.read(shopLoadingProvider.notifier).complete();
    }
  }
}

final connectedShopProvider = StateNotifierProvider<ConnectedShopProvider, ConnectedShop>(
  (ref) => ConnectedShopProvider(ref, ConnectedShop()),
);
