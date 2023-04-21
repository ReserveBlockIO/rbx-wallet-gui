import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:context_menus/context_menus.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pinch_zoom/pinch_zoom.dart';
import 'package:rbx_wallet/core/base_component.dart';
import 'package:rbx_wallet/core/breakpoints.dart';
import 'package:rbx_wallet/core/components/buttons.dart';
import 'package:rbx_wallet/core/env.dart';
import 'package:rbx_wallet/core/theme/app_theme.dart';
import 'package:rbx_wallet/core/web_router.gr.dart';
import 'package:rbx_wallet/features/dst/providers/listing_detail_provider.dart';
import 'package:rbx_wallet/features/web_shop/models/web_listing.dart';
import 'package:rbx_wallet/features/web_shop/providers/create_web_listing_provider.dart';
import 'package:rbx_wallet/features/web_shop/providers/web_listing_detail_provider.dart';
import 'package:rbx_wallet/utils/toast.dart';

import '../../../core/app_router.gr.dart';
import '../../../core/dialogs.dart';
import '../../../core/providers/session_provider.dart';
import '../../../core/providers/web_session_provider.dart';
import '../models/web_nft.dart';

class WebListingDetails extends BaseComponent {
  final WebListing listing;
  const WebListingDetails({super.key, required this.listing});

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    final nft = listing.nft;

