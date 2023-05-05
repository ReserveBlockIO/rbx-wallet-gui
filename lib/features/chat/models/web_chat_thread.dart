import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rbx_wallet/features/chat/models/chat_message.dart';
import 'package:rbx_wallet/features/chat/models/chat_thread.dart';
import 'package:rbx_wallet/features/chat/models/web_chat_message.dart';
import 'package:rbx_wallet/features/web_shop/models/web_shop.dart';

part 'web_chat_thread.freezed.dart';
part 'web_chat_thread.g.dart';

@freezed
abstract class WebChatThread with _$WebChatThread {
  const WebChatThread._();

  factory WebChatThread(
      {required String uuid,
      required WebShop shop,
      @JsonKey(name: "is_third_party") required bool isThirdParty,
      @JsonKey(name: "buyer_address") required String buyerAddress,
      @JsonKey(name: "created_at") required DateTime createdAt,
      @Default([]) List<WebChatMessage> messages,
      @JsonKey(name: "latest_message") WebChatMessage? latestMessage}) = _WebChatThread;

  factory WebChatThread.fromJson(Map<String, dynamic> json) => _$WebChatThreadFromJson(json);

  ChatThread toNative() {
    final List<ChatMessage> nativeMessages =
        messages.isEmpty && latestMessage != null ? [latestMessage!.toNative(this)] : messages.map((m) => m.toNative(this)).toList();

    return ChatThread(
      user: buyerAddress,
      messages: nativeMessages,
      isThirdParty: isThirdParty,
    );
  }
}
