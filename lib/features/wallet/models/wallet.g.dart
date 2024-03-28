// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallet.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Wallet _$$_WalletFromJson(Map<String, dynamic> json) => _$_Wallet(
      id: json['Id'] as int,
      publicKey: json['PublicKey'] as String,
      privateKey: json['GetKey'] as String?,
      address: json['Address'] as String,
      friendlyName: json['friendlyName'] as String?,
      balance: (json['Balance'] as num).toDouble(),
      isValidating: json['IsValidating'] as bool,
      adnr: json['ADNR'] as String?,
      recoveryAddress: json['RecoveryAddress'] as String?,
      recoveryPrivateKey: json['RecoveryPrivateKey'] as String?,
      recoveryEncryptedDecryptKey:
          json['RecoveryEncryptedDecryptKey'] as String?,
      encryptedDecryptKey: json['EncryptedDecryptKey'] as String?,
      availableBalance: (json['AvailableBalance'] as num?)?.toDouble() ?? 0.0,
      lockedBalance: (json['LockedBalance'] as num?)?.toDouble() ?? 0.0,
      totalBalance: (json['TotalBalance'] as num?)?.toDouble() ?? 0.0,
      isNetworkProtected: json['IsNetworkProtected'] as bool? ?? false,
      btcWif: json['btcWif'] as String?,
    );

Map<String, dynamic> _$$_WalletToJson(_$_Wallet instance) => <String, dynamic>{
      'Id': instance.id,
      'PublicKey': instance.publicKey,
      'GetKey': instance.privateKey,
      'Address': instance.address,
      'friendlyName': instance.friendlyName,
      'Balance': instance.balance,
      'IsValidating': instance.isValidating,
      'ADNR': instance.adnr,
      'RecoveryAddress': instance.recoveryAddress,
      'RecoveryPrivateKey': instance.recoveryPrivateKey,
      'RecoveryEncryptedDecryptKey': instance.recoveryEncryptedDecryptKey,
      'EncryptedDecryptKey': instance.encryptedDecryptKey,
      'AvailableBalance': instance.availableBalance,
      'LockedBalance': instance.lockedBalance,
      'TotalBalance': instance.totalBalance,
      'IsNetworkProtected': instance.isNetworkProtected,
      'btcWif': instance.btcWif,
    };
