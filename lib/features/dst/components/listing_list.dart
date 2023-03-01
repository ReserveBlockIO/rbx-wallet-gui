import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/app_router.gr.dart';
import 'package:rbx_wallet/core/base_component.dart';
import 'package:rbx_wallet/core/components/buttons.dart';
import 'package:rbx_wallet/core/theme/app_theme.dart';
import 'package:rbx_wallet/features/asset/polling_image_preview.dart';
import 'package:rbx_wallet/features/dst/providers/listing_list_provider.dart';

class ListingList extends BaseComponent {
  const ListingList(this.storeId, {Key? key}) : super(key: key);
  final int storeId;

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    final listings = ref.watch(listingListProvider(storeId));

    return listings.isNotEmpty
        ? ListView.builder(
            itemCount: listings.length,
            itemBuilder: (context, index) {
              final listing = listings[index];
              final nft = listing.nft;
              return Card(
                child: ListTile(
                  leading: Builder(
                    builder: (context) {
                      if (nft == null) {
                        return SizedBox.shrink();
                      }

                      if (nft.currentEvolveAsset.isImage) {
                        if (nft.currentEvolveAsset.localPath == null) {
                          return const SizedBox(
                            width: 32,
                            height: 32,
                          );
                        }

                        return SizedBox(
                          width: 32,
                          height: 32,
                          child: PollingImagePreview(
                            localPath: nft.currentEvolveAsset.localPath!,
                            expectedSize: nft.currentEvolveAsset.fileSize,
                            withProgress: false,
                          ),
                        );
                      }
                      return const Icon(Icons.file_present_outlined);
                    },
                  ),
                  title: Text(listing.nft != null ? listing.nft!.name : listing.smartContractUid),
                  subtitle: Text(listing.label),
                  trailing: Icon(Icons.chevron_right),
                  onTap: () {
                    AutoRouter.of(context).push(ListingDetailScreenRoute(listingId: listing.id));
                  },
                ),
              );
            },
          )
        : Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "No Listings yet",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  AppButton(
                    label: "Create First Listing",
                    variant: AppColorVariant.Success,
                    onPressed: () {
                      AutoRouter.of(context).push(CreateListingContainerScreenRoute(storeId: storeId));
                    },
                  ),
                ],
              ),
            ),
          );
  }
}
