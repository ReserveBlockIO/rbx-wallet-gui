// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallet.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Wallet _$$_WalletFromJson(Map<String, dynamic> json) => _$_Wallet(
      id: json['Id'] as int,
      publicKey: json['PublicKey'] as String,
      privateKey: json['PrivateKey'] as String,
      address: json['Address'] as String,
      friendlyName: json['friendlyName'] as String?,
      balance: (json['Balance'] as num).toDouble(),
      isValidating: json['IsValidating'] as bool,
      adnr: json['ADNR'] as String?,
    );

Map<String, dynamic> _$$_WalletToJson(_$_Wallet instance) => <String, dynamic>{
      'Id': instance.id,
      'PublicKey': instance.publicKey,
      'PrivateKey': instance.privateKey,
      'Address': instance.address,
      'friendlyName': instance.friendlyName,
      'Balance': instance.balance,
      'IsValidating': instance.isValidating,
      'ADNR': instance.adnr,
    };
