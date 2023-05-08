// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_thread.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ChatThread _$$_ChatThreadFromJson(Map<String, dynamic> json) =>
    _$_ChatThread(
      user: json['User'] as String,
      messages: (json['Messages'] as List<dynamic>?)
              ?.map((e) => ChatMessage.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      isThirdParty: json['isThirdParty'] as bool? ?? false,
    );

Map<String, dynamic> _$$_ChatThreadToJson(_$_ChatThread instance) =>
    <String, dynamic>{
      'User': instance.user,
      'Messages': instance.messages,
      'isThirdParty': instance.isThirdParty,
    };
