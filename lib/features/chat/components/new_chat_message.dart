import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/base_component.dart';
import '../providers/shop_chat_list_provider.dart';
import '../providers/seller_chat_list_provider.dart';
import '../providers/web_seller_chat_list_provider.dart';
import '../providers/web_shop_chat_list_provider.dart';

class NewChatMessage extends BaseComponent {
  final String identifier;
  final bool isSeller;
  final bool isThirdParty;
  const NewChatMessage({
    super.key,
    required this.identifier,
    this.isSeller = false,
    required this.isThirdParty,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = isThirdParty
        ? isSeller
            ? ref.read(webSellerChatListProvider(identifier).notifier)
            : ref.read(webShopChatListProvider(identifier).notifier)
        : isSeller
            ? ref.read(sellerChatListProvider(identifier).notifier)
            : ref.read(shopChatListProvider(identifier).notifier);

    return Container(
      decoration: BoxDecoration(color: Colors.black87, borderRadius: BorderRadius.circular(8.0), boxShadow: [
        BoxShadow(
          color: Colors.white24,
          blurRadius: 12.0,
        )
      ]),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
        child: Row(
          children: [
            Expanded(
              child: TextFormField(
                controller: provider.newMessageController,
                focusNode: provider.newMessageFocusNode,
                decoration: InputDecoration(
                  hintText: "Send message...",
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
                buildCounter: (BuildContext context, {int? currentLength, int? maxLength, bool? isFocused}) => null,
                onFieldSubmitted: (_) {
                  provider.sendMessage();
                },
                maxLength: 240,
              ),
            ),
            IconButton(
              onPressed: () {
                provider.sendMessage();
              },
              icon: Icon(Icons.send),
            )
          ],
        ),
      ),
    );
  }
}
