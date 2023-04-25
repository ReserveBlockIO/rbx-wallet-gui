import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/app_router.gr.dart';
import 'package:rbx_wallet/features/remote_shop/components/remote_shop_details.dart';
import 'package:rbx_wallet/features/remote_shop/providers/connected_shop_provider.dart';
import 'package:rbx_wallet/features/remote_shop/providers/remote_shop_detail_provider.dart';

import '../../../core/base_screen.dart';
import '../../../core/components/buttons.dart';
import '../../../core/components/centered_loader.dart';
import '../../../core/theme/app_theme.dart';
import '../../wallet/components/wallet_selector.dart';

class RemoteShopDetailScreen extends BaseScreen {
  final String shopUrl;
  const RemoteShopDetailScreen({Key? key, @PathParam("url") required this.shopUrl}) : super(key: key);

  @override
  AppBar? appBar(BuildContext context, WidgetRef ref) {
    final data = ref.watch(remoteShopDetailProvider(shopUrl));

    return data.when(
      data: (shop) => shop != null
          ? AppBar(
              centerTitle: true,
              title: Text(shop.name),
              backgroundColor: Colors.black12,
              shadowColor: Colors.transparent,
              leading: IconButton(
                icon: Icon(
                  Icons.navigate_before,
                  size: 32,
                ),
                onPressed: () {
                  ref.read(connectedShopProvider.notifier).disconnect();
                  Navigator.of(context).pop();
                },
              ),
              actions: [
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
                    AutoRouter.of(context).push(ShopChatScreenRoute(shopUrl: shopUrl));
                  },
                )
              ],
            )
          : AppBar(
              title: const Text("Error"),
            ),
      error: (_, __) => AppBar(
        title: const Text("Error"),
      ),
      loading: () => AppBar(
        title: const Text(""),
      ),
    );
  }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    final data = ref.watch(remoteShopDetailProvider(shopUrl));

    return data.when(
      data: (shop) => shop != null ? RemoteShopDetails() : const Center(child: Text("Error")),
      error: (_, __) => const Text("Error"),
      loading: () => const CenteredLoader(),
    );
  }
}
