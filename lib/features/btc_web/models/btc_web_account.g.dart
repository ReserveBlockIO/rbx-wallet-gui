// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'btc_web_account.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_BtcWebAccount _$$_BtcWebAccountFromJson(Map<String, dynamic> json) =>
    _$_BtcWebAccount(
      address: json['address'] as String,
      wif: json['wif'] as String,
      privateKey: json['privateKey'] as String,
      publicKey: json['publicKey'] as String,
      mnemonic: json['mnemonic'] as String?,
      adnr: json['adnr'] as String?,
    );

Map<String, dynamic> _$$_BtcWebAccountToJson(_$_BtcWebAccount instance) =>
    <String, dynamic>{
      'address': instance.address,
      'wif': instance.wif,
      'privateKey': instance.privateKey,
      'publicKey': instance.publicKey,
      'mnemonic': instance.mnemonic,
      'adnr': instance.adnr,
    };
