import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/providers/session_provider.dart';
import '../../../core/providers/web_session_provider.dart';
import '../../../core/storage.dart';
import '../models/chat_message.dart';
import 'chat_list_provider_interface.dart';
import '../services/web_chat_service.dart';
import '../../web_shop/models/web_shop.dart';
import '../../../utils/toast.dart';

class WebShopChatListProvider extends ChatListProviderInterface {
  WebShop? shop;

  WebShopChatListProvider(ref, threadId) : super(ref, threadId) {
    loadSavedMessages();
    fetch();
  }

  @override
  String get storageKey {
    return "${Storage.CHAT_PREPEND}_web_buyer_$identifier";
  }

  @override
  fetch() async {
    final webThread = await WebChatService().retrieveThread(identifier);
    if (webThread != null) {
      shop = webThread.shop;
      handleMessages(webThread.toNative().messages);
    }
  }

  @override
  sendMessage() async {
    final message = newMessageController.text.trim();
    if (message.isEmpty) {
      return;
    }

    final fromAddress = kIsWeb ? ref.read(webSessionProvider).keypair?.address : ref.read(sessionProvider).currentWallet?.address;
    if (fromAddress == null) {
      Toast.error("No account selected");
      return;
    }

    final newMessage = await WebChatService().sendMessage(threadUuid: identifier, body: message, isFromBuyer: true);

    if (newMessage != null) {
      newMessageController.clear();
      newMessageFocusNode.requestFocus();
      fetch();
    } else {
      Toast.error();
    }
  }
}

final webShopChatListProvider = StateNotifierProvider.family<WebShopChatListProvider, List<ChatMessage>, String>(
  (ref, threadId) => WebShopChatListProvider(ref, threadId),
);
