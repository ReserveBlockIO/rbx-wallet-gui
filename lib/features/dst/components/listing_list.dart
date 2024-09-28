
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/app_router.gr.dart';
import '../../../core/base_component.dart';
import '../../../core/components/buttons.dart';
import '../../../core/theme/app_theme.dart';
import '../../../core/theme/components.dart';
import '../providers/listing_form_provider.dart';
import '../providers/listing_list_provider.dart';
import '../services/dst_service.dart';
import '../../../core/components/poller.dart';

class ListingList extends BaseComponent {
  const ListingList(this.collectionId, {Key? key}) : super(key: key);
  final int collectionId;

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    final listings = ref.watch(listingListProvider(collectionId));

    return listings.isNotEmpty
        ? Column(
            children: [
              Poller(
                pollFunction: () {
                  ref.read(listingListProvider(collectionId).notifier).refresh();
                },
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: listings.length,
                  itemBuilder: (context, index) {
                    final listing = listings[index];
                    final nft = listing.nft;
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                      child: AppCard(
                        padding: 0,
                        child: ListTile(
                          // leading: Builder(
                          //   builder: (context) {
                          //     if (nft == null) {
                          //       return SizedBox.shrink();
                          //     }

                          //     if (nft.currentEvolveAsset.isImage) {
                          //       if (nft.currentEvolveAsset.localPath == null) {
                          //         return const SizedBox(
                          //           width: 32,
                          //           height: 32,
                          //         );
                          //       }

                          //       return SizedBox(
                          //         width: 32,
                          //         height: 32,
                          //         child: PollingImagePreview(
                          //           localPath: nft.currentEvolveAsset.localPath!,
                          //           expectedSize: nft.currentEvolveAsset.fileSize,
                          //           withProgress: false,
                          //         ),
                          //       );
                          //     }
                          //     return const Icon(Icons.file_present_outlined);
                          //   },
                          // ),
                          leading: FutureBuilder(
                            future: listing.thumbnail(),
                            builder: (context, AsyncSnapshot<Widget> snapshot) {
                              if (snapshot.hasData) {
                                return snapshot.data!;
                              }

                              return SizedBox();
                            },
                          ),
                          title: Text(listing.nft != null ? listing.nft!.name : listing.smartContractUid),
                          subtitle: listing.deactivateForSeller
                              ? Text(
                                  listing.saleHasFailed ? "Sale Complete TX Failed" : "Completed",
                                  style: TextStyle(
                                    color: listing.saleHasFailed ? Theme.of(context).colorScheme.danger : Theme.of(context).colorScheme.success,
                                    fontWeight: FontWeight.w600,
                                  ),
                                )
                              : Text(listing.label),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              if (listing.saleHasFailed)
                                Padding(
                                  padding: const EdgeInsets.only(right: 8.0),
                                  child: AppButton(
                                    label: "Complete Sale",
                                    variant: AppColorVariant.Warning,
                                    onPressed: () {
                                      DstService().retrySale(listing.id);
                                    },
                                  ),
                                ),
                              if (listing.isAuction)
                                Padding(
                                  padding: const EdgeInsets.only(right: 8.0),
                                  child: AppButton(
                                    label: "Activity",
                                    variant: AppColorVariant.Success,
                                    onPressed: () {
                                      AutoRouter.of(context).push(ListingAuctionDetailScreenRoute(listingId: listing.id));
                                    },
                                  ),
                                ),
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
                              if (!listing.deactivateForSeller)
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
                      ),
                    );
                  },
                ),
              ),
            ],
          )
        : Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Now you can create listings for the NFTs you own.",
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
