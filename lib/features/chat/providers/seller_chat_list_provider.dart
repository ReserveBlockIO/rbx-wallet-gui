import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/storage.dart';
import '../models/chat_message.dart';
import '../models/chat_payload.dart';
import '../services/chat_service.dart';
import '../../dst/services/dst_service.dart';
import '../../../utils/toast.dart';
import "chat_list_provider_interface.dart";

class SellerChatListProvider extends ChatListProviderInterface {
  SellerChatListProvider(ref, address) : super(ref, address) {
    loadSavedMessages();
    fetch();
  }

  @override
  String get storageKey {
    return "${Storage.CHAT_PREPEND}_seller_$identifier";
  }

  @override
  fetch() async {
    final messages = await ChatService().listMessages(identifier);
    handleMessages(messages);
  }

  @override
  sendMessage() async {
    final message = newMessageController.text.trim();
    if (message.isEmpty) {
      return;
    }

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
