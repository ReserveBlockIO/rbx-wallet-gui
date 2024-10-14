import 'dart:async';
import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../../../core/app_constants.dart';
import '../../../core/theme/components.dart';
import '../../../core/base_component.dart';
import '../../../core/breakpoints.dart';
import '../../../core/components/buttons.dart';
import '../../../core/components/centered_loader.dart';
import '../../../core/components/countdown.dart';
import '../../../core/dialogs.dart';
import '../../../core/theme/app_theme.dart';
import '../../../core/theme/colors.dart';
import '../../global_loader/global_loading_provider.dart';
import '../../nft/components/nft_qr_code.dart';
import '../../nft/models/nft.dart';
import 'bid_history_modal.dart';
import '../models/shop_data.dart';
import '../providers/bid_list_provider.dart';
import '../providers/carousel_memory_provider.dart';
import '../providers/connected_shop_provider.dart';
import '../providers/thumbnail_fetcher_provider.dart';
import '../services/remote_shop_service.dart';
import '../../sc_property/models/sc_property.dart';
import '../../../utils/files.dart';
import '../../../utils/toast.dart';

class ListingDetails extends BaseComponent {
  final OrganizedListing listing;
  const ListingDetails({super.key, required this.listing});

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    final nft = listing.nft;
    if (nft == null) {
      return SizedBox.shrink();
    }

    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _AuctionDataWatcher(listing.id),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _Preview(
                      nft: nft,
                      initialIndex: ref.watch(carouselMemoryProvider(nft.id)),
                      onPageChange: (i) {
                        ref.read(carouselMemoryProvider(nft.id).notifier).update(i);
                      },
                    ),
                    _Features(nft: nft),
                    _Properties(nft: nft),
                    _QRCode(
                      nft: nft,
                      size: 150,
                    ),
                  ],
                ),
              ),
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 600),
                child: Center(
                  child: Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Row(
                      children: [
                        _Details(
                          nft: nft,
                          listing: listing,
                        ),
                        // TODO: Get back to sharing
                        // AppButton(
                        //   label: "Share Listing",
                        //   icon: Icons.ios_share_rounded,
                        //   variant: AppColorVariant.Light,
                        //   type: AppButtonType.Text,
                        //   onPressed: () async {
                        //     await Clipboard.setData(ClipboardData(
                        //         text:
                        //             "${Env.appBaseUrl}/#dashboard/p2p/shop/${listing.}/collection/${listing.collectionId}/listing/${listing.id}"));
                        //     Toast.message("Share url copied to clipboard");
                        //   },
                        // ),
                      ],
                    ),
                    // const SizedBox(height: 8),
                    // _NftDetails(nft: nft),
                    const SizedBox(height: 16),
                    _NftData(nft: nft, listing: listing),
                    const SizedBox(height: 8),
                    if (listing.canBid) IntrinsicWidth(child: _Auction(listing: listing)),
                    if (listing.canBuyNow && listing.canBid) SizedBox(height: 16),
                    if (listing.canBuyNow) IntrinsicWidth(child: _BuyNow(listing: listing)),
                    const SizedBox(height: 16),
                    if (listing.canBuyNow || listing.canBid) _Countdown(listing: listing),
                    if (!listing.hasStarted && !listing.isGallery)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "Auction Upcoming",
                            style: TextStyle(fontSize: 28, fontWeight: FontWeight.w700),
                          ),
                          Text(
                            "Begins: ${DateFormat.yMd().format(listing.startDate)} ${DateFormat("HH:mm").format(listing.startDate)}",
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    if (listing.auction?.isAuctionOver == true)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "Auction Has Ended",
                            style: TextStyle(fontSize: 28, fontWeight: FontWeight.w700),
                          ),
                          if (listing.auction!.currentWinningAddress.isNotEmpty &&
                              listing.auction!.currentWinningAddress != listing.addressOwner &&
                              listing.auction!.isReserveMet)
                            Padding(
                              padding: const EdgeInsets.only(top: 16.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: const Color(0xFF040f26),
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
                                    padding: const EdgeInsets.all(8.0),
                                    // child: SelectableText(
                                    //   "Purchased by: ${listing.auction!.currentWinningAddress} for ${listing.auction!.currentBidPrice} VFX",
                                    //   style: TextStyle(
                                    //     fontSize: 16,
                                    //   ),
                                    // ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        RichText(
                                          text: TextSpan(style: TextStyle(fontSize: 16), children: [
                                            TextSpan(text: "Purchased by: "),
                                            TextSpan(
                                              text: "${listing.auction!.currentWinningAddress} ",
                                              style: TextStyle(
                                                color: Theme.of(context).colorScheme.secondary,
                                              ),
                                            ),
                                            TextSpan(text: "for "),
                                            TextSpan(
                                              text: "${listing.auction!.currentBidPrice} VFX",
                                              style: TextStyle(
                                                color: Theme.of(context).colorScheme.secondary,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ]),
                                        ),
                                        SizedBox(width: 8),
                                        InkWell(
                                          onTap: () async {
                                            await Clipboard.setData(ClipboardData(text: listing.auction!.currentWinningAddress));
                                            Toast.message("Address copied to clipboard");
                                          },
                                          child: Icon(
                                            Icons.copy,
                                            size: 16,
                                          ),
                                        ),
                                      ],
                                    )),
                              ),
                            ),
                          if (listing.floorPrice != null)
                            Padding(
                              padding: const EdgeInsets.only(top: 16.0),
                              child: BidHistoryButton(listing: listing),
                            )
                        ],
                      )
                  ]),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class _Preview extends StatefulWidget {
  final Nft nft;
  final int initialIndex;
  final Function(int index) onPageChange;

  const _Preview({
    required this.nft,
    this.initialIndex = 0,
    required this.onPageChange,
  });

  @override
  State<_Preview> createState() => _PreviewState();
}

