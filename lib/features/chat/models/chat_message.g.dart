// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ChatMessage _$$_ChatMessageFromJson(Map<String, dynamic> json) =>
    _$_ChatMessage(
      id: json['Id'] as String,
      message: json['Message'] as String,
      toAddress: json['ToAddress'] as String,
      fromAddress: json['FromAddress'] as String,
      timestamp: json['TimeStamp'] as int,
      shopUrl: json['ShopURL'] as String?,
      received: json['MessageReceived'] as bool? ?? false,
      isThirdParty: json['IsThirdParty'] as bool? ?? false,
      isShopSentMessage: json['IsShopSentMessage'] as bool,
    );

Map<String, dynamic> _$$_ChatMessageToJson(_$_ChatMessage instance) =>
    <String, dynamic>{
      'Id': instance.id,
      'Message': instance.message,
      'ToAddress': instance.toAddress,
      'FromAddress': instance.fromAddress,
      'TimeStamp': instance.timestamp,
      'ShopURL': instance.shopUrl,
      'MessageReceived': instance.received,
      'IsThirdParty': instance.isThirdParty,
      'IsShopSentMessage': instance.isShopSentMessage,
    };
