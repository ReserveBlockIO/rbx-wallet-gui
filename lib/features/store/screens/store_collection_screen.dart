import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/base_screen.dart';
import '../../../core/components/centered_loader.dart';
import '../../../core/providers/web_session_provider.dart';
import '../../../core/support.dart';
import '../../../core/web_router.gr.dart';
import '../../../generated/assets.gen.dart';
import '../../web/components/web_wallet_details.dart';
import '../components/store_collection.dart';
import '../providers/store_collection_detail_provider.dart';

class StoreCollectionScreen extends BaseScreen {
  final String slug;

  const StoreCollectionScreen({
    Key? key,
    @PathParam('slug') required this.slug,
  }) : super(key: key, verticalPadding: 0, horizontalPadding: 0, backgroundColor: Colors.black);

  @override
  AppBar? appBar(BuildContext context, WidgetRef ref) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.black,
      shadowColor: Colors.transparent,
      title: InkWell(
        onTap: () {
          if (ref.read(webSessionProvider).keypair != null) {
            AutoRouter.of(context).push(WebDashboardContainerRoute());
          } else {
            AutoRouter.of(context).push(const WebAuthRouter());
          }
        },
        child: Row(
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
            Image.asset(
              Assets.images.rbxWallet.path,
              width: 120,
              height: 20,
              fit: BoxFit.contain,
            ),
          ],
        ),
      ),
    );
  }

  @override
  FloatingActionButton? floatingActionButton(BuildContext context, WidgetRef ref) {
    return buildSupportButton();
  }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    final data = ref.watch(storeCollectionDetailProvider(slug));

    return data.when(
        loading: () => const CenteredLoader(),
        error: (_, __) => const Center(child: Text("404 not found.")),
        data: (collection) => collection == null
            ? const Center(child: Text("404 not found."))
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
                        if (ref.watch(webSessionProvider).keypair != null) const WebWalletDetails(),
                        StoreCollectionContainer(collection),
                        const SizedBox(height: 64),
                      ],
                    ),
                  ),
                ],
              ));
  }
}
