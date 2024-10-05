import '../models/latest_chat_message.dart';

import '../../../core/env.dart';
import '../../../core/models/paginated_response.dart';
import '../../../core/services/base_service.dart';
import '../models/web_chat_message.dart';
import '../models/web_chat_thread.dart';

class WebChatService extends BaseService {
  WebChatService()
      : super(
          hostOverride: Env.explorerApiBaseUrl,
          withWebAuth: true,
        );

  Future<ServerPaginatedReponse<WebChatThread>> listThreads({int page = 1, String? buyerAddress, String? shopUrl}) async {
    if (buyerAddress == null && shopUrl == null) {
      print("buyerAddress and shopUrl can not both be null, silly goose.");
      return ServerPaginatedReponse.empty();
    }

    if (buyerAddress != null && shopUrl != null) {
      print("buyerAddress and shopUrl can not both be set, silly goose.");
      return ServerPaginatedReponse.empty();
    }

    try {
      Map<String, dynamic> params = {
        'page': page,
        ...buyerAddress != null ? {"buyer_address": buyerAddress} : {},
        ...shopUrl != null ? {"shop_url": shopUrl} : {},
      };

      final data = await getJson("/chat/", params: params);
      final List<WebChatThread> results = data['results'].map<WebChatThread>((item) => WebChatThread.fromJson(item)).toList();
      return ServerPaginatedReponse<WebChatThread>(
        count: data['count'],
        page: data['page'],
        num_pages: data['num_pages'],
        results: results,
      );
    } catch (e) {
      print(e);
      return ServerPaginatedReponse.empty();
    }
  }

  Future<List<LatestChatMessage>?> listNewMessages(String address) async {
    return [];
    try {
      final data = await getJson("/chat/new-messages", params: {'address': address});

      print(data);

      final List<LatestChatMessage> results = data['results'].map<LatestChatMessage>((item) => LatestChatMessage.fromJson(item)).toList();

      return results;
    } catch (e) {
      return null;
    }
  }

  Future<WebChatThread?> retrieveThread(String threadId) async {
    try {
      final data = await getJson("/chat/$threadId/", auth: false);
      return WebChatThread.fromJson(data);
    } catch (e, st) {
      print(e);
      print(st);
      return null;
    }
  }

  Future<bool> deleteThread(String threadId) async {
    try {
      await deleteJson("/chat/$threadId/", auth: false);
      return true;
    } catch (e, st) {
      print(e);
      print(st);
      return false;
    }
  }

  Future<WebChatThread?> getOrCreateThread({
    required String shopUrl,
    required String buyerAddress,
    required bool isThirdParty,
  }) async {
    try {
      final params = {"shop_url": shopUrl, "buyer_address": buyerAddress, "is_third_party": isThirdParty};
      final response = await postJson("/chat/", params: params, auth: false);
      return WebChatThread.fromJson(response['data']);
    } catch (e, st) {
      print(e);
      print(st);
      return null;
    }
  }

  Future<WebChatThread?> lookup({
    required String shopUrl,
    required String buyerAddress,
  }) async {
    try {
      final params = {"url": shopUrl, "buyer_address": buyerAddress};
      final response = await getJson("/chat/lookup/", params: params, auth: false);
      return WebChatThread.fromJson(response);
    } catch (e, st) {
      print(e);
      print(st);
      return null;
    }
  }

  Future<WebChatMessage?> sendMessage({
    required String threadUuid,
    required String body,
    required bool isFromBuyer,
  }) async {
    final params = {
      "body": body,
      "is_from_buyer": isFromBuyer,
    };

    try {
      final response = await postJson(
        "/chat/$threadUuid/message/",
        params: params,
        auth: true,
      );
      return WebChatMessage.fromJson(response['data']);
    } catch (e, st) {
      print(e);
      print(st);
      return null;
    }
  }
}
