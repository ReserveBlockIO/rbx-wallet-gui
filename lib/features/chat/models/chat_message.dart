import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';

part 'chat_message.freezed.dart';
part 'chat_message.g.dart';

@freezed
abstract class ChatMessage with _$ChatMessage {
  const ChatMessage._();

  factory ChatMessage({
    @JsonKey(name: "Id") required String id,
    @JsonKey(name: "Message") required String message,
    @JsonKey(name: "ToAddress") required String toAddress,
    @JsonKey(name: "FromAddress") required String fromAddress,
    @JsonKey(name: "TimeStamp") required int timestamp,
    @JsonKey(name: "ShopURL") String? shopUrl,
    @JsonKey(name: "MessageReceived") @Default(false) bool received,
    @JsonKey(name: "IsShopSentMessage") required bool isShopSentMessage,
  }) = _ChatMessage;

  factory ChatMessage.fromJson(Map<String, dynamic> json) => _$ChatMessageFromJson(json);

  DateTime get createdAt {
    return DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
  }

  String get dateLabel {
    return DateFormat('MMMM d, y').format(createdAt);
  }

  String get timeLabel {
    return DateFormat.jm().format(createdAt);
  }

  String get fromLabel {
    final start = fromAddress.substring(0, 5);
    final end = fromAddress.substring(fromAddress.length - 5, fromAddress.length);

    return "$start...$end";
  }
}
