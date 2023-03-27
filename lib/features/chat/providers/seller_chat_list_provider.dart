import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/providers/session_provider.dart';
import 'package:rbx_wallet/features/chat/models/chat_message.dart';
import 'package:rbx_wallet/features/chat/models/chat_payload.dart';
import 'package:rbx_wallet/features/chat/services/chat_service.dart';
import 'package:rbx_wallet/features/dst/services/dst_service.dart';
import 'package:rbx_wallet/utils/toast.dart';
import "./chat_list_provider_interface.dart";

class SellerChatListProvider extends ChatListProviderInterface {
  // final Ref ref;
  // final String shopUrl;

  SellerChatListProvider(ref, address) : super(ref, address) {
    fetch();
  }

  @override
  fetch() async {
    final messages = await ChatService().listMessages(identifier);
    if (messages != null) {
      state = messages;
    }
  }

  @override
  sendMessage() async {
    final message = newMessageController.text.trim();
    if (message.isEmpty) {
      return;
    }

    // final fromAddress = ref.read(sessionProvider).currentWallet?.address;
    // if (fromAddress == null) {
    //   Toast.error("No wallet selected");
    //   return;
    // }

    final shop = await DstService().retreiveShop();
    if (shop == null || shop.ownerAddress == null) {
      Toast.error();
      return;
    }

    final payload = ChatPayload(toAddress: identifier, fromAddress: shop.ownerAddress!, message: message);
    final success = await ChatService().sendShopMessage(payload);

    if (success) {
      newMessageController.clear();
      newMessageFocusNode.requestFocus();
      fetch();
    }
  }
}

final sellerChatListProvider = StateNotifierProvider.family<SellerChatListProvider, List<ChatMessage>, String>(
  (ref, shopUrl) => SellerChatListProvider(ref, shopUrl),
);
