import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:rbx_wallet/core/base_screen.dart';
import 'package:rbx_wallet/core/components/buttons.dart';
import 'package:rbx_wallet/core/components/centered_loader.dart';
import 'package:rbx_wallet/core/theme/app_theme.dart';

import '../../../core/app_router.gr.dart';
import '../providers/listing_detail_provider.dart';
import '../providers/listing_form_provider.dart';

class ListingDetailScreen extends BaseScreen {
  final int listingId;
  const ListingDetailScreen({
    Key? key,
    @PathParam("listingId") required this.listingId,
  }) : super(key: key);

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
          title: Text("Listing for: {NFT name}"),
        );
      },
    );
  }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    final data = ref.watch(listingDetailProvider(listingId));

    return data.when(
      loading: () => CenteredLoader(),
      error: (_, __) => Center(child: Text("An error occurred.")),
      data: (listing) {
        if (listing == null) {
          return Center(child: Text("An error occurred."));
        }
        return Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: Center(
                  child: Table(
                    children: [
                      TableRow(children: [
                        Text('NFT'),
                        Text('{NFT name}'),
                      ]),
                      TableRow(children: [
                        Text('Owner'),
                        Text(listing.ownerAddress),
                      ]),
                      TableRow(children: [
                        Text('Dates'),
                        Text(
                          "${DateFormat.yMd().format(listing.startDate)} - ${DateFormat.yMd().format(listing.endDate)}",
                        ),
                      ]),
                      TableRow(children: [
                        Text('Options'),
                        Row(
                          children: [
                            Text('Buy now [${listing.buyNowPrice != 0 ? "✓" : " "}]'),
                            SizedBox(
                              width: 10,
                            ),
                            Text('Auction [${listing.reservePrice != 0 || listing.floorPrice != 0 ? "✓" : " "}]'),
                          ],
                        )
                      ]),
                      listing.buyNowPrice != 0
                          ? TableRow(children: [Text('Buy Now Price'), Text("${listing.buyNowPrice.toString()} RBX")])
                          : TableRow(children: [Container(), Container()]),
                      listing.floorPrice != 0
                          ? TableRow(children: [Text('Auction Floor Price'), Text("${listing.floorPrice.toString()} RBX")])
                          : TableRow(children: [Container(), Container()]),
                      listing.reservePrice != 0
                          ? TableRow(children: [Text('Auction Reserve Price'), Text("${listing.reservePrice.toString()} RBX")])
                          : TableRow(children: [Container(), Container()]),
                    ],
                  ),
                ),
              ),
              Expanded(child: SizedBox.shrink()),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  AppButton(
                    label: 'Edit Listing',
                    icon: Icons.edit,
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
              )
            ],
          ),
        );
      },
    );
  }
}
