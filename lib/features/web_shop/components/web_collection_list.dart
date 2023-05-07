import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'web_collection_list_tile.dart';
import '../../../core/base_component.dart';
import '../providers/web_collection_full_list_provider.dart';

class WebCollectionListContainer extends ConsumerStatefulWidget {
  final int shopId;

  const WebCollectionListContainer(
    this.shopId, {
    Key? key,
  }) : super(key: key);

  @override
  _WebCollectionListContainerState createState() => _WebCollectionListContainerState();
}

class _WebCollectionListContainerState extends ConsumerState<WebCollectionListContainer> {
  late final int shopId;

  @override
  void initState() {
    shopId = widget.shopId;
    super.initState();

    ref.read(webCollectionFullListProvider(shopId).notifier).init();
  }

  @override
  Widget build(BuildContext context) {
    return WebCollectionList(shopId);
  }
}

class WebCollectionList extends BaseComponent {
  final int shopId;
  const WebCollectionList(
    this.shopId, {
    Key? key,
  }) : super(key: key);

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    final collections = ref.watch(webCollectionFullListProvider(shopId));

    if (collections.isEmpty) {
      return SizedBox();
    }

    return ListView.builder(
      itemCount: collections.length,
      itemBuilder: (context, index) {
        final collection = collections[index];
        return WebCollectionTile(
          collection,
        );
      },
    );
  }
}
