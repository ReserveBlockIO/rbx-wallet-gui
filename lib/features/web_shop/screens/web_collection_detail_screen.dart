import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/base_screen.dart';
import 'package:rbx_wallet/features/web_shop/components/web_listing_list.dart';
import 'package:rbx_wallet/features/web_shop/providers/web_collection_detail_provider.dart';

class WebCollectionDetailScreen extends BaseScreen {
  WebCollectionDetailScreen({
    super.key,
    @PathParam("shopId") required this.shopId,
    @PathParam("collectionId") required this.collectionId,
  });
  int shopId;
  int collectionId;
  @override
  AppBar? appBar(BuildContext context, WidgetRef ref) {
    final data = ref.watch(webCollectionDetailProvider("$shopId,$collectionId"));
    return data.when(
      data: (collection) => collection != null
          ? AppBar(
              title: Text(collection.name),
            )
          : AppBar(
              title: const Text("Error"),
            ),
      error: (_, __) => AppBar(
        title: const Text("Error"),
      ),
      loading: () => AppBar(
        title: const Text("loading"),
      ),
    );
  }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    final data = ref.watch(webCollectionDetailProvider("$shopId,$collectionId"));

    return data.when(
      data: (collection) => collection != null
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    collection.name,
                    style: TextStyle(
                      fontSize: 32,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(collection.description),
                ),
                Expanded(child: WebListingList(collection.id, collection.shop.id)),
              ],
            )
          : const Text("Error"),
      error: (_, __) => const Text("Error"),
      loading: () => const Text("Loading"),
    );
  }
}
