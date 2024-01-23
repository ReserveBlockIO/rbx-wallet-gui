// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'btc_wallet.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_BtcWallet _$$_BtcWalletFromJson(Map<String, dynamic> json) => _$_BtcWallet(
      privateKey: json['privateKey'] as String,
      publicKey: json['publicKey'] as String,
      address: json['address'] as String,
    );

Map<String, dynamic> _$$_BtcWalletToJson(_$_BtcWallet instance) =>
    <String, dynamic>{
      'privateKey': instance.privateKey,
      'publicKey': instance.publicKey,
      'address': instance.address,
    };
