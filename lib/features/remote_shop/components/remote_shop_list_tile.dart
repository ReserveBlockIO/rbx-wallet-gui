import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/app_router.gr.dart';
import 'package:rbx_wallet/core/base_component.dart';
import 'package:rbx_wallet/core/dialogs.dart';
import 'package:rbx_wallet/core/theme/app_theme.dart';
import 'package:rbx_wallet/features/bridge/providers/wallet_info_provider.dart';
import 'package:rbx_wallet/features/dst/models/dec_shop.dart';
import 'package:rbx_wallet/features/remote_shop/providers/connected_shop_provider.dart';

class RemoteShopListTile extends BaseComponent {
  const RemoteShopListTile({
    super.key,
    required this.shop,
  });

  final DecShop shop;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentUrl = ref.watch(connectedShopProvider).url;
    final isConnected = ref.watch(connectedShopProvider).isConnected;

    return Card(
      color: Colors.white.withOpacity(0.03),
      child: ListTile(
        title: RichText(
            text: TextSpan(style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500), children: [
          TextSpan(
            text: shop.name,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          if (currentUrl == shop.url && isConnected)
            TextSpan(
              text: " [Connected]",
              style: TextStyle(
                color: Theme.of(context).colorScheme.success,
              ),
            ),
        ])),
        subtitle: RichText(
          text: TextSpan(style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500), children: [
            TextSpan(
              text: shop.url,
              style: TextStyle(
                color: Theme.of(context).colorScheme.secondary.withOpacity(0.7),
              ),
            ),
            TextSpan(text: " "),
            TextSpan(
              text: "${shop.ownerAddress}",
              style: TextStyle(
                color: Colors.white70,
                fontWeight: FontWeight.w300,
              ),
            ),
          ]),
        ),
        leading: Icon(
          Icons.house,
        ),
        trailing: Icon(Icons.chevron_right),
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

          if (currentUrl == shop.url && isConnected) {
            ref.read(connectedShopProvider.notifier).refresh();
            ref.read(connectedShopProvider.notifier).activateRefreshTimer();
            AutoRouter.of(context).push(RemoteShopDetailScreenRoute(shopUrl: shop.url));
          } else {
            await ref.read(connectedShopProvider.notifier).loadShop(context, ref, shop.url);
          }
        },
      ),
    );
  }
}
