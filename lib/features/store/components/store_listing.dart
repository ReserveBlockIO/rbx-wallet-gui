import 'dart:html';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:date_count_down/countdown.dart';
import 'package:date_count_down/date_count_down.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rbx_wallet/core/base_component.dart';
import 'package:rbx_wallet/core/breakpoints.dart';
import 'package:rbx_wallet/core/components/buttons.dart';
import 'package:rbx_wallet/core/components/countdown.dart';
import 'package:rbx_wallet/core/dialogs.dart';
import 'package:rbx_wallet/core/providers/web_session_provider.dart';
import 'package:rbx_wallet/core/theme/app_theme.dart';
import 'package:rbx_wallet/features/auth/auth_utils.dart';
import 'package:rbx_wallet/features/nft/components/nft_qr_code.dart';
import 'package:rbx_wallet/features/store/components/bid_history.dart';
import 'package:rbx_wallet/features/store/components/bid_modal.dart';
import 'package:rbx_wallet/features/store/components/purchase_modal.dart';
import 'package:rbx_wallet/features/store/models/listing.dart';
import 'package:rbx_wallet/features/store/models/store_collection.dart';
import 'package:rbx_wallet/features/store/providers/bid_provider.dart';
import 'package:rbx_wallet/features/store/providers/purchase_provider.dart';
import 'package:rbx_wallet/generated/assets.gen.dart';
import 'package:rbx_wallet/utils/toast.dart';
import 'package:pinch_zoom/pinch_zoom.dart';

class StoreListing extends BaseComponent {
  final Listing listing;
  final bool withShareButtons;
  final StoreCollection? collection;

  const StoreListing(
    this.listing, {
    Key? key,
    this.withShareButtons = true,
    this.collection,
  }) : super(key: key);

  Future<void> handleBid(BuildContext context, WidgetRef ref) async {
    final session = ref.read(webSessionProvider);
    final provider = ref.read(bidProvider(listing.slug).notifier);
    provider.setCollection(collection);
    if (session.keypair == null) {
      await AuthModal.show(
          context: context,
          withExplanation: true,
          onValidSubmission: (auth) async {
            await handleCreateWithEmail(
              context,
              ref,
              auth.email,
              auth.password,
            );
            if (ref.read(webSessionProvider).isAuthenticated) {
              showDialog(
                  barrierColor: Colors.transparent,
                  context: context,
                  builder: (context) {
                    return BidModal(
                      listing: listing,
                    );
                  });
            }
          });

      return;
    }

    showDialog(
        context: context,
        barrierColor: Colors.transparent,
        builder: (context) {
          return BidModal(
            listing: listing,
          );
        });
  }

  Future<void> handlePurchase(BuildContext context, WidgetRef ref) async {
    final session = ref.read(webSessionProvider);
    final provider = ref.read(purchaseProvider(listing.slug).notifier);
    provider.setCollection(collection);
    if (session.keypair == null) {
      await AuthModal.show(
          context: context,
          withExplanation: true,
          onValidSubmission: (auth) async {
            await handleCreateWithEmail(
              context,
              ref,
              auth.email,
              auth.password,
            );
            if (ref.read(webSessionProvider).isAuthenticated) {
              showDialog(
                  context: context,
                  barrierColor: Colors.transparent,
                  builder: (context) {
                    return PurchaseModal(
                      listing: listing,
                    );
                  });
            }
          });

      return;
    }

    showDialog(
        context: context,
        barrierColor: Colors.transparent,
        builder: (context) {
          return PurchaseModal(
            listing: listing,
          );
        });
  }

