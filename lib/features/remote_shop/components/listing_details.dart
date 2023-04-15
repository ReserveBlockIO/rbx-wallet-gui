import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:pinch_zoom/pinch_zoom.dart';
import 'package:rbx_wallet/core/base_component.dart';
import 'package:rbx_wallet/core/breakpoints.dart';
import 'package:rbx_wallet/core/components/buttons.dart';
import 'package:rbx_wallet/core/components/centered_loader.dart';
import 'package:rbx_wallet/core/components/countdown.dart';
import 'package:rbx_wallet/core/dialogs.dart';
import 'package:rbx_wallet/core/theme/app_theme.dart';
import 'package:rbx_wallet/features/nft/models/nft.dart';
import 'package:rbx_wallet/features/remote_shop/components/bid_history_modal.dart';
import 'package:rbx_wallet/features/remote_shop/models/shop_data.dart';
import 'package:rbx_wallet/features/remote_shop/providers/bid_list_provider.dart';
import 'package:rbx_wallet/features/remote_shop/providers/thumbnail_fetcher_provider.dart';
import 'package:rbx_wallet/features/remote_shop/services/remote_shop_service.dart';
import 'package:rbx_wallet/features/remote_shop/utils.dart';
import 'package:rbx_wallet/utils/files.dart';
import 'package:rbx_wallet/utils/toast.dart';
import 'package:collection/collection.dart';

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
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          _Details(nft: nft),
          _Preview(nft: nft),
          if (listing.canBuyNow) _BuyNow(listing: listing),
          _Features(nft: nft),
          _NftDetails(nft: nft),
          _NftData(nft: nft),
          const SizedBox(height: 8),
          if (listing.canBid) _Auction(listing: listing),
          if (listing.canBuyNow && listing.canBid) SizedBox(height: 16),
          if (listing.canBuyNow) _BuyNow(listing: listing),
          _Countdown(listing: listing),
        ],
      ),
    );
  }

  @override
  Widget desktopBody(BuildContext context, WidgetRef ref) {
    final nft = listing.nft;
    if (nft == null) {
      return SizedBox.shrink();
    }

    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
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
                    _Preview(nft: nft),
                    _Features(nft: nft),
                  ],
                ),
              ),
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 600),
                child: Center(
                  child: Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.start, children: [
                    _Details(nft: nft),
                    const SizedBox(height: 8),
                    _NftDetails(nft: nft),
                    const SizedBox(height: 16),
                    _NftData(nft: nft),
                    const SizedBox(height: 8),
                    if (listing.canBid) IntrinsicWidth(child: _Auction(listing: listing)),
                    if (listing.canBuyNow && listing.canBid) SizedBox(height: 16),
                    if (listing.canBuyNow) IntrinsicWidth(child: _BuyNow(listing: listing)),
                    const SizedBox(height: 16),
                    if (listing.canBuyNow || listing.canBid) _Countdown(listing: listing),
                    if (!listing.hasStarted)
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
                            Text("Purchased by: ${listing.auction!.currentWinningAddress}"),
                          Padding(
                            padding: const EdgeInsets.only(top: 16.0),
                            child: BidHistoryButton(listing: listing),
                          )
                        ],
                      )
                  ]),
                ),
              ),
            ],
          ),
          // SelectableText(
          //   listing.toString(),
          // )
        ],
      ),
    );
  }
}

class _Preview extends StatefulWidget {
  const _Preview({
    super.key,
    required this.nft,
  });

  final Nft nft;

  @override
  State<_Preview> createState() => _PreviewState();
}

class _PreviewState extends State<_Preview> {
  int selectedIndex = 0;
  bool rebuilding = false;

  late CarouselController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
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

      return path;

      // final ext = path.split(".").last.toLowerCase();
      // final imageExtensions = ['jpg', 'jpeg', 'gif', 'png', 'webp'];
    }).toList();

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
                    // autoPlay: BreakPoints.useMobileLayout(context) ? false : true,
                    autoPlay: false,
                    onPageChanged: (i, _) {
                      setState(() {
                        selectedIndex = i;
                      });
                    },
                  ),
                  items: paths.map((path) {
                    final fileType = fileTypeFromPath(path);

                    final showThumbnail = fileType == "Image";
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
                                  child: Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: PinchZoom(
                                      child: Image.file(
                                        File(path),
                                        width: double.infinity,
                                        height: double.infinity,
                                        fit: BoxFit.contain,
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
              )),
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
    super.key,
    required this.nft,
  });

  final Nft nft;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                nft.name,
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
            // if (withShareButtons) buildShareButtons(context),
          ],
        ),
        const SizedBox(height: 8),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 600),
          child: Text(nft.description),
        ),
      ],
    );
  }
}