    return ContextMenuRegion(
      contextMenu: GenericContextMenu(
        buttonConfigs: [
          ContextMenuButtonConfig('Edit Listing', onPressed: () {
            print("edit listing ${listing.id}");
          })
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (nft == null) Text(listing.smartContractUid),
            if (nft != null) ...[
              _Details(listing: listing),
              _Preview(listing: listing),
              if (listing.canBuyNow) _BuyNow(listing: listing),
              _WebNftDetails(nft: nft),
              _WebNftData(nft: nft),
            ]
            // _Features(nft: nft),
          ],
        ),
      ),
    );
  }

  @override
  Widget desktopBody(BuildContext context, WidgetRef ref) {
    final nft = listing.nft;
    final myAddress = kIsWeb ? ref.read(webSessionProvider).keypair?.public : ref.read(sessionProvider).currentWallet?.address;

    print("listing address: ${listing.ownerAddress} myAddress: $myAddress");
    return ContextMenuRegion(
      contextMenu: GenericContextMenu(
        buttonConfigs: [
          if (listing.ownerAddress == myAddress) ...[
            ContextMenuButtonConfig(
              'Edit Listing',
              onPressed: () async {
                ref.read(createWebListingProvider.notifier).load(listing, listing.collection.id, listing.collection.shop!.id);
                if (Env.isWeb) {
                  AutoRouter.of(context).push(CreateWebListingScreenRoute(shopId: listing.collection.shop!.id, collectionId: listing.collection.id));
                } else {
                  AutoRouter.of(context)
                      .push(DebugWebListingCreateScreenRoute(shopId: listing.collection.shop!.id, collectionId: listing.collection.id));
                }
              },
              icon: Icon(Icons.edit),
            ),
            ContextMenuButtonConfig(
              'Delete Listing',
              onPressed: () async {
                final confirmed = await ConfirmDialog.show(
                  title: "Delete Listing",
                  body: "Are you sure you want to delete this listing?",
                  confirmText: "Delete",
                  cancelText: "Cancel",
                );
                if (confirmed == true) {
                  ref.read(createWebListingProvider.notifier).delete(context, listing.collection.shop!.id, listing);
                }
              },
              icon: Icon(Icons.delete),
            ),
          ],
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: _Preview(listing: listing),
            ),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 600),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (nft == null) Text(listing.smartContractUid),
                  if (nft != null) ...[
                    _Details(listing: listing),
                    const SizedBox(height: 8),
                    _WebNftDetails(nft: nft),
                    const SizedBox(height: 16),
                    _WebNftData(nft: nft),
                    const SizedBox(height: 8),
                  ],
                  Row(
                    children: [
                      if (listing.canBuyNow) _BuyNow(listing: listing),
                      if (listing.canBuyNow && listing.canBid)
                        SizedBox(
                          width: 8,
                        ),
                      if (listing.canBid) _Auction(listing: listing),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Preview extends StatefulWidget {
  const _Preview({
    super.key,
    required this.listing,
  });

  final WebListing listing;

  @override
  State<_Preview> createState() => _PreviewState();
}

class _PreviewState extends State<_Preview> {
  int selectedIndex = 0;
  bool rebuilding = false;

  late CarouselController controller;

  @override
  void initState() {
    super.initState();
    controller = CarouselController();
  }

  @override
  Widget build(BuildContext context) {
    if (rebuilding) {
      return SizedBox();
    }

    final isMobile = BreakPoints.useMobileLayout(context);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            boxShadow: [
              BoxShadow(
                offset: Offset.zero,
                blurRadius: 5,
                color: Theme.of(context).colorScheme.secondary.withOpacity(0.1),
                spreadRadius: 4,
              )
            ],
          ),
          child: Padding(
              padding: const EdgeInsets.all(3.0),
              child: SizedBox(
                width: isMobile ? double.infinity : 320,
                child: CarouselSlider(
                  carouselController: controller,
                  options: CarouselOptions(
                    viewportFraction: 1,
                    autoPlay: false,
                    onPageChanged: (i, _) {
                      setState(() {
                        selectedIndex = i;
                      });
                    },
                  ),
                  items: widget.listing.thumbnails.map((path) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 0),
                      child: GestureDetector(
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: PinchZoom(
                                      child: CachedNetworkImage(
                                        imageUrl: path,
                                        width: double.infinity,
                                        height: double.infinity,
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                );
                              });
                        },
                        child: CachedNetworkImage(
                          imageUrl: path,
                          errorWidget: (context, _, __) {
                            // return Text(path);
                            return Center(
                              child: IconButton(
                                icon: Icon(Icons.refresh),
                                onPressed: () async {
                                  setState(() {
                                    rebuilding = true;
                                  });
                                  await FileImage(File(path)).evict();

                                  Future.delayed(Duration(milliseconds: 300)).then((value) {
                                    setState(() {
                                      rebuilding = false;
                                    });
                                  });
                                },
                              ),
                            );
                          },
                        ),
                      ),
                    );
                  }).toList(),
                ),
              )),
        ),
        const SizedBox(
          height: 8,
        ),
        if (widget.listing.thumbnails.length > 1)
          SizedBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: Icon(Icons.chevron_left),
                  onPressed: () {
                    controller.previousPage();
                  },
                ),
                DotsIndicator(
                  dotsCount: widget.listing.thumbnails.length,
                  position: selectedIndex.toDouble(),
                  decorator: const DotsDecorator(
                    activeColor: Colors.white,
                    color: Colors.white54,
                    size: Size.fromRadius(3),
                    activeSize: Size.fromRadius(4),
                  ),
                  onTap: (v) {
                    print(v);
                    controller.animateToPage(v.round());
                  },
                ),
                IconButton(
                  icon: Icon(Icons.chevron_right),
                  onPressed: () {
                    controller.nextPage();
                  },
                ),
              ],
            ),
          )
      ],
    );
  }
}

