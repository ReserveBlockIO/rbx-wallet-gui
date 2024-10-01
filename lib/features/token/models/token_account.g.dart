// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token_account.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TokenAccount _$$_TokenAccountFromJson(Map<String, dynamic> json) =>
    _$_TokenAccount(
      smartContractId: json['SmartContractUID'] as String,
      name: json['TokenName'] as String,
      ticker: json['TokenTicker'] as String,
      balance: (json['Balance'] as num).toDouble(),
      lockedBalance: (json['LockedBalance'] as num).toDouble(),
      decimalPlaces: json['DecimalPlaces'] as int,
    );

Map<String, dynamic> _$$_TokenAccountToJson(_$_TokenAccount instance) =>
    <String, dynamic>{
      'SmartContractUID': instance.smartContractId,
      'TokenName': instance.name,
      'TokenTicker': instance.ticker,
      'Balance': instance.balance,
      'LockedBalance': instance.lockedBalance,
      'DecimalPlaces': instance.decimalPlaces,
    };
