// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'btc_account.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_BtcAccount _$$_BtcAccountFromJson(Map<String, dynamic> json) =>
    _$_BtcAccount(
      id: json['Id'] as int? ?? 0,
      address: json['Address'] as String,
      privateKey: json['PrivateKey'] as String,
      wifKey: json['WifKey'] as String,
      balance: (json['Balance'] as num?)?.toDouble() ?? 0.0,
    );

Map<String, dynamic> _$$_BtcAccountToJson(_$_BtcAccount instance) =>
    <String, dynamic>{
      'Id': instance.id,
      'Address': instance.address,
      'PrivateKey': instance.privateKey,
      'WifKey': instance.wifKey,
      'Balance': instance.balance,
    };
