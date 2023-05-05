// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'web_chat_thread.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_WebChatThread _$$_WebChatThreadFromJson(Map<String, dynamic> json) =>
    _$_WebChatThread(
      uuid: json['uuid'] as String,
      shop: WebShop.fromJson(json['shop'] as Map<String, dynamic>),
      isThirdParty: json['is_third_party'] as bool,
      buyerAddress: json['buyer_address'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      messages: (json['messages'] as List<dynamic>?)
              ?.map((e) => WebChatMessage.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      latestMessage: json['latest_message'] == null
          ? null
          : WebChatMessage.fromJson(
              json['latest_message'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_WebChatThreadToJson(_$_WebChatThread instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'shop': instance.shop,
      'is_third_party': instance.isThirdParty,
      'buyer_address': instance.buyerAddress,
      'created_at': instance.createdAt.toIso8601String(),
      'messages': instance.messages,
      'latest_message': instance.latestMessage,
    };
