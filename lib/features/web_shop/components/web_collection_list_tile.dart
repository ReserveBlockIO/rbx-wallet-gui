import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/app_router.gr.dart';

import '../../../core/base_component.dart';
import '../models/web_collection.dart';

class WebCollectionTile extends BaseComponent {
  WebCollectionTile(this.collection, {Key? key}) : super(key: key);
  WebCollection collection;
  @override
  Widget body(BuildContext context, WidgetRef ref) {
    return Card(
      child: ListTile(
        title: Text(collection.name),
        subtitle: Text(collection.description),
        trailing: Icon(Icons.chevron_right_outlined),
        onTap: () {
          AutoRouter.of(context).push(WebCollectionDetailScreenRoute(shopId: collection.shop.id, collectionId: collection.id));
        },
      ),
    );
  }
}