class _Details extends BaseComponent {
  final WebListing listing;
  const _Details({
    super.key,
    required this.listing,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final myAddress = kIsWeb ? ref.read(webSessionProvider).keypair?.public : ref.read(sessionProvider).currentWallet?.address;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                listing.nft.name,
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
            // if (withShareButtons) buildShareButtons(context),

            if (listing.ownerAddress == myAddress)
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AppButton(
                    label: "Edit",
                    icon: Icons.edit,
                    variant: AppColorVariant.Light,
                    type: AppButtonType.Text,
                    onPressed: () {
                      ref.read(createWebListingProvider.notifier).load(listing, listing.collection.id, listing.collection.shop!.id);
                      if (Env.isWeb) {
                        AutoRouter.of(context)
                            .push(CreateWebListingScreenRoute(shopId: listing.collection.shop!.id, collectionId: listing.collection.id));
                      } else {
                        AutoRouter.of(context)
                            .push(DebugWebListingCreateScreenRoute(shopId: listing.collection.shop!.id, collectionId: listing.collection.id));
                      }
                    },
                  ),
                  SizedBox(
                    width: 6,
                  ),
                  AppButton(
                    label: "Delete",
                    icon: Icons.delete,
                    variant: AppColorVariant.Danger,
                    type: AppButtonType.Text,
                    onPressed: () async {
                      final confirmed = await ConfirmDialog.show(
                        title: "Delete Listing",
                        body: "Are you sure you want to delete this listing?",
                        confirmText: "Delete",
                        cancelText: "Cancel",
                      );
                      if (confirmed == true) {
                        ref.read(createWebListingProvider.notifier).delete(context, listing.collection.shop!.id, listing);
                      }
                    },
                  )
                ],
              )
          ],
        ),
        const SizedBox(height: 8),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 600),
          child: Text(listing.nft.description),
        ),
      ],
    );
  }
}

// class _Features extends StatelessWidget {
//   final WebNft nft;
//   const _Features({super.key, required this.nft});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8.0),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text("NFT Features:", style: Theme.of(context).textTheme.headline5),
//           Builder(
//             builder: (context) {
//               if (nft.features.isEmpty) {
//                 return Padding(
//                   padding: const EdgeInsets.symmetric(vertical: 8.0),
//                   child: Row(
//                     mainAxisSize: MainAxisSize.min,
//                     children: const [
//                       Icon(
//                         Icons.cancel,
//                         size: 16,
//                         color: Colors.white54,
//                       ),
//                       Padding(
//                         padding: EdgeInsets.only(left: 4.0),
//                         child: Text(
//                           "No Smart Contract Features",
//                           style: TextStyle(fontSize: 14, color: Colors.white54),
//                         ),
//                       ),
//                     ],
//                   ),
//                 );
//               }

//               return Column(
//                 mainAxisSize: MainAxisSize.min,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: nft.featureList
//                     .map(
//                       (f) => ConstrainedBox(
//                         constraints: const BoxConstraints(maxWidth: 300),
//                         child: ListTile(
//                           dense: true,
//                           visualDensity: VisualDensity.compact,
//                           contentPadding: EdgeInsets.zero,
//                           leading: Icon(f.icon),
//                           title: Text(f.nameLabel),
//                           subtitle: Text(f.description),
//                         ),
//                       ),
//                     )
//                     .toList(),
//               );
//             },
//           )
//         ],
//       ),
//     );
//   }
// }

class _WebNftDetails extends StatelessWidget {
  final WebNft nft;
  const _WebNftDetails({super.key, required this.nft});

  @override
  Widget build(BuildContext context) {
    final headingStyle = TextStyle(
      fontWeight: FontWeight.w600,
      letterSpacing: 1,
      color: Theme.of(context).colorScheme.secondary,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            style: const TextStyle(
              fontSize: 18,
              color: Colors.white,
              height: 1.4,
            ),
            children: [
              TextSpan(text: "NFT Name: ", style: headingStyle),
              TextSpan(text: nft.name),
              const TextSpan(text: "\n"),
              TextSpan(text: "NFT Description: ", style: headingStyle),
              TextSpan(text: nft.description.replaceAll("\\n", "\n")),
            ],
          ),
        ),
        const SizedBox(
          height: 8,
        ),
      ],
    );
  }
}

class _WebNftData extends StatelessWidget {
  final WebNft nft;

  const _WebNftData({
    super.key,
    required this.nft,
  });