  Future<void> handleCopyUrl() async {
    final url = window.location.href;
    await Clipboard.setData(ClipboardData(text: url));
    Toast.message("URL copied to clipboard");
  }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          buildInfo(context, withShareButtons: withShareButtons),
          SizedBox(
            height: 8,
          ),
          buildPreview(context),
          buildPreviewDetails(),
          buildDetails(context),
          if (listing.hasFinished || listing.isPurchased) _AuctionEnded(),
          if (listing.isActive && listing.isAuction)
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: buildAuction(context, ref),
            ),
          if (listing.isActive && listing.isBuyNow)
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: buildPurchase(context, ref),
            ),
          Center(child: buildCountdown())
        ],
      ),
    );
  }

  @override
  Widget desktopBody(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [buildPreview(context), buildPreviewDetails()],
            ),
          ),
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 600),
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildInfo(context, withShareButtons: withShareButtons),
                  SizedBox(height: 8),
                  buildDetails(context),
                  SizedBox(height: 8),
                  if (listing.hasFinished || listing.isPurchased) _AuctionEnded(),
                  if (listing.isActive)
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        if (listing.isAuction)
                          Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: buildAuction(context, ref),
                          ),
                        if (listing.isBuyNow) buildPurchase(context, ref),
                      ],
                    ),
                  buildCountdown()
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Column buildCountdown() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (listing.isActive && listing.endsAt != null)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: AppCountdown(dueDate: listing.endsAt!, prefix: "Auction Ends"),
          ),
        if (!listing.hasStarted)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: AppCountdown(dueDate: listing.startsAt, prefix: "Auction Starts"),
          ),
      ],
    );
  }

  Column buildPreviewDetails() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 300),
          child: ListTile(
            title: Text("Multi Asset"),
            subtitle: Text("3 assets"),
            leading: Icon(FontAwesomeIcons.rectangleList),
          ),
        ),
      ],
    );
  }

  Row buildShareButtons(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Expanded(child: buildInfo(context)),
        IconButton(
            onPressed: () {
              final url = window.location.href;

              showDialog(
                  context: context,
                  builder: (context) {
                    return Center(
                      child: NftQrCode(data: url),
                    );
                  });
            },
            icon: Icon(Icons.qr_code)),
        IconButton(
            onPressed: () {
              handleCopyUrl();
            },
            icon: Icon(Icons.link))
      ],
    );
  }

  Widget buildPreview(BuildContext context) {
    final urls = listing.previewUrls;

    if (urls.isEmpty) return SizedBox();

    return PreviewCarousel(urls: urls);
  }

  Column buildInfo(BuildContext context, {bool withShareButtons = true}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                listing.name,
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
            if (withShareButtons) buildShareButtons(context),
          ],
        ),
        SizedBox(height: 8),
        ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 600),
          child: Text(listing.description),
        ),
      ],
    );
  }

  Widget buildDetails(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      color: Colors.white10.withOpacity(0.05),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Details",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              SizedBox(height: 8),
              Table(
                defaultColumnWidth: IntrinsicColumnWidth(),
                children: [
                  buildDetailRow(context, "Minted by", "Joe Spicoli"),
                  buildDetailRow(context, "Owner Address", "RVTdQHsdoNGoTXoYGJN8PoqPDvCKVLMCGv", true),
                  buildDetailRow(context, "Contract Address", "dQHsdoNGoTXoYGJN8PoqPDvCKVLMCGv422", true),
                  buildDetailRow(context, "Chain", "RBX"),
                  if (listing.endsAt != null) buildDetailRow(context, "Sale Ends", listing.endTimeLabelPrecise),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildPurchase(BuildContext context, WidgetRef ref) {
    final isMobile = BreakPoints.useMobileLayout(context);
    return SizedBox(
      width: isMobile ? double.infinity : null,
      child: Card(
        color: Colors.white10.withOpacity(0.05),
        margin: EdgeInsets.zero,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Buy Now",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  letterSpacing: 1,
                ),
              ),
              SizedBox(height: 8),
              buildPrice("Buy Now Price", listing.buyNowPriceLabel),
              SizedBox(height: 16),
              AppButton(
                label: "Buy Now",
                icon: Icons.money,
                size: AppSizeVariant.Lg,
                onPressed: () {
                  handlePurchase(context, ref);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildAuction(BuildContext context, WidgetRef ref) {
    final isMobile = BreakPoints.useMobileLayout(context);
    return SizedBox(
      width: isMobile ? double.infinity : null,
      child: Card(
        color: Colors.white10.withOpacity(0.05),
        margin: EdgeInsets.zero,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text(
                  "Auction",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    letterSpacing: 1,
                  ),
                ),
              ),
              buildPrice("Floor Price", listing.floorPriceLabel),
              Divider(),
              if (listing.highestBid != null) buildPrice("Highest Bid", listing.highestBid!.amountLabel),
              SizedBox(height: 16),
              Row(
                children: [
                  AppButton(label: "Bid Now", icon: Icons.gavel, size: AppSizeVariant.Lg, onPressed: () => handleBid(context, ref)),
                  SizedBox(
                    width: 6,
                  ),
                  AppButton(
                    label: "History",
                    icon: Icons.punch_clock,
                    size: AppSizeVariant.Lg,
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return BidHistory(
                              listing: listing,
                            );
                          });
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

  Column buildPrice(String label, String amount) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "$label:",
          style: TextStyle(fontSize: 18),
        ),
        Text(
          amount,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
  }

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
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(value),
            SizedBox(
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
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 6.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(value),
              SizedBox(width: 8),
              if (copyValue)
                InkWell(
                    onTap: () async {
                      await Clipboard.setData(ClipboardData(text: value));

                      Toast.message("$label copied to clipboard");
                    },
                    child: Icon(Icons.copy, size: 12)),
            ],
          ),
        ),
      ],
    );
  }
}

class _AuctionEnded extends StatelessWidget {
  const _AuctionEnded({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          "This auction has ended",
          style: Theme.of(context).textTheme.headlineMedium!.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class PreviewCarousel extends StatefulWidget {
  const PreviewCarousel({
    Key? key,
    required this.urls,
  }) : super(key: key);

  final List<String> urls;

  @override
  State<PreviewCarousel> createState() => _PreviewCarouselState();
}

class _PreviewCarouselState extends State<PreviewCarousel> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final isMobile = BreakPoints.useMobileLayout(context);

    CarouselController controller = CarouselController();

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
                    autoPlay: true,
                    onPageChanged: (i, _) {
                      setState(() {
                        selectedIndex = i;
                      });
                    },
                  ),
                  items: widget.urls.map((url) {
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
                                      child: Image.network(
                                        url,
                                        width: double.infinity,
                                        height: double.infinity,
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                );
                              });
                        },
                        child: Image.network(
                          url,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              )),
        ),
        SizedBox(
          height: 8,
        ),
        if (widget.urls.isNotEmpty)
          DotsIndicator(
            dotsCount: widget.urls.length,
            position: selectedIndex.toDouble(), // lol why does this package use a double for an index :P
            // onTap: (index) {
            //   print(index.toInt());
            //   // controller.animateToPage(index.toInt());
            //   // controller.animateToPage(index.toInt());
            // },
            decorator: DotsDecorator(
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
