import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../../../core/base_screen.dart';
import '../../../core/components/badges.dart';
import '../../../core/components/buttons.dart';
import '../../../core/components/centered_loader.dart';
import '../../../core/theme/app_theme.dart';
import '../../../core/theme/components.dart';

import '../../../core/app_router.gr.dart';
import '../providers/listing_detail_provider.dart';
import '../providers/listing_form_provider.dart';

class ListingDetailScreen extends BaseScreen {
  final int listingId;
  const ListingDetailScreen({
    Key? key,
    @PathParam("listingId") required this.listingId,
  }) : super(key: key, verticalPadding: 0, horizontalPadding: 0);

  @override
  AppBar? appBar(BuildContext context, WidgetRef ref) {
    final data = ref.watch(listingDetailProvider(listingId));

    return data.when(
      loading: () => null,
      error: (_, __) => null,
      data: (listing) {
        if (listing == null) {
          return null;
        }
        return AppBar(
          title: Text(
            "Listing for ${listing.nft != null ? listing.nft!.name : listing.smartContractUid}",
          ),
          backgroundColor: Colors.black,
        );
      },
    );
  }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    final data = ref.watch(listingDetailProvider(listingId));

    final headingStyle = TextStyle(fontSize: 18, fontWeight: FontWeight.w600);

    return data.when(
      loading: () => CenteredLoader(),
      error: (_, __) => Center(child: Text("An error occurred.")),
      data: (listing) {
        if (listing == null) {
          return Center(child: Text("An error occurred."));
        }
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (listing.deactivateForSeller)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: AppBadge(
                  label: "Completed",
                  variant: AppColorVariant.Warning,
                ),
              ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: AppCard(
                child: Table(
                  defaultColumnWidth: IntrinsicColumnWidth(),
                  border: TableBorder(
                    horizontalInside: BorderSide(
                      color: Colors.white10,
                    ),
                  ),
                  defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                  children: [
                    TableRow(children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'NFT',
                          style: headingStyle,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Builder(builder: (context) {
                          if (listing.nft != null) {
                            final nft = listing.nft!;
                            return ListTile(
                              contentPadding: EdgeInsets.zero,
                              title: Text(nft.name),
                              subtitle: Text(nft.id),
                              leading: FutureBuilder(
                                future: listing.thumbnail(),
                                builder: (context, AsyncSnapshot<Widget> snapshot) {
                                  if (snapshot.hasData) {
                                    return snapshot.data!;
                                  }

                                  return SizedBox();
                                },
                              ),
                            );
                          }

                          return Text(listing.smartContractUid);
                        }),
                      ),
                    ]),
                    TableRow(children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Owner',
                          style: headingStyle,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(listing.ownerAddress),
                      ),
                    ]),
                    TableRow(children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Dates',
                          style: headingStyle,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "${DateFormat.yMd().format(listing.startDate)} ${DateFormat("HH:mm").format(listing.startDate)}  - ${DateFormat.yMd().format(listing.endDate)} ${DateFormat("HH:mm").format(listing.endDate)}",
                        ),
                      ),
                    ]),
                    TableRow(children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Options',
                          style: headingStyle,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                listing.isBuyNow
                                    ? Icon(
                                        Icons.check,
                                        color: Theme.of(context).colorScheme.success,
                                      )
                                    : Icon(
                                        Icons.close,
                                        color: Theme.of(context).colorScheme.danger,
                                      ),
                                Text(" Buy Now"),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                listing.isAuction
                                    ? Icon(
                                        Icons.check,
                                        color: Theme.of(context).colorScheme.success,
                                      )
                                    : Icon(
                                        Icons.close,
                                        color: Theme.of(context).colorScheme.danger,
                                      ),
                                Text(" Auction"),
                              ],
                            ),
                          ],
                        ),
                      )
                    ]),
                    listing.buyNowPrice != null && listing.buyNowPrice != 0
                        ? TableRow(children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Buy Now Price',
                                style: headingStyle,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("${listing.buyNowPrice.toString()} VFX"),
                            )
                          ])
                        : TableRow(children: [Container(), Container()]),
                    listing.floorPrice != null && listing.floorPrice != 0
                        ? TableRow(children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Auction Floor Price',
                                style: headingStyle,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("${listing.floorPrice.toString()} VFX"),
                            )
                          ])
                        : TableRow(children: [Container(), Container()]),
                    listing.reservePrice != null && listing.reservePrice != 0 && listing.reservePrice != listing.floorPrice
                        ? TableRow(children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Auction Reserve Price',
                                style: headingStyle,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("${listing.reservePrice.toString()} VFX"),
                            )
                          ])
                        : TableRow(children: [Container(), Container()]),
                  ],
                ),
              ),
            ),
            if (listing.isAuction)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: AppButton(
                  label: "Auction Activity",
                  variant: AppColorVariant.Success,
                  onPressed: () {
                    AutoRouter.of(context).push(ListingAuctionDetailScreenRoute(listingId: listing.id));
                  },
                ),
              ),
            Expanded(child: SizedBox.shrink()),
            Padding(
              padding: const EdgeInsets.all(16.0).copyWith(bottom: 48),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  if (!listing.deactivateForSeller)
                    AppButton(
                      label: 'Edit Listing',
                      icon: Icons.edit,
                      variant: AppColorVariant.Light,
                      onPressed: () {
                        ref.read(listingFormProvider.notifier).load(listing);
                        AutoRouter.of(context).push(CreateListingContainerScreenRoute(collectionId: listing.collectionId));
                      },
                    ),
                  AppButton(
                    label: 'Delete Listing',
                    variant: AppColorVariant.Danger,
                    icon: Icons.delete,
                    onPressed: () {
                      ref.read(listingFormProvider.notifier).delete(context, listing.collectionId, listing);
                    },
                  )
                ],
              ),
            )
          ],
        );
      },
    );
  }
}
