import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/app_router.gr.dart';
import '../../../core/base_component.dart';
import '../../../core/components/empty_placeholder.dart';
import '../../../core/theme/components.dart';
import '../providers/connected_shop_provider.dart';

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
        // Center(
        //   child: Text(
        //     shop.decShop.name,
        //     style: Theme.of(context).textTheme.headlineMedium!.copyWith(
        //           color: Colors.white,
        //         ),
        //   ),
        // ),
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
        if (shop.collections.isNotEmpty)
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Collections",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
          ),
        Expanded(
          child: shop.collections.isEmpty
              ? EmptyPlaceholder(title: "No Active Collections")
              : ListView.builder(
                  itemCount: shop.collections.length,
                  itemBuilder: (context, index) {
                    final collection = shop.collections[index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: AppCard(
                        padding: 0,
                        margin: EdgeInsets.zero,
                        child: ListTile(
                          title: Text(collection.name),
                          subtitle: Text(
                            collection.description,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          trailing: Icon(Icons.chevron_right),
                          onTap: () {
                            // final List<String> scIds = [];

                            // bulkGetNftAssets(service: RemoteShopService(), scIds: scIds);

                            AutoRouter.of(context).push(RemoteShopCollectionScreenRoute(
                              collectionId: collection.id,
                              url: shop.decShop.url,
                            ));
                          },
                        ),
                      ),
                    );
                  },
                ),
        )
      ],
    );
  }
}
