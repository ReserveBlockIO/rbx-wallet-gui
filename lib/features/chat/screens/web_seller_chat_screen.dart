import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/base_screen.dart';
import '../../../core/dialogs.dart';
import '../components/new_chat_message.dart';
import '../components/shop_chat_list.dart';
import '../providers/seller_chat_list_provider.dart';
import '../providers/web_seller_chat_list_provider.dart';
import '../services/web_chat_service.dart';
import '../../dst/providers/dec_shop_provider.dart';
import '../../global_loader/global_loading_provider.dart';
import '../../web_shop/services/web_shop_service.dart';
import '../../../utils/toast.dart';

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

              final success = await ref.read(sellerChatListProvider(address).notifier).deleteThread(webThread.uuid, webThread.shop.id);
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
