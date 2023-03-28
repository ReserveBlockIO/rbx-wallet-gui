import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/providers/session_provider.dart';
import 'package:rbx_wallet/features/chat/models/chat_message.dart';
import 'package:rbx_wallet/features/chat/models/chat_payload.dart';
import 'package:rbx_wallet/features/chat/providers/chat_list_provider_interface.dart';
import 'package:rbx_wallet/features/chat/services/chat_service.dart';
import 'package:rbx_wallet/utils/toast.dart';

class ShopChatListProvider extends ChatListProviderInterface {
  ShopChatListProvider(ref, shopUrl) : super(ref, shopUrl) {
    fetch();
  }

  @override
  fetch() async {
    final messages = await ChatService().listMessages(identifier);

    if (messages != null) {
      if (messages.length > state.length) {
        Future.delayed(Duration(milliseconds: 100)).then((value) => scrollToBottom());
      }
      state = messages;
    }
  }

  scrollToBottom() {
    if (scrollController.hasClients) {
      scrollController.jumpTo(scrollController.position.maxScrollExtent);
    }
  }

  @override
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

    final payload = ChatPayload(toAddress: identifier, fromAddress: fromAddress, message: message);
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
