import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/app_router.gr.dart';
import 'package:rbx_wallet/core/base_component.dart';
import 'package:rbx_wallet/features/dst/models/dec_shop.dart';
import 'package:rbx_wallet/features/remote_shop/providers/connected_shop_provider.dart';

class RemoteShopDetails extends BaseComponent {
  const RemoteShopDetails({super.key});

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    final provider = ref.read(connectedShopProvider.notifier);
    final model = ref.watch(connectedShopProvider);

    final shop = model.data;
    if (shop == null) {
      return Center(child: Text("Error"));
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Text(
            shop.decShop.name,
            style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                  color: Colors.white,
                ),
          ),
        ),
        Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 600),
            child: Text(
              shop.decShop.description,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Colors.white,
                  ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        Divider(),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "Collections",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: shop.collections.length,
            itemBuilder: (context, index) {
              final collection = shop.collections[index];
              return Card(
                child: ListTile(
                  title: Text(collection.name),
                  subtitle: Text(
                    collection.description,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  trailing: Icon(Icons.chevron_right),
                  onTap: () {
                    AutoRouter.of(context).push(RemoteShopCollectionScreenRoute(
                      collectionId: collection.id,
                      url: shop.decShop.url,
                    ));
                  },
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
