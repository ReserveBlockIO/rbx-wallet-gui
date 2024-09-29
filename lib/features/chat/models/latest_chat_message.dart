import 'package:freezed_annotation/freezed_annotation.dart';

part 'latest_chat_message.freezed.dart';
part 'latest_chat_message.g.dart';

@freezed
abstract class LatestChatMessage with _$LatestChatMessage {
  const LatestChatMessage._();

  factory LatestChatMessage({
    required String uuid,
    @JsonKey(name: "thread_uuid") required String threadUuid,
    @JsonKey(name: "from_address") required String fromAddress,
    @JsonKey(name: "to_address") required String toAddress,
    @JsonKey(name: "body") required String body,
    @JsonKey(name: "created_at") required DateTime createdAt,
  }) = _LatestChatMessage;

  factory LatestChatMessage.fromJson(Map<String, dynamic> json) => _$LatestChatMessageFromJson(json);
}
