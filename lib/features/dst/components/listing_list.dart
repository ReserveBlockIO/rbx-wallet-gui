import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/app_router.gr.dart';
import 'package:rbx_wallet/core/base_component.dart';
import 'package:rbx_wallet/core/components/buttons.dart';
import 'package:rbx_wallet/core/theme/app_theme.dart';
import 'package:rbx_wallet/features/asset/polling_image_preview.dart';
import 'package:rbx_wallet/features/dst/providers/listing_form_provider.dart';
import 'package:rbx_wallet/features/dst/providers/listing_list_provider.dart';
import 'package:rbx_wallet/features/dst/services/dst_service.dart';

class ListingList extends BaseComponent {
  const ListingList(this.collectionId, {Key? key}) : super(key: key);
  final int collectionId;

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    final listings = ref.watch(listingListProvider(collectionId));

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
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (listing.isAuction) ...[
                        AppButton(
                          label: "Activity",
                          variant: AppColorVariant.Success,
                          onPressed: () {
                            AutoRouter.of(context).push(ListingAuctionDetailScreenRoute(listingId: listing.id));
                          },
                        ),
                        SizedBox(
                          width: 8,
                        ),
                      ],
                      AppButton(
                        label: 'Delete',
                        variant: AppColorVariant.Danger,
                        onPressed: () {
                          ref.read(listingFormProvider.notifier).delete(context, listing.collectionId, listing, false);
                        },
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      AppButton(
                        label: "Edit",
                        variant: AppColorVariant.Light,
                        onPressed: () async {
                          final l = await DstService().retreiveListing(listing.id);
                          ref.read(listingFormProvider.notifier).load(l ?? listing);
                          AutoRouter.of(context).push(CreateListingContainerScreenRoute(collectionId: listing.collectionId));
                        },
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      AppButton(
                        label: "Details",
                        onPressed: () {
                          AutoRouter.of(context).push(ListingDetailScreenRoute(listingId: listing.id));
                        },
                      )
                    ],
                  ),
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
                    "Now you can create listings for the NFTs you want to sell.",
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  AppButton(
                    label: "Create First Listing",
                    variant: AppColorVariant.Success,
                    onPressed: () {
                      AutoRouter.of(context).push(CreateListingContainerScreenRoute(collectionId: collectionId));
                    },
                  ),
                ],
              ),
            ),
          );
  }
}
