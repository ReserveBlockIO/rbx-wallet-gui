import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/singletons.dart';
import '../../../core/storage.dart';
import '../models/chat_message.dart';
import 'package:collection/collection.dart';
import 'buyer_chat_thread_list_provider.dart';
import 'seller_chat_thread_list_provider.dart';
import 'web_seller_chat_thread_list_provider.dart';
import '../services/chat_service.dart';
import '../services/web_chat_service.dart';
import '../../dst/services/dst_service.dart';
import '../../../utils/toast.dart';

abstract class ChatListProviderInterface extends StateNotifier<List<ChatMessage>> {
  final Ref ref;
  final String identifier;

  final newMessageController = TextEditingController();
  final newMessageFocusNode = FocusNode();
  final scrollController = ScrollController();

  ChatListProviderInterface(this.ref, this.identifier) : super([]);

  Future<void> fetch();

  Future<void> sendMessage();

  String get storageKey {
    throw UnimplementedError();
  }

  void handleMessages(List<ChatMessage>? messages) {
    if (messages != null) {
      if (messages.length > state.length) {
        Future.delayed(Duration(milliseconds: 100)).then((value) => scrollToBottom());
      }

      for (final message in messages) {
        final exists = state.firstWhereOrNull((m) => m.id == message.id) != null;
        if (!exists) {
          state = [...state, message];
        } else {
          final index = state.indexWhere((m) => m.id == message.id);
          state = [...state]
            ..removeAt(index)
            ..insert(index, message);
        }
      }

      saveMessages();
    }
  }

  void loadSavedMessages() {
    final str = singleton<Storage>().getString(storageKey);
    if (str != null) {
      final List<dynamic> data = jsonDecode(str);
      final messages = data.map((m) => ChatMessage.fromJson(m)).toList().where((m) => !m.isThirdParty).toList();
      state = messages;
    }
  }

  void saveMessages() {
    final data = state.where((m) => !m.isThirdParty).map((m) => m.toJson()).toList();
    final str = jsonEncode(data);
    singleton<Storage>().setString(storageKey, str);
  }

  scrollToBottom() {
    if (scrollController.hasClients) {
      scrollController.jumpTo(scrollController.position.maxScrollExtent);
    }
  }

  Future<void> resendMessage(String messageId) async {
    if (identifier.startsWith("rbx://")) {
      await ChatService().resendMessage(messageId, identifier);
    } else {
      final shop = await DstService().retreiveShop();
      if (shop == null) {
        Toast.error("No shop");
        return;
      }
      await ChatService().resendMessage(messageId, shop.url);
    }
    fetch();
  }

  Future<bool> deleteThread([String? thirdPartyIdentifier, int? shopId]) async {
    final success =
        thirdPartyIdentifier != null ? await WebChatService().deleteThread(thirdPartyIdentifier) : await ChatService().deleteChatThread(identifier);
    await Future.delayed(Duration(milliseconds: 1000));
    // if (success) {
    singleton<Storage>().remove(storageKey);
    // ref.invalidateSelf();
    ref.read(sellerChatThreadListProvider.notifier).reload();
    ref.read(buyerChatThreadListProvider.notifier).reload();
    if (shopId != null) {
      ref.read(webSellerChatThreadListProvider(shopId).notifier).reload();
    }
    return true;
    // }
    // return false;
  }
}
