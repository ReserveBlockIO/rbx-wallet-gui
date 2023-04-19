import 'package:auto_route/auto_route.dart';
import 'package:context_menus/context_menus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/app_router.gr.dart';
import 'package:rbx_wallet/core/base_component.dart';
import 'package:rbx_wallet/core/components/buttons.dart';
import 'package:rbx_wallet/core/dialogs.dart';
import 'package:rbx_wallet/core/theme/app_theme.dart';
import 'package:rbx_wallet/features/bridge/providers/wallet_info_provider.dart';
import 'package:rbx_wallet/features/remote_shop/providers/connected_shop_provider.dart';

class RemoteShopListTile extends BaseComponent {
  const RemoteShopListTile({
    super.key,
    required this.url,
  });

  final String url;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.house),
        title: Text(url),
        trailing: AppButton(
          label: 'Remove',
          variant: AppColorVariant.Danger,
          onPressed: () {
            ref.read(connectedShopProvider.notifier).removeBookmarkedShop(context, ref, url);
          },
        ),
        onTap: () async {
          if (ref.read(walletInfoProvider) == null || !ref.read(walletInfoProvider)!.isChainSynced) {
            final cont = await ConfirmDialog.show(
              title: "Wallet Not Synced",
              body: "Since your wallet is not synced there may be some issues viewing the data in this shop. Continue anyway?",
              confirmText: "Continue",
              cancelText: "Cancel",
            );

            if (cont != true) {
              return;
            }
          }

          final currentUrl = ref.read(connectedShopProvider).url;

          if (currentUrl == url) {
            ref.read(connectedShopProvider.notifier).refresh();
            AutoRouter.of(context).push(RemoteShopDetailScreenRoute(shopUrl: url));
          } else {
            await ref.read(connectedShopProvider.notifier).loadShop(context, ref, url);
          }
        },
      ),
    );
  }
}
