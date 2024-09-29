import 'package:freezed_annotation/freezed_annotation.dart';
import 'chat_message.dart';
import 'web_chat_thread.dart';

part 'web_chat_message.freezed.dart';
part 'web_chat_message.g.dart';

@freezed
abstract class WebChatMessage with _$WebChatMessage {
  const WebChatMessage._();

  factory WebChatMessage({
    required String uuid,
    @JsonKey(name: "is_from_buyer") required bool isFromBuyer,
    required String body,
    @JsonKey(name: "is_delivered") @Default(false) bool isDelivered,
    @JsonKey(name: "created_at") required DateTime createdAt,
  }) = _WebChatMessage;

  factory WebChatMessage.fromJson(Map<String, dynamic> json) => _$WebChatMessageFromJson(json);

  ChatMessage toNative(WebChatThread thread) {
    return ChatMessage(
      id: uuid,
      message: body,
      fromAddress: isFromBuyer ? thread.buyerAddress : thread.shop.url,
      toAddress: isFromBuyer ? thread.shop.url : thread.buyerAddress,
      timestamp: (createdAt.millisecondsSinceEpoch / 1000).round(),
      isShopSentMessage: !isFromBuyer,
      received: isDelivered,
      isThirdParty: thread.isThirdParty,
    );
  }
}