class _PreviewState extends State<_Preview> {
  late int selectedIndex;
  bool rebuilding = false;

  late CarouselController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedIndex = widget.initialIndex;

    controller = CarouselController();
  }

  @override
  Widget build(BuildContext context) {
    // if (rebuilding) {
    //   return SizedBox();
    // }

    final isMobile = BreakPoints.useMobileLayout(context);

    final assets = [widget.nft.primaryAsset, ...widget.nft.additionalAssets];
    final fileNames = assets.map((a) {
      return a.fileName;
    }).toList();

    final paths = assets.map((a) {
      final filename = a.name;
      final ds = Platform.isMacOS ? "/" : "\\";
      final path = "${widget.nft.thumbsPath}$ds$filename";

      // final updatedFileName = path.replaceAll(".pdf", ".jpg").replaceAll(".png", ".jpg");

      return path;

      // final ext = path.split(".").last.toLowerCase();
      // final imageExtensions = ['jpg', 'jpeg', 'gif', 'png', 'webp'];
    }).toList();

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        AppCard(
          padding: 0,
          child: SizedBox(
            width: isMobile ? double.infinity : 320,
            child: CarouselSlider(
              carouselController: controller,
              options: CarouselOptions(
                viewportFraction: 1,
                initialPage: widget.initialIndex,
                // autoPlay: BreakPoints.useMobileLayout(context) ? false : true,
                autoPlay: false,
                onPageChanged: (i, _) {
                  setState(() {
                    selectedIndex = i;
                  });
                  widget.onPageChange(i);
                },
              ),
              items: paths.map((path) {
                final fileType = fileTypeFromPath(path);
                final extension = path.split(".").last.toLowerCase();

                final showThumbnail = fileType == "Image" || extension == "pdf";
                final icon = iconFromPath(path);

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
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Image.file(
                                    File(path
                                        .replaceAll(".pdf", ".jpg")
                                        .replaceAll(".png", ".jpg")
                                        .replaceAll(".jpeg", ".jpg")
                                        .replaceAll(".gif", ".jpg")
                                        .replaceAll(".webp", ".jpg")),
                                    fit: BoxFit.contain,
                                    width: 512,
                                    height: 512,
                                  ),
                                ),
                              ),
                            );
                          });
                    },
                    child: showThumbnail
                        ? Consumer(builder: (context, ref, _) {
                            return _Thumbnail(
                              path: path,
                              scId: widget.nft.id,
                              ref: ref,
                              fileNames: fileNames,
                              fallbackIcon: icon,
                              // originalExtension: extension.toLowerCase(),
                            );
                          })
                        : Center(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  icon,
                                  size: 32,
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Text(fileNameFromPath(path)),
                              ],
                            ),
                          ),
                  ),
                );
              }).toList(),
            ),
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        if (paths.length > 1)
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
                  dotsCount: paths.length,
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

class _Details extends StatelessWidget {
  const _Details({
    required this.listing,
    required this.nft,
  });

  final Nft nft;
  final OrganizedListing listing;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "#${listing.id}\n${nft.name}",
          style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                color: AppColors.getBlue(),
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 8),
        ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 600),
            child: RichText(
              text: TextSpan(text: nft.description.replaceAll("\\n", "\n")),
            )),
      ],
    );
  }
}

