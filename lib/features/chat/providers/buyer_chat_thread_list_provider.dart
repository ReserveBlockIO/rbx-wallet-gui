import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/features/chat/models/chat_thread.dart';
import 'package:rbx_wallet/features/chat/services/chat_service.dart';

class BuyerChatThreadListProvider extends StateNotifier<List<ChatThread>> {
  BuyerChatThreadListProvider() : super([]) {
    fetch();
  }

  fetch() async {
    final threads = await ChatService().listBuyerChatThreads();
    state = threads;
  }
}

final buyerChatThreadListProvider = StateNotifierProvider<BuyerChatThreadListProvider, List<ChatThread>>(
  (_) => BuyerChatThreadListProvider(),
);
