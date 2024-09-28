import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/providers/session_provider.dart';
import '../../../core/storage.dart';
import '../models/chat_message.dart';
import '../models/chat_payload.dart';
import 'chat_list_provider_interface.dart';
import '../services/chat_service.dart';
import '../../../utils/toast.dart';

class ShopChatListProvider extends ChatListProviderInterface {
  ShopChatListProvider(ref, shopUrl) : super(ref, shopUrl) {
    loadSavedMessages();
    fetch();
  }

  @override
  String get storageKey {
    return "${Storage.CHAT_PREPEND}_buyer_$identifier";
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

    final fromAddress = ref.read(sessionProvider).currentWallet?.address;
    if (fromAddress == null) {
      Toast.error("No account selected");
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