class _Features extends StatelessWidget {
  final Nft nft;
  const _Features({required this.nft});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "NFT Features:",
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  color: Colors.white,
                ),
          ),
          Builder(
            builder: (context) {
              if (nft.features.isEmpty) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Icon(
                        Icons.cancel,
                        size: 16,
                        color: Colors.white54,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 4.0),
                        child: Text(
                          "Baseline Asset",
                          style: TextStyle(fontSize: 14, color: Colors.white54),
                        ),
                      ),
                    ],
                  ),
                );
              }

              return Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: nft.featureList
                    .map(
                      (f) => ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 300),
                        child: ListTile(
                          dense: true,
                          visualDensity: VisualDensity.compact,
                          contentPadding: EdgeInsets.zero,
                          leading: Icon(f.icon),
                          title: Text(f.nameLabel),
                          subtitle: Text(f.description),
                        ),
                      ),
                    )
                    .toList(),
              );
            },
          ),
        ],
      ),
    );
  }
}

class _NftDetails extends StatelessWidget {
  final Nft nft;
  const _NftDetails({required this.nft});

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

class _NftData extends StatelessWidget {
  final Nft nft;
  final OrganizedListing listing;

  const _NftData({
    required this.nft,
    required this.listing,
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
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: Colors.white,
              letterSpacing: 1,
              decoration: TextDecoration.underline,
            ),
          ),
          const SizedBox(height: 8),
          Table(
            border: TableBorder(
                horizontalInside: BorderSide(
              color: Colors.white12,
            )),
            defaultColumnWidth: const IntrinsicColumnWidth(),
            children: [
              buildDetailRow(context, "Identifier", nft.id, true),
              buildDetailRow(context, "Owner Address", nft.currentOwner, true),
              // buildDetailRow(context, "Minted On", nft.mintedAt),
              buildDetailRow(context, "Minted By", nft.minterName),
              buildDetailRow(context, "Minter Address", nft.minterAddress, true),
              buildDetailRow(context, "Chain", "VFX"),
            ],
          ),
        ],
      ),
    );
  }
}

class _BuyNow extends BaseComponent {
  final OrganizedListing listing;
  const _BuyNow({required this.listing});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (listing.buyNowPrice == null) {
      return SizedBox.shrink();
    }

    final provider = ref.read(bidListProvider(listing.familyIdentifier).notifier);

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Buy Now",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: Colors.white,
            letterSpacing: 1,
            decoration: TextDecoration.underline,
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
          onPressed: () async {
            if (!ref.read(connectedShopProvider).isConnected) {
              Toast.error("This shop is currently offline.");
              return;
            }
            // showDialog(
            //   context: context,
            //   builder: (context) {
            //     return BuyNowProgressModal(smartContractUid: listing.smartContractUid);
            //   },
            // );
            // return;

            final success = await provider.buyNow(context, listing);

            if (success == true) {
              Toast.message("Buy Now transaction sent successfully. Please wait for confirmation.");
            } else {
              Toast.error();
            }
          },
        ),
      ],
    );
  }
}

class _Price extends StatelessWidget {
  final String label;
  final double amount;
  const _Price({
    required this.label,
    required this.amount,
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
          "$amount VFX",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        )
      ],
    );
  }
}

class _Auction extends BaseComponent {
  final OrganizedListing listing;
  const _Auction({
    required this.listing,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentBids = ref.watch(bidListProvider(listing.familyIdentifier));
    final provider = ref.read(bidListProvider(listing.familyIdentifier).notifier);

    if (listing.floorPrice == null) {
      return SizedBox.shrink();
    }

    final isMobile = BreakPoints.useMobileLayout(context);
    return SizedBox(
      width: isMobile ? double.infinity : null,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Auction",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: Colors.white,
              letterSpacing: 1,
              decoration: TextDecoration.underline,
            ),
          ),
          const SizedBox(height: 8),
          if (listing.auction != null) ...[
            listing.floorPrice == listing.auction!.currentBidPrice
                ? _Price(label: "Floor Price", amount: listing.floorPrice!)
                : _Price(
                    label: "Highest Bid",
                    amount: listing.auction!.currentBidPrice,
                  )
          ],
          const SizedBox(height: 16),
          Row(
            children: [
              AppButton(
                  label: "Bid Now",
                  icon: Icons.gavel,
                  size: AppSizeVariant.Lg,
                  onPressed: () async {
                    if (!ref.read(connectedShopProvider).isConnected) {
                      Toast.error("This shop is currently offline.");
                      return;
                    }

                    final success = await provider.sendBid(context, listing);
                    if (success == true) {
                      Toast.message("Bid sent. Please check the Bid History to see if it's been accepted or rejected.");
                    }
                  }),
              const SizedBox(width: 8),
              BidHistoryButton(listing: listing),
              const SizedBox(width: 8),
              if (listing.auction != null)
                AppButton(
                  label: "Details",
                  icon: Icons.info,
                  size: AppSizeVariant.Lg,
                  onPressed: () async {
                    if (!ref.read(connectedShopProvider).isConnected) {
                      Toast.error("Warning: This shop is currently offline so the information may not be up to date.");
                    }
                    final auction = listing.auction!;

                    InfoDialog.show(
                      title: "Auction Details",
                      content: _AuctionInfoDialogContent(
                        auction: auction,
                      ),
                    );
                  },
                ),
            ],
          ),
        ],
      ),
    );
  }
}

