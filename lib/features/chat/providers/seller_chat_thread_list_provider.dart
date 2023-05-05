import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/singletons.dart';
import 'package:rbx_wallet/core/storage.dart';
import 'package:rbx_wallet/features/chat/models/chat_thread.dart';
import 'package:rbx_wallet/features/chat/services/chat_service.dart';
import 'package:collection/collection.dart';
import 'package:rbx_wallet/features/chat/services/web_chat_service.dart';
import 'package:rbx_wallet/features/dst/providers/dec_shop_provider.dart';

class SellerChatThreadListProvider extends StateNotifier<List<ChatThread>> {
  final Ref ref;
  SellerChatThreadListProvider(this.ref) : super([]) {
    loadSavedThreads();
    fetch();
  }

  fetch() async {
    final threads = await ChatService().listSellerChatThreads();

    final shop = ref.read(decShopProvider).value;
    if (shop != null) {
      final webThreads = await WebChatService().listThreads(
        page: 1,
        shopUrl: shop.url,
      );

      for (final t in webThreads.results) {
        threads.add(t.toNative());
      }
    }

    for (final thread in threads) {
      final existingIndex = state.indexWhere((t) => t.user == thread.user);
      if (existingIndex < 0) {
        state = [thread, ...state];
      } else {
        state = [...state]
          ..removeAt(existingIndex)
          ..insert(existingIndex, thread);
      }
    }

    saveThreads();
  }

  loadSavedThreads() {
    final str = singleton<Storage>().getString(Storage.SELLER_CHAT_THREADS);

    if (str != null) {
      final List<dynamic> data = jsonDecode(str);
      final threads = data.map((m) => ChatThread.fromJson(m)).toList();
      state = threads;
    }
  }

  saveThreads() {
    final data = state.where((t) => !t.isThirdParty).map((m) => m.toJson()).toList();
    final str = jsonEncode(data);
    singleton<Storage>().setString(Storage.SELLER_CHAT_THREADS, str);
  }
}

final sellerChatThreadListProvider = StateNotifierProvider<SellerChatThreadListProvider, List<ChatThread>>(
  (ref) => SellerChatThreadListProvider(ref),
);