  TableRow buildDetailRow(BuildContext context, String label, String value, [bool copyValue = false]) {
    final isMobile = BreakPoints.useMobileLayout(context);

    if (isMobile) {
      return TableRow(children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "$label: ",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(value),
            const SizedBox(
              height: 6,
            ),
          ],
        ),
      ]);
    }
    return TableRow(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 6.0),
          child: Text(
            "$label: ",
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(width: 8),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 6.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(value),
              const SizedBox(width: 8),
              if (copyValue)
                InkWell(
                    onTap: () async {
                      await Clipboard.setData(ClipboardData(text: value));

                      Toast.message("$label copied to clipboard");
                    },
                    child: const Icon(Icons.copy, size: 12)),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Details",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          const SizedBox(height: 8),
          Table(
            defaultColumnWidth: const IntrinsicColumnWidth(),
            children: [
              buildDetailRow(context, "Identifier", nft.identifier, true),
              buildDetailRow(context, "Minted By", nft.minterName),
              buildDetailRow(context, "Chain", "RBX"),
              //TODO: Auction stuff
            ],
          ),
        ],
      ),
    );
  }
}

class _BuyNow extends StatelessWidget {
  final WebListing listing;
  const _BuyNow({super.key, required this.listing});

  @override
  Widget build(BuildContext context) {
    if (listing.buyNowPrice == null) {
      return SizedBox.shrink();
    }

    final isMobile = BreakPoints.useMobileLayout(context);
    return SizedBox(
      width: isMobile ? double.infinity : null,
      child: Card(
        color: Theme.of(context).colorScheme.primary.withOpacity(0.4),
        margin: EdgeInsets.zero,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Buy Now",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                  letterSpacing: 1,
                ),
              ),
              const SizedBox(height: 8),
              _Price(
                label: "Price",
                amount: listing.buyNowPrice!,
              ),
              const SizedBox(height: 16),
              AppButton(
                label: "Buy Now",
                icon: Icons.money,
                size: AppSizeVariant.Lg,
                onPressed: () {
                  // handlePurchase(context, ref);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Price extends StatelessWidget {
  final String label;
  final double amount;
  final Color priceColor;
  const _Price({
    super.key,
    required this.label,
    required this.amount,
    this.priceColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          "$label: ",
          style: TextStyle(
            fontSize: 18,
            color: Theme.of(context).colorScheme.secondary,
            fontWeight: FontWeight.w600,
            letterSpacing: 1,
          ),
        ),
        Text(
          "$amount RBX",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: priceColor,
          ),
        )
      ],
    );
  }
}

class _Auction extends StatelessWidget {
  final WebListing listing;
  const _Auction({
    super.key,
    required this.listing,
  });

  @override
  Widget build(BuildContext context) {
    if (listing.floorPrice == null) {
      return SizedBox.shrink();
    }

    final isMobile = BreakPoints.useMobileLayout(context);
    return SizedBox(
      width: isMobile ? double.infinity : null,
      child: Card(
        color: Theme.of(context).colorScheme.primary.withOpacity(0.4),
        margin: EdgeInsets.zero,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Auction",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                  letterSpacing: 1,
                ),
              ),
              const SizedBox(height: 8),

              _Price(label: "Floor Price", amount: listing.floorPrice!),
              // if (listing.highestBid != null)
              //   buildPrice(
              //     context,
              //     "Highest Bid",
              //     listing.allowRbx ? listing.highestBid!.amountLabel : listing.highestBid!.amountLabelWithoutRbx,
              //     Theme.of(context).colorScheme.success,
              //   ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppButton(
                      label: "Bid Now",
                      icon: Icons.gavel,
                      size: AppSizeVariant.Lg,
                      onPressed: () {
                        //TODO
                      }),
                  const SizedBox(
                    width: 6,
                  ),
                  AppButton(
                    label: "History",
                    icon: Icons.punch_clock,
                    size: AppSizeVariant.Lg,
                    onPressed: () {
                      //TODO
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
