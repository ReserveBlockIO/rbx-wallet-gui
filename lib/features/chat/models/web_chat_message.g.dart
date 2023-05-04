// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'web_chat_message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_WebChatMessage _$$_WebChatMessageFromJson(Map<String, dynamic> json) =>
    _$_WebChatMessage(
      id: json['id'] as int,
      threadId: json['thread'] as int,
      isFromBuyer: json['is_from_buyer'] as bool,
      body: json['body'] as String,
      isDelivered: json['is_delivered'] as bool? ?? false,
      createdAt: DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$$_WebChatMessageToJson(_$_WebChatMessage instance) =>
    <String, dynamic>{
      'id': instance.id,
      'thread': instance.threadId,
      'is_from_buyer': instance.isFromBuyer,
      'body': instance.body,
      'is_delivered': instance.isDelivered,
      'created_at': instance.createdAt.toIso8601String(),
    };
