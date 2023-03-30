import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/base_screen.dart';

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
    return const Text("Hi");
  }
}
