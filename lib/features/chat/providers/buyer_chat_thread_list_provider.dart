import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/providers/session_provider.dart';
import 'package:rbx_wallet/core/providers/web_session_provider.dart';
import 'package:rbx_wallet/core/singletons.dart';
import 'package:rbx_wallet/core/storage.dart';
import 'package:rbx_wallet/features/chat/models/chat_thread.dart';
import 'package:rbx_wallet/features/chat/services/chat_service.dart';
import 'package:collection/collection.dart';
import 'package:rbx_wallet/features/chat/services/web_chat_service.dart';

class BuyerChatThreadListProvider extends StateNotifier<List<ChatThread>> {
  final Ref ref;
  BuyerChatThreadListProvider(this.ref) : super([]) {
    loadSavedThreads();
    fetch();
  }

  fetch() async {
    final threads = await ChatService().listBuyerChatThreads();

    final address = kIsWeb ? ref.read(webSessionProvider).keypair?.address : ref.read(sessionProvider).currentWallet?.address;
    if (address != null) {
      final webThreads = await WebChatService().listThreads(page: 1, buyerAddress: address);

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
    final str = singleton<Storage>().getString(Storage.BUYER_CHAT_THREADS);

    if (str != null) {
      final List<dynamic> data = jsonDecode(str);
      final threads = data.map((m) => ChatThread.fromJson(m)).toList().where((t) => t.isThirdParty == false).toList();
      state = threads;
    }
  }

  saveThreads() {
    final data = state.where((t) => !t.isThirdParty).map((m) => m.toJson()).toList();
    final str = jsonEncode(data);
    singleton<Storage>().setString(Storage.BUYER_CHAT_THREADS, str);
  }

  void reload() {
    state = [];
    fetch();
  }
}

final buyerChatThreadListProvider = StateNotifierProvider<BuyerChatThreadListProvider, List<ChatThread>>(
  (ref) => BuyerChatThreadListProvider(ref),
);
