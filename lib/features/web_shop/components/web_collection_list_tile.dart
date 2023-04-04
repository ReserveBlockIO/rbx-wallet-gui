import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/app_router.gr.dart';
import 'package:rbx_wallet/core/env.dart';

import '../../../core/base_component.dart';
import '../../../core/web_router.gr.dart';
import '../models/web_collection.dart';

class WebCollectionTile extends BaseComponent {
  WebCollectionTile(this.collection, {Key? key}) : super(key: key);
  WebCollection collection;
  @override
  Widget body(BuildContext context, WidgetRef ref) {
    return Card(
      color: Theme.of(context).colorScheme.primary.withOpacity(0.5),
      child: ListTile(
        title: Text(collection.name),
        subtitle: Text(
          collection.description,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        trailing: Icon(Icons.chevron_right),
        onTap: () {
          if (Env.isWeb) {
            AutoRouter.of(context).push(WebCollectionDetailScreenRoute(shopId: collection.shop.id, collectionId: collection.id));
          } else {
            AutoRouter.of(context).push(DebugWebCollectionDetailScreenRoute(shopId: collection.shop.id, collectionId: collection.id));
          }
        },
      ),
    );
  }
}
