import 'dart:convert';

import 'package:rbx_wallet/features/chat/models/chat_message.dart';
import 'package:rbx_wallet/features/chat/models/chat_payload.dart';
import 'package:rbx_wallet/features/chat/models/chat_thread.dart';
import 'package:rbx_wallet/utils/toast.dart';

import '../../../core/services/base_service.dart';

class ChatService extends BaseService {
  ChatService() : super(apiBasePathOverride: "/dstapi/DSTV1");

  Future<List<ChatThread>> listSellerChatThreads() async {
    try {
      final response = await getText("/GetSummaryChatMessages", cleanPath: false);

      final data = jsonDecode(response);
      if (data['Success'] != true) {
        // Toast.error(data['Message']);
        print(data['Message']);
        return [];
      }

      final threads = (data['ChatMessages'] as List<dynamic>).toList().map((m) => ChatThread.fromJson(m)).toList();
      return threads;
    } catch (e) {
      print(e);
      return [];
    }
  }

  Future<List<ChatThread>> listBuyerChatThreads() async {
    try {
      final response = await getText("/GetSimpleShopChatMessages", cleanPath: false);

      final data = jsonDecode(response);
      if (data['Success'] != true) {
        // Toast.error(data['Message']);
        print(data['Message']);
        return [];
      }

      final threads = (data['ChatMessages'] as List<dynamic>).toList().map((m) => ChatThread.fromJson(m)).toList();
      return threads;
    } catch (e) {
      print(e);
      return [];
    }
  }

  Future<List<ChatMessage>?> listMessages(String identifier) async {
    try {
      final response = await getText("/GetDetailedChatMessages/$identifier", cleanPath: false);

      final data = jsonDecode(response);
      if (data['Success'] != true) {
        if (data['Message'] == 'Chat messages not found for this shop.') {
          return [];
        }

        // Toast.error(data['Message']);
        // print(data['Message']);
        return null;
      }

      final messages = (data['ChatMessages'] as List<dynamic>).toList().map((m) => ChatMessage.fromJson(m)).toList();
      return messages;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<bool> sendMessage(ChatPayload payload) async {
    try {
      final response = await postJson("/SendChatMessage", cleanPath: false, params: payload.toJson());

      if (response['data'] != null) {
        if (response['data']['Success'] == true) {
          return true;
        }
      }

      Toast.error(response['data']['Message'] ?? "A problem occurred");

      return false;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> sendShopMessage(ChatPayload payload) async {
    try {
      final response = await postJson("/SendShopChatMessage", cleanPath: false, params: payload.toJson());

      if (response['data'] != null) {
        if (response['data']['Success'] == true) {
          return true;
        }
      }

      Toast.error(response['data']['Message'] ?? "A problem occurred");

      return false;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<List<ChatMessage>> listSellerMessages(String address) async {
    try {
      final response = await getText("/GetDetailedSpecificShopChatMessages/$address", cleanPath: false);

      final data = jsonDecode(response);
      if (data['Success'] != true) {
        Toast.error(data['Message']);
        return [];
      }

      final messages = (data['ChatMessages'] as List<dynamic>).toList().map((m) => ChatMessage.fromJson(m)).toList();
      return messages;
    } catch (e) {
      print(e);
      return [];
    }
  }

  Future<bool> resendMessage(String messageId, String shopUrl) async {
    try {
      final response = await getText("/ResendChatMessage/$messageId/$shopUrl", cleanPath: false);
      print(response);
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  // Future<List<ChatMessage>?> listSimpleMessages(String shopUrl) async {
  //   try {
  //     final response = await getText("/GetSimpleChatMessages/$shopUrl", cleanPath: false);

  //     final data = jsonDecode(response);
  //     if (data['Success'] != true) {
  //       Toast.error(data['Message']);
  //       return null;
  //     }

  //     final messages = (data['ChatMessages'] as List<Map<String, dynamic>>).map((m) => ChatMessage.fromJson(m)).toList();
  //     return messages;
  //   } catch (e) {
  //     print(e);
  //     return null;
  //   }
  // }

  // Future<ChatMessage?> retrieveMessage(String messageId) async {
  //   try {
  //     final response = await getText("/GetSpecificChatMessages/$messageId", cleanPath: false);

  //     final data = jsonDecode(response);
  //     if (data['Success'] != true) {
  //       Toast.error(data['Message']);
  //       return null;
  //     }

  //     return ChatMessage.fromJson(data['Message']);
  //   } catch (e) {
  //     print(e);
  //     return null;
  //   }
  // }

  Future<bool> deleteChatThread(String identifier) async {
    try {
      final response = await getText("/DeleteChatMessages/$identifier", cleanPath: false);
      print(response);
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
