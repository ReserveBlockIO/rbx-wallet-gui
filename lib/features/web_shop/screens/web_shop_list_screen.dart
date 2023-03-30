import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/base_screen.dart';
import 'package:rbx_wallet/features/web_shop/services/web_shop_service.dart';

class WebShopListScreen extends BaseScreen {
  const WebShopListScreen({super.key});

  @override
  AppBar? appBar(BuildContext context, WidgetRef ref) {
    return AppBar(
      title: Text("Auction Houses"),
    );
  }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    print(WebShopService().retrieveListing(1, 2, 4));
    return const Text("Hi");
  }
}
