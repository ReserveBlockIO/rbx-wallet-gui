// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'btc_web_balance_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_BtcWebBalanceInfo _$$_BtcWebBalanceInfoFromJson(Map<String, dynamic> json) =>
    _$_BtcWebBalanceInfo(
      totalRecieved: json['totalRecieved'] as int,
      totalSent: json['totalSent'] as int,
      balance: json['balance'] as int,
      txCount: json['txCount'] as int,
    );

Map<String, dynamic> _$$_BtcWebBalanceInfoToJson(
        _$_BtcWebBalanceInfo instance) =>
    <String, dynamic>{
      'totalRecieved': instance.totalRecieved,
      'totalSent': instance.totalSent,
      'balance': instance.balance,
      'txCount': instance.txCount,
    };
