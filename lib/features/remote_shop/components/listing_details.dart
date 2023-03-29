import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pinch_zoom/pinch_zoom.dart';
import 'package:rbx_wallet/core/base_component.dart';
import 'package:rbx_wallet/core/breakpoints.dart';
import 'package:rbx_wallet/core/components/buttons.dart';
import 'package:rbx_wallet/core/theme/app_theme.dart';
import 'package:rbx_wallet/features/nft/models/nft.dart';
import 'package:rbx_wallet/features/remote_shop/models/shop_data.dart';
import 'package:rbx_wallet/utils/toast.dart';

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
      child: Row(
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
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _Details(nft: nft),
                  const SizedBox(height: 8),
                  _NftDetails(nft: nft),
                  const SizedBox(height: 16),
                  _NftData(nft: nft),
                  const SizedBox(height: 8),
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
          ),
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
    if (rebuilding) {
      return SizedBox();
    }

    final isMobile = BreakPoints.useMobileLayout(context);

    final assets = [widget.nft.primaryAsset, ...widget.nft.additionalAssets];

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
                        child: Image.file(
                          File(path),
                          errorBuilder: (context, _, __) {
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
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
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
              //TODO: Auction stuff
            ],
          ),
        ],
      ),
    );
  }
}

class _BuyNow extends StatelessWidget {
  final OrganizedListing listing;
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
  final OrganizedListing listing;
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