class BidHistoryButton extends BaseComponent {
  const BidHistoryButton({
    super.key,
    required this.listing,
  });

  final OrganizedListing listing;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.read(bidListProvider(listing.familyIdentifier).notifier);

    return AppButton(
      label: "Bid History",
      icon: Icons.punch_clock,
      size: AppSizeVariant.Lg,
      onPressed: () async {
        if (!ref.read(connectedShopProvider).isConnected) {
          Toast.error("Warning: This shop is currently offline so the information may not be up to date.");
          await Future.delayed(Duration(seconds: 3));
        }

        ref.read(globalLoadingProvider.notifier).start();
        final bids = await provider.fetchBids(listing);

        ref.read(globalLoadingProvider.notifier).complete();

        if (bids.isEmpty) {
          Toast.message("No bids.");
          return;
        }

        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          builder: (context) {
            return BidHistoryModal(
              bids: bids,
            );
          },
        );
      },
    );
  }
}

class _AuctionInfoDialogContent extends StatelessWidget {
  const _AuctionInfoDialogContent({
    required this.auction,
  });

  final OrganizedAuction auction;

  @override
  Widget build(BuildContext context) {
    final labelStyle = TextStyle(fontWeight: FontWeight.w600);
    final valueStyle = TextStyle();

    return SizedBox(
      width: 300,
      child: Table(
        columnWidths: {
          0: IntrinsicColumnWidth(),
          1: IntrinsicColumnWidth(),
        },
        children: [
          TableRow(
            children: [
              Text(
                "Current Bid Price:",
                style: labelStyle,
              ),
              Text(
                "${auction.currentBidPrice} VFX",
                style: valueStyle,
              )
            ],
          ),
          // TableRow(
          //   children: [
          //     Text(
          //       "Max Bid Price:",
          //       style: labelStyle,
          //     ),
          //     Text(
          //       "${auction.maxBidPrice} VFX",
          //       style: valueStyle,
          //     )
          //   ],
          // ),
          TableRow(
            children: [
              Text(
                "Increment Amount:",
                style: labelStyle,
              ),
              Text(
                "${auction.incrementAmount} VFX",
                style: valueStyle,
              )
            ],
          ),
          TableRow(
            children: [
              Text(
                "Reserve Met:",
                style: labelStyle,
              ),
              Text(
                auction.isReserveMet ? "Yes" : "No",
                style: valueStyle,
              )
            ],
          ),
          TableRow(
            children: [
              Text(
                "Active:",
                style: labelStyle,
              ),
              Text(
                auction.isAuctionOver ? "Completed" : "Yes",
                style: valueStyle,
              )
            ],
          ),
        ],
      ),
    );
  }
}

class _Countdown extends StatelessWidget {
  final OrganizedListing listing;
  const _Countdown({required this.listing});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: BreakPoints.useMobileLayout(context) ? CrossAxisAlignment.stretch : CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (listing.isActive)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: AppCountdown(
              dueDate: listing.endDate,
              prefix: listing.floorPrice != null ? "Auction Ends" : "Ends in",
            ),
          ),
        if (!listing.hasStarted)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: AppCountdown(
              dueDate: listing.startDate,
              prefix: "Auction Starts",
            ),
          ),
      ],
    );
  }
}

class _Thumbnail extends StatefulWidget {
  final String path;
  final List<String> fileNames;
  final String scId;
  final WidgetRef ref;
  final IconData fallbackIcon;
  const _Thumbnail({
    required this.path,
    required this.fileNames,
    required this.scId,
    required this.ref,
    required this.fallbackIcon,
  });

  @override
  State<_Thumbnail> createState() => __ThumbnailState();
}

class __ThumbnailState extends State<_Thumbnail> {
  bool rebuilding = false;
  bool thumbnailReady = false;
  int attempts = 0;

