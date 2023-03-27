import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/base_screen.dart';
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
          ),
        ),
        NewChatMessage(
          identifier: address,
          isSeller: true,
        )
      ],
    );
  }
}
