import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/base_component.dart';
import 'package:rbx_wallet/core/breakpoints.dart';
import 'package:rbx_wallet/core/components/buttons.dart';
import 'package:rbx_wallet/core/dialogs.dart';
import 'package:rbx_wallet/core/providers/web_session_provider.dart';
import 'package:rbx_wallet/core/theme/app_theme.dart';
import 'package:rbx_wallet/features/auth/auth_utils.dart';
import 'package:rbx_wallet/features/nft/components/nft_qr_code.dart';
import 'package:rbx_wallet/features/store/components/bid_history.dart';
import 'package:rbx_wallet/features/store/components/bid_modal.dart';
import 'package:rbx_wallet/features/store/components/purchase_modal.dart';
import 'package:rbx_wallet/features/store/models/listing.dart';
import 'package:rbx_wallet/features/web/components/web_wallet_details.dart';
import 'package:rbx_wallet/utils/toast.dart';

class StoreListing extends BaseComponent {
  final Listing listing;

  const StoreListing(this.listing, {Key? key}) : super(key: key);

  Future<void> handleBid(BuildContext context, WidgetRef ref) async {
    final session = ref.read(webSessionProvider);
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
    return Container(
      color: Colors.white10,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            buildShareButtons(context),
            SizedBox(
              height: 8,
            ),
            buildPreview(context),
            buildDetails(context),
            if (listing.isAuction)
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: buildAuction(context, ref),
              ),
            if (listing.isBuyNow)
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: buildPurchase(context, ref),
              ),
          ],
        ),
      ),
    );
  }

  @override
  Widget desktopBody(BuildContext context, WidgetRef ref) {
    return Container(
      color: Colors.white10,
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 12.0),
                  child: buildPreview(context),
                ),
                ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: 600),
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        buildShareButtons(context),
                        Divider(),
                        buildDetails(context),
                        Divider(),
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
                        )
                      ],
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Row buildShareButtons(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(child: buildInfo(context)),
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
    final isMobile = BreakPoints.useMobileLayout(context);

    return Image.network(
      "https://placekitten.com/1000/700",
      width: isMobile ? double.infinity : 320,
      // height: 320,
      fit: BoxFit.contain,
      alignment: Alignment.topCenter,
    );
  }

  Column buildInfo(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          listing.name,
          style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
        ),
        SizedBox(height: 8),
        ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 600),
          child: Text(
            listing.description,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Divider(),
        ),
        Text(
          "Name of NFT",
          style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
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
      color: Colors.white10,
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
                  buildDetailRow(context, "Owner Address", "RVTdQHsdoNGoTXoYGJN8PoqPDvCKVLMCGv"),
                  buildDetailRow(context, "Contract Address", "dQHsdoNGoTXoYGJN8PoqPDvCKVLMCGv422"),
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
        color: Colors.white10,
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
              if (listing.endsAt != null)
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text("Ends ${listing.endTimeLabel}"),
                )
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
        color: Colors.white10,
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
              if (listing.highestBid != null) buildPrice("Highest Bid", listing.highestBid!.amountLabel),
              if (listing.highestBid == null) buildPrice("Floor Price", listing.floorPriceLabel),
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
              if (listing.endsAt != null)
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text("Auction ends ${listing.endTimeLabel}"),
                )
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

  TableRow buildDetailRow(BuildContext context, String label, String value) {
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
          child: Text(value),
        )
      ],
    );
  }
}