  @override
  void initState() {
    super.initState();
    init();
  }

  bool checkSingleFile(String p) {
    bool ready = true;
    if (!File(p).existsSync()) {
      ready = false;
    } else {
      if (File(p).lengthSync() < 1) {
        ready = false;
      }
    }

    return ready;
  }

  Future<void> init() async {
    final updatedFileName = widget.path
        .replaceAll(".pdf", ".jpg")
        .replaceAll(".png", ".jpg")
        .replaceAll(".jpeg", ".jpg")
        .replaceAll(".gif", ".jpg")
        .replaceAll(".webp", ".jpg");

    final ready = checkSingleFile(updatedFileName);

    if (!ready) {
      await Future.delayed(Duration(seconds: 1));
      setState(() {
        attempts += 1;
      });
      init();
    } else {
      setState(() {
        thumbnailReady = true;
      });
    }

    // final provider = widget.ref.read(thumbnailFetcherProvider.notifier);

    // final ready = provider.thumbnailReady(widget.scId);
    // if (ready) {
    //   return;
    // }

    // provider.addToQueue(widget.scId, widget.fileNames);
  }

  @override
  Widget build(BuildContext context) {
    final updatedFileName = widget.path
        .replaceAll(".pdf", ".jpg")
        .replaceAll(".png", ".jpg")
        .replaceAll(".jpeg", ".jpg")
        .replaceAll(".gif", ".jpg")
        .replaceAll(".webp", ".jpg");

    if (!thumbnailReady) {
      if (attempts > 60) {
        return Center(child: Icon(widget.fallbackIcon));
      }

      return CenteredLoader();
    }

    return Image.file(
      File(updatedFileName),
      errorBuilder: (context, err, __) {
        return Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: Icon(Icons.refresh),
                onPressed: () async {
                  await File(updatedFileName).delete();
                  await Future.delayed(Duration(milliseconds: 100));
                  FileImage(File(updatedFileName)).evict();
                  widget.ref.read(thumbnailFetcherProvider.notifier).addToQueue(widget.scId, widget.fileNames, true);
                },
              ),
              Text(
                err.toString(),
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
        );
      },
    );
  }
}

class _QRCode extends StatelessWidget {
  final double size;
  final Nft nft;
  const _QRCode({
    required this.nft,
    this.size = 260,
  });

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: size),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          NftQrCode(
            data: nft.explorerUrl,
            size: size,
            bgColor: Colors.transparent,
            cardPadding: 0,
            withOpen: true,
            iconButtons: true,
          ),
        ],
      ),
    );
  }
}

class _Properties extends StatelessWidget {
  final Nft nft;
  const _Properties({
    required this.nft,
  });

  @override
  Widget build(BuildContext context) {
    if (nft.properties.isEmpty) {
      return SizedBox.shrink();
    }
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: 260),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Properties:",
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  color: Colors.white,
                ),
          ),
          SizedBox(height: 6),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: nft.properties
                .where((element) => element.name != BACKUP_URL_PROPERTY_NAME)
                .map((p) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: AppCard(
                        padding: 8,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 4),
                              child: Builder(builder: (context) {
                                switch (p.type) {
                                  case ScPropertyType.color:
                                    return Icon(
                                      Icons.color_lens,
                                      color: colorFromHex(p.value),
                                      size: 14,
                                    );
                                  case ScPropertyType.number:
                                    return Icon(Icons.numbers, size: 14);
                                  default:
                                    return Icon(Icons.text_fields, size: 14);
                                }
                              }),
                            ),
                            Expanded(
                                child: Text(
                              " ${p.name}: ${p.value}",
                              style: TextStyle(
                                height: 1,
                              ),
                            )),
                          ],
                        ),
                      ),
                    ))
                .toList(),
          ),
          SizedBox(
            height: 8,
          ),
        ],
      ),
    );
  }
}

class _AuctionDataWatcher extends StatefulWidget {
  final int listingId;
  const _AuctionDataWatcher(this.listingId);

  @override
  State<_AuctionDataWatcher> createState() => __AuctionDataWatcherState();
}

class __AuctionDataWatcherState extends State<_AuctionDataWatcher> {
  late final Timer loopTimer;

  @override
  void initState() {
    super.initState();
    loopTimer = Timer.periodic(const Duration(seconds: 10), (_) => fetch());
    fetch();
  }

  fetch() async {
    final id = widget.listingId;
    RemoteShopService().requestAuctionData(id);
  }

  @override
  void dispose() {
    loopTimer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const SizedBox.shrink();
  }
}
