import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/features/chat/models/web_chat_thread.dart';
import 'package:rbx_wallet/features/chat/services/web_chat_service.dart';

final webChatThreadDetailProvider = FutureProvider.family<WebChatThread?, String>((ref, String uuid) async {
  return WebChatService().retrieveThread(uuid);
});
