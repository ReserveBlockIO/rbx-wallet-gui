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
      raKeypair: json['raKeypair'] == null
          ? null
          : RaKeypair.fromJson(json['raKeypair'] as Map<String, dynamic>),
      balance: (json['balance'] as num?)?.toDouble(),
      balanceTotal: (json['balanceTotal'] as num?)?.toDouble(),
      balanceLocked: (json['balanceLocked'] as num?)?.toDouble(),
      raBalance: (json['raBalance'] as num?)?.toDouble(),
      raBalanceTotal: (json['raBalanceTotal'] as num?)?.toDouble(),
      raBalanceLocked: (json['raBalanceLocked'] as num?)?.toDouble(),
      adnr: json['adnr'] as String?,
      usingRa: json['usingRa'] as bool? ?? false,
      raActivated: json['raActivated'] as bool? ?? false,
      isAuthenticated: json['isAuthenticated'] as bool? ?? false,
      timezoneName: json['timezoneName'] as String? ?? "America/Los_Angeles",
      rememberMe: json['rememberMe'] as bool? ?? false,
    );

Map<String, dynamic> _$$_WebSessionModelToJson(_$_WebSessionModel instance) =>
    <String, dynamic>{
      'keypair': instance.keypair,
      'raKeypair': instance.raKeypair,
      'balance': instance.balance,
      'balanceTotal': instance.balanceTotal,
      'balanceLocked': instance.balanceLocked,
      'raBalance': instance.raBalance,
      'raBalanceTotal': instance.raBalanceTotal,
      'raBalanceLocked': instance.raBalanceLocked,
      'adnr': instance.adnr,
      'usingRa': instance.usingRa,
      'raActivated': instance.raActivated,
      'isAuthenticated': instance.isAuthenticated,
      'timezoneName': instance.timezoneName,
      'rememberMe': instance.rememberMe,
    };
