// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_payload.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ChatPayload _$$_ChatPayloadFromJson(Map<String, dynamic> json) =>
    _$_ChatPayload(
      toAddress: json['ToAddress'] as String,
      fromAddress: json['FromAddress'] as String,
      message: json['Message'] as String,
    );

Map<String, dynamic> _$$_ChatPayloadToJson(_$_ChatPayload instance) =>
    <String, dynamic>{
      'ToAddress': instance.toAddress,
      'FromAddress': instance.fromAddress,
      'Message': instance.message,
    };
