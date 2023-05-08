// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'latest_chat_message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_LatestChatMessage _$$_LatestChatMessageFromJson(Map<String, dynamic> json) =>
    _$_LatestChatMessage(
      uuid: json['uuid'] as String,
      threadUuid: json['thread_uuid'] as String,
      fromAddress: json['from_address'] as String,
      toAddress: json['to_address'] as String,
      body: json['body'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$$_LatestChatMessageToJson(
        _$_LatestChatMessage instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'thread_uuid': instance.threadUuid,
      'from_address': instance.fromAddress,
      'to_address': instance.toAddress,
      'body': instance.body,
      'created_at': instance.createdAt.toIso8601String(),
    };
