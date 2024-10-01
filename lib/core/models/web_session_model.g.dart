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
      btcKeypair: json['btcKeypair'] == null
          ? null
          : BtcWebAccount.fromJson(json['btcKeypair'] as Map<String, dynamic>),
      balance: (json['balance'] as num?)?.toDouble(),
      balanceTotal: (json['balanceTotal'] as num?)?.toDouble(),
      balanceLocked: (json['balanceLocked'] as num?)?.toDouble(),
      raBalance: (json['raBalance'] as num?)?.toDouble(),
      raBalanceTotal: (json['raBalanceTotal'] as num?)?.toDouble(),
      raBalanceLocked: (json['raBalanceLocked'] as num?)?.toDouble(),
      adnr: json['adnr'] as String?,
      selectedWalletType: $enumDecodeNullable(
              _$WalletTypeEnumMap, json['selectedWalletType']) ??
          WalletType.rbx,
      raActivated: json['raActivated'] as bool? ?? false,
      isAuthenticated: json['isAuthenticated'] as bool? ?? false,
      timezoneName: json['timezoneName'] as String? ?? "America/Los_Angeles",
      rememberMe: json['rememberMe'] as bool? ?? false,
      currentRbxWalletIndex: json['currentRbxWalletIndex'] as int? ?? 0,
      currentRaWalletIndex: json['currentRaWalletIndex'] as int? ?? 0,
      currentBtcWalletIndex: json['currentBtcWalletIndex'] as int? ?? 0,
      btcBalanceInfo: json['btcBalanceInfo'] == null
          ? null
          : BtcWebBalanceInfo.fromJson(
              json['btcBalanceInfo'] as Map<String, dynamic>),
      ready: json['ready'] as bool? ?? false,
    );

Map<String, dynamic> _$$_WebSessionModelToJson(_$_WebSessionModel instance) =>
    <String, dynamic>{
      'keypair': instance.keypair,
      'raKeypair': instance.raKeypair,
      'btcKeypair': instance.btcKeypair,
      'balance': instance.balance,
      'balanceTotal': instance.balanceTotal,
      'balanceLocked': instance.balanceLocked,
      'raBalance': instance.raBalance,
      'raBalanceTotal': instance.raBalanceTotal,
      'raBalanceLocked': instance.raBalanceLocked,
      'adnr': instance.adnr,
      'selectedWalletType': _$WalletTypeEnumMap[instance.selectedWalletType]!,
      'raActivated': instance.raActivated,
      'isAuthenticated': instance.isAuthenticated,
      'timezoneName': instance.timezoneName,
      'rememberMe': instance.rememberMe,
      'currentRbxWalletIndex': instance.currentRbxWalletIndex,
      'currentRaWalletIndex': instance.currentRaWalletIndex,
      'currentBtcWalletIndex': instance.currentBtcWalletIndex,
      'btcBalanceInfo': instance.btcBalanceInfo,
      'ready': instance.ready,
    };

const _$WalletTypeEnumMap = {
  WalletType.rbx: 'rbx',
  WalletType.ra: 'ra',
  WalletType.btc: 'btc',
};
