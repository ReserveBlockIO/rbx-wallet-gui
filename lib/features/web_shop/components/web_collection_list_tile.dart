import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
          print("Move to $collection");
        },
      ),
    );
  }
}
