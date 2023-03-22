import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/features/remote_shop/components/remote_shop_details.dart';
import 'package:rbx_wallet/features/remote_shop/providers/remote_shop_detail_provider.dart';

import '../../../core/base_screen.dart';
import '../../../core/components/centered_loader.dart';
import '../../wallet/components/wallet_selector.dart';

class RemoteShopDetailScreen extends BaseScreen {
  final String shopUrl;
  const RemoteShopDetailScreen({Key? key, @PathParam("url") required this.shopUrl}) : super(key: key);

  @override
  AppBar? appBar(BuildContext context, WidgetRef ref) {
    final data = ref.watch(remoteShopDetailProvider(shopUrl));

    return data.when(
      data: (shop) => shop != null
          ? AppBar(
              title: Text(shop.name),
            )
          : AppBar(
              title: const Text("Error"),
            ),
      error: (_, __) => AppBar(
        title: const Text("Error"),
      ),
      loading: () => AppBar(
        title: const Text(""),
      ),
    );
  }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    final data = ref.watch(remoteShopDetailProvider(shopUrl));

    return data.when(
      data: (shop) => shop != null ? RemoteShopDetails(shop) : const Center(child: Text("Error")),
      error: (_, __) => const Text("Error"),
      loading: () => const CenteredLoader(),
    );
  }
}
