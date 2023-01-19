// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Config _$$_ConfigFromJson(Map<String, dynamic> json) => _$_Config(
      port: json['Port'] == null ? 3338 : stringToInt(json['Port'] as String),
      apiPort: json['APIPort'] == null
          ? API_PORT_DEFAULT
          : stringToInt(json['APIPort'] as String),
      walletUnlockTime: json['WalletUnlockTime'] == null
          ? WALLET_UNLOCK_TIME_DEFAULT
          : stringToInt(json['WalletUnlockTime'] as String),
      passwordClearTime: json['PasswordClearTime'] == null
          ? PASSWORD_CLEAR_TIME_DEFAULT
          : stringToInt(json['PasswordClearTime'] as String),
      apiCallUrl: json['APICallURL'] as String? ?? API_CALL_URL_DEFAULT,
      motherAddress: json['MotherAddress'] as String? ?? MOTHER_ADDRESS_DEFAULT,
      motherPassword:
          json['MotherPassword'] as String? ?? MOTHER_PASSWORD_DEFAULT,
      testnet: json['TestNet'] == null
          ? false
          : stringToBool(json['TestNet'] as String),
      nftTimeout: json['NFTTimeout'] == null
          ? NFT_TIMEOUT_DEFAULT
          : stringToInt(json['NFTTimeout'] as String),
      autoDownloadNftAsset: json['AutoDownloadNFTAsset'] == null
          ? AUTO_DOWNLOAD_NFT_ASSET_DEFAULT
          : stringToBool(json['AutoDownloadNFTAsset'] as String),
      ignoreIncomingNfts: json['IgnoreIncomingNFTs'] == null
          ? IGNORE_INCOMING_NFTS_DEFAULT
          : stringToBool(json['IgnoreIncomingNFTs'] as String),
      rejectAssetExtensionTypes: json['RejectAssetExtensionTypes'] == null
          ? DEFAULT_REJECTED_EXTENIONS
          : stringToList(json['RejectAssetExtensionTypes'] as String),
      allowedAssetExtensionTypes: json['AllowedExtensionsTypes'] == null
          ? ALLOWED_EXTENSION_TYPES_DEFAULT
          : stringToList(json['AllowedExtensionsTypes'] as String),
    );

Map<String, dynamic> _$$_ConfigToJson(_$_Config instance) => <String, dynamic>{
      'Port': instance.port,
      'APIPort': instance.apiPort,
      'WalletUnlockTime': instance.walletUnlockTime,
      'PasswordClearTime': instance.passwordClearTime,
      'APICallURL': instance.apiCallUrl,
      'MotherAddress': instance.motherAddress,
      'MotherPassword': instance.motherPassword,
      'TestNet': instance.testnet,
      'NFTTimeout': instance.nftTimeout,
      'AutoDownloadNFTAsset': instance.autoDownloadNftAsset,
      'IgnoreIncomingNFTs': instance.ignoreIncomingNfts,
      'RejectAssetExtensionTypes': instance.rejectAssetExtensionTypes,
      'AllowedExtensionsTypes': instance.allowedAssetExtensionTypes,
    };
