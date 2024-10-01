import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/base_screen.dart';

import '../components/web_my_shop_list.dart';
import '../providers/web_shop_list_provider.dart';

class MyWebShopListScreen extends BaseScreen {
  const MyWebShopListScreen({super.key})
      : super(
          includeWebDrawer: true,
          verticalPadding: 0,
          horizontalPadding: 0,
        );

  @override
  AppBar? appBar(BuildContext context, WidgetRef ref) {
    return AppBar(
      centerTitle: true,
      backgroundColor: Colors.black12,
      shadowColor: Colors.transparent,
      title: Text("My Auction Houses"),
      actions: [
        IconButton(
            onPressed: () {
              ref.read(webShopListProvider(WebShopListType.mine).notifier).refresh();
            },
            icon: Icon(Icons.refresh)),

        // IconButton(
        //     onPressed: () async {
        //       final token = await ref.read(webAuthTokenProvider.notifier).authorize();

        //       if (token != null) {
        //         Toast.message("Authorized");
        //       }
        //     },
        //     icon: Icon(Icons.sign_language))
      ],
    );
  }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    return const WebMyShopList();
  }
}
