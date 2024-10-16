import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/theme/components.dart';
import '../../../core/app_router.gr.dart';
import '../../../core/base_component.dart';
import '../../../core/dialogs.dart';
import '../../../core/theme/app_theme.dart';
import '../../bridge/providers/wallet_info_provider.dart';
import '../../dst/models/dec_shop.dart';
import '../providers/connected_shop_provider.dart';
import '../../web_shop/services/web_shop_service.dart';
import '../../../utils/toast.dart';

class RemoteShopListTile extends BaseComponent {
  const RemoteShopListTile({
    super.key,
    required this.shop,
  });

  final DecShop shop;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentUrl = ref.watch(connectedShopProvider.select((v) => v.url));
    final isConnected = ref.watch(connectedShopProvider.select((v) => v.isConnected));

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: AppCard(
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
            if (shop.isThirdParty) {
              final webShop = await WebShopService().lookupShop(shop.url);

              if (webShop == null) {
                Toast.error();
                return;
              }

              AutoRouter.of(context).push(WebShopDetailScreenRoute(shopId: webShop.id));
              return;
            }

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
      ),
    );
  }
}
