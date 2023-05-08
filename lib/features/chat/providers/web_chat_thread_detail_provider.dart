import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/web_chat_thread.dart';
import '../services/web_chat_service.dart';

final webChatThreadDetailProvider = FutureProvider.family<WebChatThread?, String>((ref, String uuid) async {
  return WebChatService().retrieveThread(uuid);
});
