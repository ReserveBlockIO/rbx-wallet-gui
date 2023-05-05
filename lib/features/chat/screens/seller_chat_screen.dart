import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/base_screen.dart';
import 'package:rbx_wallet/core/dialogs.dart';
import 'package:rbx_wallet/features/chat/components/new_chat_message.dart';
import 'package:rbx_wallet/features/chat/components/shop_chat_list.dart';
import 'package:rbx_wallet/features/chat/providers/seller_chat_list_provider.dart';

class SellerChatScreen extends BaseScreen {
  final String address;
  const SellerChatScreen({Key? key, @PathParam("address") required this.address}) : super(key: key);

  @override
  AppBar? appBar(BuildContext context, WidgetRef ref) {
    return AppBar(
      title: Text("Chat"),
      actions: [
        IconButton(
          onPressed: () {
            ref.read(sellerChatListProvider(address).notifier).fetch();
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
              final success = await ref.read(sellerChatListProvider(address).notifier).deleteThread(null);
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
    return Column(
      children: [
        Expanded(
          child: ShopChatList(
            identifier: address,
            isSeller: true,
            isThirdParty: false,
          ),
        ),
        NewChatMessage(
          identifier: address,
          isSeller: true,
          isThirdParty: false,
        )
      ],
    );
  }
}