class _Features extends StatelessWidget {
  final Nft nft;
  const _Features({super.key, required this.nft});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("NFT Features:", style: Theme.of(context).textTheme.headline5),
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
                          "No Smart Contract Features",
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
          )
        ],
      ),
    );
  }
}

class _NftDetails extends StatelessWidget {
  final Nft nft;
  const _NftDetails({super.key, required this.nft});

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

  const _NftData({
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
            defaultColumnWidth: const IntrinsicColumnWidth(),
            children: [
              buildDetailRow(context, "Identifier", nft.id, true),
              // buildDetailRow(context, "Owner Address", nft.currentOwner, true),
              // buildDetailRow(context, "Minted On", nft.mintedAt),
              buildDetailRow(context, "Minted By", nft.minterName),
              buildDetailRow(context, "Minter Address", nft.minterAddress, true),
              buildDetailRow(context, "Chain", "RBX"),
            ],
          ),
        ],
      ),
    );
  }
}

class _BuyNow extends BaseComponent {
  final OrganizedListing listing;
  const _BuyNow({super.key, required this.listing});

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

class _Auction extends BaseComponent {
  final OrganizedListing listing;
  const _Auction({
    super.key,
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
                    final success = await provider.sendBid(context, listing);
                    if (success == true) {
                      Toast.message("Bid transaction sent successfully.");
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
        final bids = await provider.fetchBids(listing);

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
    super.key,
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
                "${auction.currentBidPrice} RBX",
                style: valueStyle,
              )
            ],
          ),
          TableRow(
            children: [
              Text(
                "Max Bid Price:",
                style: labelStyle,
              ),
              Text(
                "${auction.maxBidPrice} RBX",
                style: valueStyle,
              )
            ],
          ),
          TableRow(
            children: [
              Text(
                "Increment Amount:",
                style: labelStyle,
              ),
              Text(
                "${auction.incrementAmount} RBX",
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
  const _Countdown({super.key, required this.listing});

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
              prefix: "Auction Ends",
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
  const _Thumbnail({
    super.key,
    required this.path,
    required this.fileNames,
    required this.scId,
    required this.ref,
  });

  @override
  State<_Thumbnail> createState() => __ThumbnailState();
}

class __ThumbnailState extends State<_Thumbnail> {
  bool rebuilding = false;
  bool thumbnailReady = false;

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    final provider = widget.ref.read(thumbnailFetcherProvider.notifier);

    final ready = provider.thumbnailReady(widget.scId);
    if (ready) {
      return;
    }

    provider.addToQueue(widget.scId, widget.fileNames);
    // await Future.delayed(Duration(milliseconds: 500));
    // queueForDownload();
  }

  // Future<void> checkIfExists() async {
  //   print("Checking if exists...");
  //   if (await File(widget.path).exists()) {
  //     final bytes = await File(widget.path).length();
  //     if (bytes > 100) {
  //       print("Good");

  //       return;
  //     }
  //   }

  //   print("Does not exist (${widget.path})");

  //   await getNftAssets(service: RemoteShopService(), scId: widget.scId);
  //   await Future.delayed(Duration(seconds: 2));
  //   setState(() {
  //     rebuilding = true;
  //   });
  //   await FileImage(File(widget.path)).evict();

  //   await Future.delayed(Duration(milliseconds: 300));
  //   setState(() {
  //     rebuilding = false;
  //   });
  //   await Future.delayed(Duration(seconds: 2));

  //   checkIfExists();
  // }

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      final thumb = ref.watch(thumbnailFetcherProvider).firstWhereOrNull((e) => e.scId == widget.scId);
      if (thumb == null || !thumb.success) {
        return CenteredLoader();
      }

      return Image.file(
        File(widget.path),
        errorBuilder: (context, _, __) {
          return Text("Error...");

          // return Text(path);
          // return Center(
          //   child: IconButton(
          //     icon: Icon(Icons.refresh),
          //     onPressed: () async {
          //       setState(() {
          //         rebuilding = true;
          //       });

          //       await getNftAssets(service: RemoteShopService(), scId: widget.scId);
          //       await Future.delayed(Duration(seconds: 2));

          //       await FileImage(File(widget.path)).evict();

          //       Future.delayed(Duration(milliseconds: 300)).then((value) {
          //         setState(() {
          //           rebuilding = false;
          //         });
          //       });
          //     },
          //   ),
          // );
        },
      );
    });
  }
}
