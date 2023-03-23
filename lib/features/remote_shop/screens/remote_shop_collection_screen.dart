import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/base_component.dart';
import 'package:rbx_wallet/core/base_screen.dart';
import 'package:rbx_wallet/features/dst/models/dec_shop.dart';
import 'package:rbx_wallet/features/remote_shop/providers/connected_shop_provider.dart';
import 'package:collection/collection.dart';

class RemoteShopCollectionScreen extends BaseScreen {
  final int collectionId;
  final String url;

  const RemoteShopCollectionScreen({
    super.key,
    @PathParam("collectionId") required this.collectionId,
    @PathParam("url") required this.url,
  });

  @override
  AppBar? appBar(BuildContext context, WidgetRef ref) {
    final model = ref.watch(connectedShopProvider);
    final shop = model.data;

    if (shop == null) {
      return AppBar();
    }
    final collection = shop.collections.firstWhereOrNull((c) => c.id == collectionId);

    if (collection == null) {
      return AppBar();
    }

    return AppBar(
      title: Text(collection.name),
      backgroundColor: Colors.black12,
      shadowColor: Colors.transparent,
    );
  }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    final provider = ref.read(connectedShopProvider.notifier);
    final model = ref.watch(connectedShopProvider);

    final shop = model.data;
    if (shop == null) {
      return Center(child: Text("Shop Error"));
    }

    final collection = shop.collections.firstWhereOrNull((c) => c.id == collectionId);

    if (collection == null) {
      return Center(child: Text("Collection Error"));
    }

    return Column(
      children: [
        Center(
          child: Text(
            collection.name,
            style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                  color: Colors.white,
                ),
          ),
        ),
        Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 600),
            child: Text(
              collection.description,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Colors.white,
                  ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        Divider(),
        Expanded(
          child: ListView.builder(
            itemCount: collection.listings.length,
            itemBuilder: (context, index) {
              final listing = collection.listings[index];
              return Card(
                child: ListTile(
                  title: Text(listing.addressOwner),
                  subtitle: Text(
                    collection.description,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  trailing: Icon(Icons.chevron_right),
                  onTap: () {},
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
