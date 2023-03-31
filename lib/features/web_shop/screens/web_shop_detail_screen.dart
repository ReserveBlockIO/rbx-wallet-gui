import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/base_screen.dart';
import 'package:rbx_wallet/features/web_shop/components/web_collection_list.dart';

import '../components/web_shop_list.dart';
import '../providers/web_shop_detail_provider.dart';

class WebShopDetailScreen extends BaseScreen {
  WebShopDetailScreen({super.key, @PathParam("shopId") required this.shopId});
  int shopId;
  @override
  AppBar? appBar(BuildContext context, WidgetRef ref) {
    final data = ref.watch(webShopDetailProvider(shopId));

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
    final data = ref.watch(webShopDetailProvider(shopId));

    return data.when(
      data: (shop) => shop != null
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    shop.name,
                    style: TextStyle(
                      fontSize: 32,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(shop.description),
                ),
                Expanded(child: WebCollectionList(shop.id)),
              ],
            )
          : const Text("Error"),
      error: (_, __) => AppBar(
        title: const Text("Error"),
      ),
      loading: () => AppBar(
        title: const Text(""),
      ),
    );
  }
}
