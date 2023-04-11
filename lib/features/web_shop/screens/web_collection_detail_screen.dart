import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/app_router.gr.dart';
import 'package:rbx_wallet/core/base_screen.dart';
import 'package:rbx_wallet/features/web_shop/components/web_listing_list.dart';
import 'package:rbx_wallet/features/web_shop/providers/web_collection_detail_provider.dart';

import '../../../core/components/buttons.dart';
import '../../../core/theme/app_theme.dart';
import '../models/web_listing.dart';
import '../providers/create_web_listing_provider.dart';

class WebCollectionDetailScreen extends BaseScreen {
  WebCollectionDetailScreen({
    super.key,
    @PathParam("shopId") required this.shopId,
    @PathParam("collectionId") required this.collectionId,
  }) : super(backgroundColor: const Color(0xFF010715), horizontalPadding: 0, verticalPadding: 0);

  int shopId;
  int collectionId;
  @override
  AppBar? appBar(BuildContext context, WidgetRef ref) {
    final data = ref.watch(webCollectionDetailProvider("$shopId,$collectionId"));
    return data.when(
      data: (collection) => collection != null
          ? AppBar(
              title: Text(collection.name),
              centerTitle: true,
              backgroundColor: Colors.black12,
              shadowColor: Colors.transparent,
            )
          : AppBar(
              title: const Text("Error"),
              centerTitle: true,
              backgroundColor: Colors.black12,
              shadowColor: Colors.transparent,
            ),
      error: (_, __) => AppBar(
        title: const Text("Error"),
        centerTitle: true,
        backgroundColor: Colors.black12,
        shadowColor: Colors.transparent,
      ),
      loading: () => AppBar(
        title: const Text("loading"),
        centerTitle: true,
        backgroundColor: Colors.black12,
        shadowColor: Colors.transparent,
      ),
    );
  }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    final data = ref.watch(webCollectionDetailProvider("$shopId,$collectionId"));

    return data.when(
      data: (collection) => collection != null
          ? Column(
              children: [
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
                Expanded(
                  child: WebListingList(
                    shopId,
                    collectionId,
                  ),
                ),
                if (collection.shop!.isOwner(ref))
                  Container(
                    color: Colors.black,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          AppButton(
                            label: "Create Listing",
                            icon: Icons.add,
                            variant: AppColorVariant.Success,
                            onPressed: () {
                              ref.read(createWebListingProvider.notifier).load(WebListing.empty(), collectionId, shopId);
                              AutoRouter.of(context).push(DebugWebListingCreateScreenRoute(shopId: shopId, collectionId: collectionId));
                            },
                          ),
                        ],
                      ),
                    ),
                  )
              ],
            )
          : const Text("Error"),
      error: (_, __) => const Text("Error"),
      loading: () => const Text("Loading"),
    );
  }
}
