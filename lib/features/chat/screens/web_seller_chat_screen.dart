import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/base_screen.dart';
import 'package:rbx_wallet/core/components/centered_loader.dart';
import 'package:rbx_wallet/core/dialogs.dart';
import 'package:rbx_wallet/features/chat/components/new_chat_message.dart';
import 'package:rbx_wallet/features/chat/components/shop_chat_list.dart';
import 'package:rbx_wallet/features/chat/providers/seller_chat_list_provider.dart';
import 'package:rbx_wallet/features/chat/providers/web_seller_chat_list_provider.dart';
import 'package:rbx_wallet/features/chat/services/web_chat_service.dart';
import 'package:rbx_wallet/features/dst/providers/dec_shop_provider.dart';
import 'package:rbx_wallet/features/global_loader/global_loading_provider.dart';
import 'package:rbx_wallet/features/web_shop/providers/web_shop_detail_provider.dart';
import 'package:rbx_wallet/features/web_shop/services/web_shop_service.dart';
import 'package:rbx_wallet/utils/toast.dart';

class WebSellerChatScreen extends BaseScreen {
  final String address;
  final int shopId;
  const WebSellerChatScreen({
    Key? key,
    @PathParam("address") required this.address,
    @PathParam("shopId") required this.shopId,
  }) : super(key: key);

  @override
  AppBar? appBar(BuildContext context, WidgetRef ref) {
    final identifier = shopId == 0 ? address : "$shopId||$address";

    return AppBar(
      title: Text("Chat with $address"),
      backgroundColor: Colors.black,
      actions: [
        IconButton(
          onPressed: () {
            ref.read(webSellerChatListProvider(identifier).notifier).fetch();
          },
          icon: Icon(Icons.refresh),
        ),
        IconButton(
          icon: Icon(Icons.delete),
          onPressed: () async {
            final confirmed = await ConfirmDialog.show(
              title: "Delete Chat Thread",
              body: "Are you sure you want to delete this chat thread?",
              destructive: true,
              confirmText: "Delete",
              cancelText: "Cancel",
            );

            if (confirmed == true) {
              ref.read(globalLoadingProvider.notifier).start();

              String? url;
              if (shopId != 0) {
                final shop = await WebShopService().retrieveShop(shopId);
                if (shop == null) {
                  Toast.error("No shop");
                  ref.read(globalLoadingProvider.notifier).complete();
                  return;
                }
              } else {
                url = ref.read(decShopProvider).value?.url;
              }

              if (url == null) {
                Toast.error("No shop");
                return;
              }

              final webThread = await WebChatService().lookup(
                shopUrl: url,
                buyerAddress: address,
              );

              if (webThread == null) {
                Toast.error("No Thread ");
                ref.read(globalLoadingProvider.notifier).complete();
                return;
              }

              print("Deleting thread ${webThread.uuid}");

              final success = await ref
                  .read(sellerChatListProvider(address).notifier)
                  .deleteThread(webThread.uuid, webThread.shop.id);
              ref.read(globalLoadingProvider.notifier).complete();
              // if (success) {
              AutoRouter.of(context).pop();
              return;
              // }
            }
          },
        )
      ],
    );
  }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    final identifier = shopId == 0 ? address : "$shopId||$address";
    return Column(
      children: [
        Expanded(
          child: ShopChatList(
            identifier: identifier,
            isSeller: true,
            isThirdParty: true,
          ),
        ),
        NewChatMessage(
          identifier: identifier,
          isSeller: true,
          isThirdParty: true,
        )
      ],
    );
  }
}
