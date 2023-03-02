import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:rbx_wallet/core/base_screen.dart';
import 'package:rbx_wallet/core/components/buttons.dart';
import 'package:rbx_wallet/core/components/centered_loader.dart';
import 'package:rbx_wallet/core/theme/app_theme.dart';
import 'package:rbx_wallet/features/asset/polling_image_preview.dart';

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
          title: Text("Listing for ${listing.nft != null ? listing.nft!.name : listing.smartContractUid}"),
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Table(
                defaultColumnWidth: IntrinsicColumnWidth(),
                border: TableBorder.all(
                  color: Colors.white10,
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
                            leading: Builder(
                              builder: (context) {
                                if (nft.currentEvolveAsset.isImage) {
                                  if (nft.currentEvolveAsset.localPath == null) {
                                    return const SizedBox(
                                      width: 64,
                                      height: 64,
                                    );
                                  }

                                  return SizedBox(
                                    width: 64,
                                    height: 64,
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
                        "${DateFormat.yMd().format(listing.startDate)} - ${DateFormat.yMd().format(listing.endDate)}",
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
                            child: Text("${listing.buyNowPrice.toString()} RBX"),
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
                            child: Text("${listing.floorPrice.toString()} RBX"),
                          )
                        ])
                      : TableRow(children: [Container(), Container()]),
                  listing.reservePrice != null && listing.reservePrice != 0
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
                            child: Text("${listing.reservePrice.toString()} RBX"),
                          )
                        ])
                      : TableRow(children: [Container(), Container()]),
                ],
              ),
            ),
            Expanded(child: SizedBox.shrink()),
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Color(0xFF040f26),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    AppButton(
                      label: 'Edit Listing',
                      icon: Icons.edit,
                      variant: AppColorVariant.Light,
                      onPressed: () {
                        ref.read(listingFormProvider.notifier).load(listing);
                        AutoRouter.of(context).push(CreateListingContainerScreenRoute(storeId: listing.storeId));
                      },
                    ),
                    AppButton(
                      label: 'Delete Listing',
                      variant: AppColorVariant.Danger,
                      icon: Icons.fire_hydrant,
                      onPressed: () {
                        ref.read(listingFormProvider.notifier).delete(context, listing.storeId, listing);
                      },
                    )
                  ],
                ),
              ),
            )
          ],
        );
      },
    );
  }
}
