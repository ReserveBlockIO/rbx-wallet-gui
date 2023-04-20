import 'dart:async';
import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/app_router.gr.dart';
import 'package:rbx_wallet/core/base_component.dart';
import 'package:rbx_wallet/core/base_screen.dart';
import 'package:rbx_wallet/features/dst/models/dec_shop.dart';
import 'package:rbx_wallet/features/remote_shop/components/remote_asset_preview.dart';
import 'package:rbx_wallet/features/remote_shop/models/shop_data.dart';
import 'package:rbx_wallet/features/remote_shop/providers/connected_shop_provider.dart';
import 'package:collection/collection.dart';
import 'package:rbx_wallet/features/remote_shop/services/remote_shop_service.dart';
import 'package:rbx_wallet/features/remote_shop/utils.dart';
import 'package:rbx_wallet/features/wallet/components/wallet_selector.dart';

import '../../../core/components/buttons.dart';
import '../../../core/theme/app_theme.dart';
import "../components/listing_details.dart";

class RemoteShopCollectionScreen extends BaseScreen {
  final int collectionId;
  final String url;

  const RemoteShopCollectionScreen({
    super.key,
    @PathParam("collectionId") required this.collectionId,
    @PathParam("url") required this.url,
  }) : super(backgroundColor: const Color(0xFF010715));

  @override
  AppBar? appBar(BuildContext context, WidgetRef ref) {
    final model = ref.watch(connectedShopProvider);
    final shop = model.data;

    if (shop == null) {
      return AppBar();
    }
    final collection = shop.collections.firstWhereOrNull((c) => c.id == collectionId);

    if (collection == null) {
      return AppBar();
    }

    return AppBar(
      title: Text(collection.name),
      backgroundColor: Colors.black12,
      shadowColor: Colors.transparent,
      actions: [
        WalletSelector(),
        IconButton(
          onPressed: () {
            ref.read(connectedShopProvider.notifier).refresh(true);
          },
          icon: Icon(Icons.refresh),
        ),
        AppButton(
          type: AppButtonType.Text,
          variant: AppColorVariant.Light,
          icon: Icons.chat_bubble_outline,
          label: 'Chat',
          onPressed: () {
            AutoRouter.of(context).push(ShopChatScreenRoute(shopUrl: url));
          },
        )
      ],
    );
  }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    final provider = ref.read(connectedShopProvider.notifier);
    final model = ref.watch(connectedShopProvider);

    final shop = model.data;
    if (shop == null) {
      return Center(child: Text("Shop Error"));
    }

    final collection = shop.collections.firstWhereOrNull((c) => c.id == collectionId);

    if (collection == null) {
      return Center(child: Text("Collection Error"));
    }

    final validListings = collection.listings.where((l) => l.nft != null).toList();

    return Column(
      children: [
        // Padding(
        //   padding: const EdgeInsets.all(8.0),
        //   child: Center(
        //     child: Text(
        //       collection.name,
        //       style: Theme.of(context).textTheme.headlineMedium!.copyWith(
        //             color: Colors.white,
        //           ),
        //     ),
        //   ),
        // ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 600),
              child: Text(
                collection.description,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: Colors.white,
                    ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
        Divider(),
        // _ThumbnailGetter(
        //   listings: validListings,
        // ),
        Expanded(
          child: ListView.builder(
            itemCount: validListings.length,
            itemBuilder: (context, index) {
              final listing = validListings[index];

              return ListingDetails(listing: listing);
            },
          ),
        )
      ],
    );
  }
}

// class _ThumbnailGetter extends StatefulWidget {
//   final List<OrganizedListing> listings;

//   const _ThumbnailGetter({super.key, required this.listings});

//   @override
//   State<_ThumbnailGetter> createState() => __ThumbnailGetterState();
// }

// class __ThumbnailGetterState extends State<_ThumbnailGetter> {
//   late final Timer timer;

//   @override
//   void initState() {
//     super.initState();

//     timer = Timer.periodic(Duration(seconds: 5), (timer) {
//       fetch();
//       // widget.markAsReadFunction();
//     });

//     fetch();
//   }

//   @override
//   void deactivate() {
//     timer.cancel();
//     super.deactivate();
//   }

//   void fetch() {
//     print("Fetching...");
//     final scIds = widget.listings.map((l) => l.smartContractUid).toList();
//     bulkGetNftAssets(service: RemoteShopService(), scIds: scIds);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return const SizedBox.shrink();
//   }
// }
