import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/storage.dart';
import 'package:rbx_wallet/features/chat/models/chat_message.dart';
import 'package:rbx_wallet/features/chat/services/web_chat_service.dart';
import 'package:rbx_wallet/features/web_shop/models/web_shop.dart';
import 'package:rbx_wallet/features/web_shop/services/web_shop_service.dart';
import 'package:rbx_wallet/utils/toast.dart';
import "./chat_list_provider_interface.dart";

class WebSellerChatListProvider extends ChatListProviderInterface {
  WebShop? shop;
  String? identifierOverride;

  WebSellerChatListProvider(ref, identifier) : super(ref, identifier) {
    loadSavedMessages();
    fetch();
  }

  @override
  String get storageKey {
    return "${Storage.CHAT_PREPEND}_seller_$identifier";
  }

  @override
  fetch() async {
    if (identifier.contains("||")) {
      final shopId = int.tryParse(identifier.split("||").first);
      final address = identifier.split("||").last;

      if (shop == null) {
        if (shopId != null) {
          shop = await WebShopService().retrieveShop(shopId);
        }
      }

      if (shop != null) {
        final webThread2 = await WebChatService().getOrCreateThread(
          shopUrl: shop!.url,
          buyerAddress: address,
          isThirdParty: true,
        );
        if (webThread2 != null) {
          identifierOverride = webThread2.uuid;

          handleMessages(webThread2.toNative().messages);
        }
      }
    } else {
      final webThread = await WebChatService().retrieveThread(identifier);
      if (webThread != null) {
        shop = webThread.shop;

        handleMessages(webThread.toNative().messages);
      }
    }
  }

  @override
  sendMessage() async {
    final message = newMessageController.text.trim();
    if (message.isEmpty) {
      return;
    }

    final newMessage = await WebChatService().sendMessage(
      threadUuid: identifierOverride ?? identifier,
      body: message,
      isFromBuyer: false,
    );

    if (newMessage != null) {
      newMessageController.clear();
      newMessageFocusNode.requestFocus();
      fetch();
    } else {
      Toast.error();
    }
  }
}

final webSellerChatListProvider = StateNotifierProvider.family<WebSellerChatListProvider, List<ChatMessage>, String>(
  (ref, identifier) => WebSellerChatListProvider(ref, identifier),
);
