import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/base_screen.dart';

import '../components/web_shop_list.dart';
import '../providers/web_shop_list_provider.dart';

class WebShopListScreen extends BaseScreen {
  const WebShopListScreen({super.key})
      : super(
          includeWebDrawer: true,
        );

  @override
  AppBar? appBar(BuildContext context, WidgetRef ref) {
    return AppBar(centerTitle: true, backgroundColor: Colors.black12, shadowColor: Colors.transparent, title: Text("Auction Houses"), actions: [
      IconButton(
          onPressed: () {
            ref.watch(webShopListProvider(WebShopListType.public).notifier).refresh();
          },
          icon: Icon(Icons.refresh)),
    ]);
  }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    return const WebShopList();
  }
}
