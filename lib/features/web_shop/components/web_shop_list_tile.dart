import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/env.dart';
import 'package:rbx_wallet/features/web_shop/providers/web_auth_token_provider.dart';
import 'package:rbx_wallet/utils/guards.dart';
import 'package:rbx_wallet/utils/toast.dart';

import '../../../core/app_router.gr.dart';
import '../../../core/base_component.dart';
import '../../../core/theme/app_theme.dart';
import '../../../core/web_router.gr.dart';
import '../models/web_shop.dart';

class WebShopTile extends BaseComponent {
  WebShopTile(this.shop, {Key? key}) : super(key: key);
  WebShop shop;
  @override
  Widget body(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black,
          boxShadow: glowingBox,
        ),
        child: Card(
          margin: EdgeInsets.zero,
          color: Colors.white.withOpacity(0.03),
          child: ListTile(
            title: RichText(
                text: TextSpan(style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500), children: [
              TextSpan(
                text: shop.name,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ])),
            subtitle: RichText(
              text: TextSpan(style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500), children: [
                TextSpan(
                  text: shop.url,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.secondary.withOpacity(0.7),
                  ),
                ),
                TextSpan(text: " "),
                TextSpan(
                  text: "${shop.ownerAddress}",
                  style: TextStyle(
                    color: Colors.white70,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ]),
            ),
            leading: Icon(
              Icons.house,
            ),
            trailing: Icon(Icons.chevron_right),
            onTap: () async {
              if (!await guardWebAuthorized(ref, shop.ownerAddress)) {
                Toast.error("Not Authorized");
                return;
              }

              if (Env.isWeb) {
                AutoRouter.of(context).push(WebShopDetailScreenRoute(shopId: shop.id));
              } else {
                AutoRouter.of(context).push(DebugWebShopDetailScreenRoute(shopId: shop.id));
              }
            },
          ),
        ),
      ),
    );
    // return Card(
    //   color: Theme.of(context).colorScheme.primary.withOpacity(0.5),
    //   child: ListTile(
    //     title: Text(shop.name),
    //     trailing: Icon(Icons.chevron_right_outlined),
    //     onTap: () {
    //       if (Env.isWeb) {
    //         AutoRouter.of(context).push(WebShopDetailScreenRoute(shopId: shop.id));
    //       } else {
    //         AutoRouter.of(context).push(DebugWebShopDetailScreenRoute(shopId: shop.id));
    //       }
    //     },
    //   ),
    // );
  }
}
