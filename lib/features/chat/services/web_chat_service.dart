import 'package:rbx_wallet/core/env.dart';
import 'package:rbx_wallet/core/models/paginated_response.dart';
import 'package:rbx_wallet/core/services/base_service.dart';
import 'package:rbx_wallet/features/chat/models/web_chat_message.dart';
import 'package:rbx_wallet/features/chat/models/web_chat_thread.dart';

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

  Future<WebChatMessage?> sendMessage({
    required String threadId,
    required String body,
    required bool isFromBuyer,
  }) async {
    final params = {
      "thread": threadId,
      "body": body,
      "is_from_buyer": isFromBuyer,
    };

    try {
      final response = await postJson("/chat/$threadId/", params: params, auth: true);
      return WebChatMessage.fromJson(response['data']);
    } catch (e, st) {
      print(e);
      print(st);
      return null;
    }
  }
}
