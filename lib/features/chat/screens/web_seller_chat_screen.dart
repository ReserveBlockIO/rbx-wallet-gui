import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/base_screen.dart';
import 'package:rbx_wallet/core/components/centered_loader.dart';
import 'package:rbx_wallet/core/dialogs.dart';
import 'package:rbx_wallet/features/chat/components/new_chat_message.dart';
import 'package:rbx_wallet/features/chat/components/shop_chat_list.dart';
import 'package:rbx_wallet/features/chat/providers/seller_chat_list_provider.dart';
import 'package:rbx_wallet/features/chat/providers/web_seller_chat_list_provider.dart';
import 'package:rbx_wallet/features/web_shop/providers/web_shop_detail_provider.dart';

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
    final identifier = "$shopId||$address";

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
              body: "Are you sure you want to delete this chat thread locally?",
              destructive: true,
              confirmText: "Delete",
              cancelText: "Cancel",
            );

            if (confirmed == true) {
              final success = await ref.read(sellerChatListProvider(address).notifier).deleteThread();
              if (success) {
                Navigator.of(context).pop();
                return;
              }
            }
          },
        )
      ],
    );
  }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    final identifier = "$shopId||$address";
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
