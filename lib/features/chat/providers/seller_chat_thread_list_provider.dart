import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/features/chat/models/chat_thread.dart';
import 'package:rbx_wallet/features/chat/services/chat_service.dart';

class SellerChatThreadListProvider extends StateNotifier<List<ChatThread>> {
  SellerChatThreadListProvider() : super([]) {
    fetch();
  }

  fetch() async {
    final threads = await ChatService().listSellerChatThreads();
    state = threads;
  }
}

final sellerChatThreadListProvider = StateNotifierProvider<SellerChatThreadListProvider, List<ChatThread>>(
  (_) => SellerChatThreadListProvider(),
);
