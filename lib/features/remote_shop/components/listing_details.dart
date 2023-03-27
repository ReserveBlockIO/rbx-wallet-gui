import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pinch_zoom/pinch_zoom.dart';
import 'package:rbx_wallet/core/base_component.dart';
import 'package:rbx_wallet/core/breakpoints.dart';
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
          //TODO: Auction Stuff
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
                //TODO: Auction
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

  @override
  Widget build(BuildContext context) {
    final isMobile = BreakPoints.useMobileLayout(context);

    CarouselController controller = CarouselController();

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
        if (paths.isNotEmpty)
          DotsIndicator(
            dotsCount: paths.length,
            position: selectedIndex.toDouble(),
            decorator: const DotsDecorator(
              activeColor: Colors.white,
              color: Colors.white54,
              size: Size.fromRadius(3),
              activeSize: Size.fromRadius(4),
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
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 4.0),
                        child: Text(
                          "No Smart Contract Features",
                          style: TextStyle(fontSize: 16),
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
