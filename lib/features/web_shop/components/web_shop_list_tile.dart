import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/env.dart';

import '../../../core/app_router.gr.dart';
import '../../../core/base_component.dart';
import '../../../core/web_router.gr.dart';
import '../models/web_shop.dart';

class WebShopTile extends BaseComponent {
  WebShopTile(this.shop, {Key? key}) : super(key: key);
  WebShop shop;
  @override
  Widget body(BuildContext context, WidgetRef ref) {
    return Card(
      color: Theme.of(context).colorScheme.primary.withOpacity(0.5),
      child: ListTile(
        title: Text(shop.name),
        trailing: Icon(Icons.chevron_right_outlined),
        onTap: () {
          if (Env.isWeb) {
            AutoRouter.of(context).push(WebShopDetailScreenRoute(shopId: shop.id));
          } else {
            AutoRouter.of(context).push(DebugWebShopDetailScreenRoute(shopId: shop.id));
          }
        },
      ),
    );
  }
}
