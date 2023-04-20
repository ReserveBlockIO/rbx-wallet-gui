import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/base_screen.dart';

import '../components/web_shop_list.dart';

class WebShopListScreen extends BaseScreen {
  const WebShopListScreen({super.key})
      : super(
          backgroundColor: const Color(0xFF010715),
          includeWebDrawer: true,
        );

  @override
  AppBar? appBar(BuildContext context, WidgetRef ref) {
    return AppBar(
      centerTitle: true,
      backgroundColor: Colors.black12,
      shadowColor: Colors.transparent,
      title: Text("Auction Houses"),
    );
  }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    return const WebShopList();
  }
}
