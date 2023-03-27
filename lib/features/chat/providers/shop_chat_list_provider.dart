import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/providers/session_provider.dart';
import 'package:rbx_wallet/features/chat/models/chat_message.dart';
import 'package:rbx_wallet/features/chat/models/chat_payload.dart';
import 'package:rbx_wallet/features/chat/services/chat_service.dart';
import 'package:rbx_wallet/features/dst/models/dec_shop.dart';
import 'package:rbx_wallet/features/remote_shop/services/remote_shop_service.dart';
import 'package:rbx_wallet/utils/toast.dart';

class ShopChatListProvider extends StateNotifier<List<ChatMessage>> {
  final Ref ref;
  final String shopUrl;

  final newMessageController = TextEditingController();
  final newMessageFocusNode = FocusNode();

  ShopChatListProvider(this.ref, this.shopUrl) : super([]) {
    fetch();
  }

  fetch() async {
    final messages = await ChatService().listMessages(shopUrl);
    if (messages != null) {
      state = messages;
    }
  }

  sendMessage() async {
    final message = newMessageController.text.trim();
    if (message.isEmpty) {
      return;
    }

    final fromAddress = ref.read(sessionProvider).currentWallet?.address;
    if (fromAddress == null) {
      Toast.error("No wallet selected");
      return;
    }

    final payload = ChatPayload(toAddress: shopUrl, fromAddress: fromAddress, message: message);
    final success = await ChatService().sendMessage(payload);

    if (success) {
      newMessageController.clear();
      newMessageFocusNode.requestFocus();
      fetch();
    }
  }
}

final shopChatListProvider = StateNotifierProvider.family<ShopChatListProvider, List<ChatMessage>, String>(
  (ref, shopUrl) => ShopChatListProvider(ref, shopUrl),
);
