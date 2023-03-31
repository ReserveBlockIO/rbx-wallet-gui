import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/app_router.gr.dart';

import '../../../core/base_component.dart';
import '../models/web_shop.dart';

class WebShopTile extends BaseComponent {
  WebShopTile(this.shop, {Key? key}) : super(key: key);
  WebShop shop;
  @override
  Widget body(BuildContext context, WidgetRef ref) {
    return Card(
      child: ListTile(
        title: Text(shop.name),
        trailing: Icon(Icons.chevron_right_outlined),
        onTap: () {
          AutoRouter.of(context).push(WebShopDetailScreenRoute(shopId: shop.id));
        },
      ),
    );
  }
}