// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'btc_utxo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_BtcUtxo _$$_BtcUtxoFromJson(Map<String, dynamic> json) => _$_BtcUtxo(
      id: json['Id'] as int,
      address: json['Address'] as String,
      hash: json['TxId'] as String,
      value: json['Value'] as int,
      vout: json['Vout'] as int,
      isUsed: json['IsUsed'] as bool,
    );

Map<String, dynamic> _$$_BtcUtxoToJson(_$_BtcUtxo instance) =>
    <String, dynamic>{
      'Id': instance.id,
      'Address': instance.address,
      'TxId': instance.hash,
      'Value': instance.value,
      'Vout': instance.vout,
      'IsUsed': instance.isUsed,
    };
