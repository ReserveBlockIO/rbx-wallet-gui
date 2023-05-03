import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/base_screen.dart';
import 'package:rbx_wallet/features/web_shop/services/web_shop_service.dart';

import '../../../core/components/buttons.dart';
import '../../../core/dialogs.dart';
import '../../../core/theme/app_theme.dart';
import '../../bridge/providers/wallet_info_provider.dart';
import '../../remote_shop/providers/connected_shop_provider.dart';
import '../components/web_shop_list.dart';
import '../components/web_shop_list_tile.dart';
import '../models/web_shop.dart';
import '../providers/web_shop_list_provider.dart';

class WebShopListScreen extends BaseScreen {
  const WebShopListScreen({super.key})
      : super(
          includeWebDrawer: true,
        );
  Future<String?> promptForShopUrl(
    BuildContext context,
    WidgetRef ref,
  ) async {
    String? url = await PromptModal.show(
      title: "Shop URL",
      initialValue: "rbx://",
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Shop URL required";
        }

        // if (!value.startsWith("rbx://")) {
        //   return "Invalid URL. Must start with 'rbx://'";
        // }
        return null;
      },
      labelText: "Input Shop Name Only",
    );

    if (url == null) {
      return null;
    }

    if (!url.startsWith("rbx://")) {
      url = "rbx://$url";
    }

    return url.trim();
  }

  Future<void> loadShopWithPrompt(
    BuildContext context,
    WidgetRef ref,
  ) async {
    final url = await promptForShopUrl(context, ref);
    if (url == null) return;

    WebShop? shop = await WebShopService().lookupShop(url);

    if (shop == null) return;

    if (ref.read(walletInfoProvider) == null ||
        !ref.read(walletInfoProvider)!.isChainSynced) {
      final cont = await ConfirmDialog.show(
        title: "Wallet Not Synced",
        body:
            "Since your wallet is not synced there may be some issues viewing the data in this shop. Continue anyway?",
        confirmText: "Continue",
        cancelText: "Cancel",
      );

      if (cont != true) {
        return;
      }
    }

    WebShopTile.pushToShop(context, ref, shop);
  }

  @override
  AppBar? appBar(BuildContext context, WidgetRef ref) {
    return AppBar(
      centerTitle: true,
      leading: IconButton(
          onPressed: () {
            AutoRouter.of(context).pop();
          },
          icon: Icon(Icons.chevron_left)),
      backgroundColor: Colors.black12,
      shadowColor: Colors.transparent,
      title: Text("Auction Houses"),
      actions: [
        kIsWeb
            ? SizedBox.shrink()
            : AppButton(
                onPressed: () async {
                  await loadShopWithPrompt(context, ref);
                },
                label: "Connect to a Shop",
                type: AppButtonType.Text,
                variant: AppColorVariant.Light,
                icon: Icons.add,
              ),
        IconButton(
            onPressed: () {
              ref
                  .watch(webShopListProvider(WebShopListType.public).notifier)
                  .refresh();
            },
            icon: Icon(Icons.refresh)),
      ],
    );
  }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    return const WebShopList();
  }
}
