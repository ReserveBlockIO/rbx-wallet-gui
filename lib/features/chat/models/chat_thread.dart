import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rbx_wallet/features/chat/models/chat_message.dart';

part 'chat_thread.freezed.dart';
part 'chat_thread.g.dart';

@freezed
abstract class ChatThread with _$ChatThread {
  const ChatThread._();

  factory ChatThread({
    @JsonKey(name: "User") required String user,
    @JsonKey(name: "Messages") @Default([]) List<ChatMessage> messages,
  }) = _ChatThread;

  factory ChatThread.fromJson(Map<String, dynamic> json) => _$ChatThreadFromJson(json);
}
