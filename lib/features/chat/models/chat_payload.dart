import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_payload.freezed.dart';
part 'chat_payload.g.dart';

@freezed
abstract class ChatPayload with _$ChatPayload {
  const ChatPayload._();

  factory ChatPayload({
    @JsonKey(name: "ToAddress") required String toAddress,
    @JsonKey(name: "FromAddress") required String fromAddress,
    @JsonKey(name: "Message") required String message,
  }) = _ChatPayload;

  factory ChatPayload.fromJson(Map<String, dynamic> json) => _$ChatPayloadFromJson(json);
}
