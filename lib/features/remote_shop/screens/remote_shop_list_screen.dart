import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/components/buttons.dart';
import 'package:rbx_wallet/core/dialogs.dart';
import 'package:rbx_wallet/core/providers/session_provider.dart';
import 'package:rbx_wallet/core/theme/app_theme.dart';
import 'package:rbx_wallet/features/global_loader/global_loading_provider.dart';
import 'package:rbx_wallet/features/remote_shop/providers/connected_shop_provider.dart';
import 'package:rbx_wallet/features/remote_shop/providers/saved_shops_provider.dart';
import 'package:rbx_wallet/features/remote_shop/services/remote_shop_service.dart';
import 'package:rbx_wallet/utils/toast.dart';

import '../../../core/app_router.gr.dart';
import '../../../core/base_screen.dart';
import '../../wallet/components/wallet_selector.dart';

class RemoteShopListScreen extends BaseScreen {
  const RemoteShopListScreen({Key? key})
      : super(
          key: key,
          verticalPadding: 0,
          horizontalPadding: 0,
        );

  Future<void> loadShop(BuildContext context, WidgetRef ref, String url) async {
    final address = ref.read(sessionProvider).currentWallet?.address;
    if (address == null) {
      Toast.error("No wallet selected");
      return;
    }

    final shop = await RemoteShopService().getShopInfo(url);

    if (shop == null) {
      Toast.error("Could not find auction house with url of $url");
      return;
    }

    ref.read(savedShopsProvider.notifier).save(shop);

    final confirmed = await ConfirmDialog.show(
      title: "Connect to Auction House?",
      body: "Would you like to connect to ${shop.name} (${shop.url})?",
      confirmText: "Connect",
      cancelText: "Cancel",
    );

    if (confirmed == true) {
      ref.read(globalLoadingProvider.notifier).start();
      await RemoteShopService().connectToShop(myAddress: address, shopUrl: shop.url);
      await Future.delayed(Duration(milliseconds: 2500));
      // await RemoteShopService().getConnectedShopData();
      await ref.read(connectedShopProvider.notifier).connect(shop);
      AutoRouter.of(context).push(RemoteShopDetailScreenRoute(shopUrl: shop.url));
      // AutoRouter.of(context).push(RemoteShopContainerScreenRoute());
      ref.read(globalLoadingProvider.notifier).complete();
    }
  }

  Future<String?> promptForShopUrl(
    BuildContext context,
    WidgetRef ref,
  ) async {
    final url = await PromptModal.show(
      title: "Shop URL",
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Shop URL required";
        }

        if (!value.startsWith("rbx://")) {
          return "Invalid URL. Must start with 'rbx://'";
        }
        return null;
      },
      labelText: "Shop URL",
    );

    return url?.toLowerCase();
  }

  Future<void> loadShopWithPrompt(
    BuildContext context,
    WidgetRef ref,
  ) async {
    final url = await promptForShopUrl(context, ref);

    if (url != null) {
      loadShop(context, ref, url);
    }
  }

  @override
  AppBar? appBar(BuildContext context, WidgetRef ref) {
    return AppBar(
      title: const Text("Auction Houses"),
      backgroundColor: Colors.black12,
      shadowColor: Colors.transparent,
      centerTitle: true,
      leading: IconButton(
        icon: Icon(
          Icons.navigate_before,
          size: 32,
        ),
        onPressed: () {
          AutoRouter.of(context).pop();
        },
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.chat_bubble_outline),
          onPressed: () {
            AutoRouter.of(context).push(BuyerChatThreadListScreenRoute());
          },
        ),
        TextButton(
          onPressed: () async {
            await loadShopWithPrompt(context, ref);
          },
          child: Text(
            "Add Shop",
            style: TextStyle(color: Colors.white),
          ),
        ),
        // WalletSelector(),
      ],
    );
  }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    final savedShops = ref.watch(savedShopsProvider);

    if (savedShops.isEmpty) {
      return Center(
        child: AppButton(
          label: "Connect to Auction House",
          variant: AppColorVariant.Success,
          onPressed: () async {
            await loadShopWithPrompt(context, ref);
          },
        ),
      );
    }

    return ListView.builder(
      itemCount: savedShops.length,
      itemBuilder: (context, index) {
        final url = savedShops[index];
        return Card(
          child: ListTile(
            leading: Icon(Icons.house),
            title: Text(url),
            onTap: () async {
              final currentUrl = ref.read(connectedShopProvider).url;
              print(url);
              print(currentUrl);
              if (currentUrl == url) {
                ref.read(connectedShopProvider.notifier).refresh();
                AutoRouter.of(context).push(RemoteShopDetailScreenRoute(shopUrl: url));
              } else {
                await loadShop(context, ref, url);
              }
            },
          ),
        );
      },
    );
  }
}
