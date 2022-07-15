import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/base_screen.dart';
import 'package:rbx_wallet/core/components/centered_loader.dart';
import 'package:rbx_wallet/core/providers/web_session_provider.dart';
import 'package:rbx_wallet/core/web_router.gr.dart';
import 'package:rbx_wallet/features/store/components/store_listing.dart';
import 'package:rbx_wallet/features/store/providers/listing_detail_provider.dart';
import 'package:rbx_wallet/features/web/components/web_wallet_details.dart';
import 'package:rbx_wallet/generated/assets.gen.dart';

class StoreListingScreen extends BaseScreen {
  final String slug;

  const StoreListingScreen({
    Key? key,
    @PathParam('slug') required this.slug,
  }) : super(key: key, verticalPadding: 0, horizontalPadding: 0, backgroundColor: Colors.black);

  @override
  AppBar? appBar(BuildContext context, WidgetRef ref) {
    final data = ref.watch(listingDetailProvider(slug));

    return data.when(
      loading: () => AppBar(),
      error: (_, __) => AppBar(
        title: Text("Error"),
        automaticallyImplyLeading: false,
      ),
      data: (listing) => listing == null
          ? AppBar(
              title: Text("Error"),
              automaticallyImplyLeading: false,
            )
          : AppBar(
              // title: Text("ReserveBlock"),
              automaticallyImplyLeading: false,
              backgroundColor: Colors.black,
              shadowColor: Colors.transparent,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 54,
                    height: 54,
                    child: Image.asset(
                      Assets.images.animatedCube.path,
                      scale: 1,
                    ),
                  ),
                  const SizedBox(width: 8),
                  InkWell(
                    onTap: () {
                      if (ref.read(webSessionProvider).keypair != null) {
                        AutoRouter.of(context).push(WebDashboardContainerRoute());
                      } else {
                        AutoRouter.of(context).push(WebAuthRouter());
                      }
                    },
                    child: Image.asset(
                      Assets.images.rbxWallet.path,
                      width: 120,
                      height: 20,
                      fit: BoxFit.contain,
                    ),
                  ),
                ],
              ),
            ),
    );
  }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    final data = ref.watch(listingDetailProvider(slug));

    return data.when(
        loading: () => CenteredLoader(),
        error: (_, __) => Center(child: Text("404 not found.")),
        data: (listing) => listing == null
            ? Center(child: Text("404 not found."))
            : Stack(
                children: [
                  Container(
                    color: Theme.of(context).colorScheme.primary.withOpacity(0.3),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Opacity(
                      opacity: 0.25,
                      child: Image.asset(
                        Assets.images.decorBottomRight.path,
                        width: 200,
                        height: 200,
                        fit: BoxFit.cover,
                        repeat: ImageRepeat.noRepeat,
                      ),
                    ),
                  ),
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        if (ref.watch(webSessionProvider).keypair != null) WebWalletDetails(),
                        StoreListing(listing),
                      ],
                    ),
                  ),
                ],
              ));
  }
}
