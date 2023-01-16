import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/base_component.dart';
import '../../../core/components/buttons.dart';
import '../../../core/components/centered_loader.dart';
import '../../../core/web_router.gr.dart';
import '../../dsts/providers/my_store_listings_provider.dart';
import '../models/store.dart';

class StoreListings extends BaseComponent {
  final Store store;
  const StoreListings(this.store, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(myStoreListingProvider(store.slug));

    return data.when(
      data: (listings) {
        if (listings.isEmpty) {
          return Center(
              child: Card(
                  child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "No Auctions",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  child: Text("You haven't created any auctions in this store yet."),
                ),
                AppButton(
                  label: "Create Auction",
                  onPressed: () {
                    AutoRouter.of(context).push(CreateListingScreenRoute(storeId: store.id));
                  },
                )
              ],
            ),
          )));
        }

        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListView.builder(
                shrinkWrap: true,
                itemCount: listings.length,
                itemBuilder: (context, index) {
                  final listing = listings[index];
                  return ListTile(
                    title: Text(listing.name),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () {
                      AutoRouter.of(context).push(StoreListingScreenRoute(slug: listing.slug));
                    },
                  );
                }),
            const Divider(),
            AppButton(
              label: "Create Auction",
              onPressed: () {
                AutoRouter.of(context).push(CreateListingScreenRoute(storeId: store.id));
              },
            )
          ],
        );
      },
      error: (_, __) => const Text("Error"),
      loading: () => const CenteredLoader(),
    );
  }
}
