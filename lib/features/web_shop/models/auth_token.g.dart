// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_token.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AuthToken _$$_AuthTokenFromJson(Map<String, dynamic> json) => _$_AuthToken(
      message: json['message'] as String,
      token: json['token'] as String,
      address: json['address'] as String,
      expiresAt: DateTime.parse(json['expires_at'] as String),
      signature: json['signature'] as String,
    );

Map<String, dynamic> _$$_AuthTokenToJson(_$_AuthToken instance) =>
    <String, dynamic>{
      'message': instance.message,
      'token': instance.token,
      'address': instance.address,
      'expires_at': instance.expiresAt.toIso8601String(),
      'signature': instance.signature,
    };
