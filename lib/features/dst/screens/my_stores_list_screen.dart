import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/base_screen.dart';
import 'package:rbx_wallet/features/dst/components/store_list.dart';

class MyStoresListScreen extends BaseScreen {
  const MyStoresListScreen({Key? key}) : super(key: key);

  @override
  AppBar? appBar(BuildContext context, WidgetRef ref) {
    return AppBar(
      title: Text("My Stores"),
      actions: [
        TextButton(
          onPressed: () {},
          child: Text(
            "Create Store",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    return StoreList();
  }
}
