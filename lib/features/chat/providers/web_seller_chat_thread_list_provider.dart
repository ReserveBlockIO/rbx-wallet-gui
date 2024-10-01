
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/chat_thread.dart';
import '../services/web_chat_service.dart';
import '../../web_shop/services/web_shop_service.dart';

class WebSellerChatThreadListProvider extends StateNotifier<List<ChatThread>> {
  final Ref ref;
  final int shopId;

  String? shopUrl;
  WebSellerChatThreadListProvider(this.ref, this.shopId) : super([]) {
    fetch();
  }

  fetch() async {
    if (shopUrl == null) {
      final shop = await WebShopService().retrieveShop(shopId);
      shopUrl = shop?.url;
    }

    if (shopUrl == null) {
      return;
    }

    final data = await WebChatService().listThreads(shopUrl: shopUrl);
    final nativeThreads = data.results.map((t) => t.toNative()).toList();

    for (final thread in nativeThreads) {
      final existingIndex = state.indexWhere((t) => t.user == thread.user);
      if (existingIndex < 0) {
        state = [thread, ...state];
      } else {
        state = [...state]
          ..removeAt(existingIndex)
          ..insert(existingIndex, thread);
      }
    }
  }

  void reload() async {
    state = [];
    await Future.delayed(Duration(milliseconds: 500));
    fetch();
  }
}

final webSellerChatThreadListProvider = StateNotifierProvider.family<WebSellerChatThreadListProvider, List<ChatThread>, int>(
  (ref, shopId) => WebSellerChatThreadListProvider(ref, shopId),
);
