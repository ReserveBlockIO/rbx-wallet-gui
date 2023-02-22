// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'web_session_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_WebSessionModel _$$_WebSessionModelFromJson(Map<String, dynamic> json) =>
    _$_WebSessionModel(
      keypair: json['keypair'] == null
          ? null
          : Keypair.fromJson(json['keypair'] as Map<String, dynamic>),
      balance: (json['balance'] as num?)?.toDouble(),
      adnr: json['adnr'] as String?,
      isAuthenticated: json['isAuthenticated'] as bool? ?? false,
      timezoneName: json['timezoneName'] as String? ?? "America/Los_Angeles",
      rememberMe: json['rememberMe'] as bool? ?? false,
    );

Map<String, dynamic> _$$_WebSessionModelToJson(_$_WebSessionModel instance) =>
    <String, dynamic>{
      'keypair': instance.keypair,
      'balance': instance.balance,
      'adnr': instance.adnr,
      'isAuthenticated': instance.isAuthenticated,
      'timezoneName': instance.timezoneName,
      'rememberMe': instance.rememberMe,
    };
