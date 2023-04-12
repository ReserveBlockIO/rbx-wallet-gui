import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/base_component.dart';
import 'package:rbx_wallet/core/components/buttons.dart';
import 'package:rbx_wallet/core/dialogs.dart';
import 'package:rbx_wallet/core/providers/session_provider.dart';
import 'package:rbx_wallet/core/theme/app_theme.dart';
import 'package:rbx_wallet/features/global_loader/global_loading_provider.dart';
import 'package:rbx_wallet/features/remote_shop/components/remote_shop_list_tile.dart';
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

  Future<String?> promptForShopUrl(
    BuildContext context,
    WidgetRef ref,
  ) async {
    String? url = await PromptModal.show(
      title: "Shop URL",
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Shop URL required";
        }

        // if (!value.startsWith("rbx://")) {
        //   return "Invalid URL. Must start with 'rbx://'";
        // }
        return null;
      },
      labelText: "Shop URL",
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

    if (url != null) {
      ref.read(connectedShopProvider.notifier).loadShop(context, ref, url);
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
        AppButton(
          type: AppButtonType.Text,
          variant: AppColorVariant.Light,
          icon: Icons.chat_bubble_outline,
          label: 'Chat',
          onPressed: () {
            AutoRouter.of(context).push(BuyerChatThreadListScreenRoute());
          },
        ),
        AppButton(
          onPressed: () async {
            await loadShopWithPrompt(context, ref);
          },
          label: "Add Shop",
          type: AppButtonType.Text,
          variant: AppColorVariant.Light,
          icon: Icons.add,
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
        return RemoteShopListTile(url: url);
      },
    );
  }
}
