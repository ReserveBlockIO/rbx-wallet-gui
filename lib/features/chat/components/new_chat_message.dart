import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/base_component.dart';
import 'package:rbx_wallet/features/chat/providers/shop_chat_list_provider.dart';
import 'package:rbx_wallet/features/chat/providers/seller_chat_list_provider.dart';

class NewChatMessage extends BaseComponent {
  final String identifier;
  final bool isSeller;
  const NewChatMessage({
    super.key,
    required this.identifier,
    this.isSeller = false,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = isSeller ? ref.read(sellerChatListProvider(identifier).notifier) : ref.read(shopChatListProvider(identifier).notifier);

    return Container(
      color: Colors.black87,
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
