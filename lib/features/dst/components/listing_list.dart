import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/app_router.gr.dart';
import 'package:rbx_wallet/core/base_component.dart';
import 'package:rbx_wallet/features/dst/providers/listing_list_provider.dart';
import 'package:rbx_wallet/features/dst/providers/store_list_provider.dart';

class ListingList extends BaseComponent {
  const ListingList(this.storeId, {Key? key}) : super(key: key);
  final int storeId;

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    final provider = ref.read(listingListProvider(storeId).notifier);
    final listings = ref.watch(listingListProvider(storeId));

    return listings.isNotEmpty
        ? ListView.builder(
            itemCount: listings.length,
            itemBuilder: (context, index) {
              final listing = listings[index];
              return Card(
                child: ListTile(
                  title: Text(listing.smartContractUid),
                  trailing: Icon(Icons.chevron_right),
                  onTap: () {
                    // AutoRouter.of(context).push(MyStoreDetailScreenRoute(storeId: listing.id));
                  },
                ),
              );
            },
          )
        : Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('No Listings'),
          );
  }
}
