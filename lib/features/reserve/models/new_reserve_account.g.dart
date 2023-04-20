// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_reserve_account.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_NewReserveAccount _$$_NewReserveAccountFromJson(Map<String, dynamic> json) =>
    _$_NewReserveAccount(
      privateKey: json['PrivateKey'] as String,
      address: json['Address'] as String,
      recoveryAddress: json['RecoveryAddress'] as String,
      recoveryPrivateKey: json['RecoveryPrivateKey'] as String,
      restoreCode: json['RestoreCode'] as String,
    );

Map<String, dynamic> _$$_NewReserveAccountToJson(
        _$_NewReserveAccount instance) =>
    <String, dynamic>{
      'PrivateKey': instance.privateKey,
      'Address': instance.address,
      'RecoveryAddress': instance.recoveryAddress,
      'RecoveryPrivateKey': instance.recoveryPrivateKey,
      'RestoreCode': instance.restoreCode,
    };
