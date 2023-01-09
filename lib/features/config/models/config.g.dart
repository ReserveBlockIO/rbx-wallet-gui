// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Config _$$_ConfigFromJson(Map<String, dynamic> json) => _$_Config(
      port: json['Port'] == null ? 3338 : stringToInt(json['Port'] as String),
      apiPort: json['APIPort'] == null
          ? 7292
          : stringToInt(json['APIPort'] as String),
      testnet: json['TestNet'] == null
          ? false
          : stringToBool(json['TestNet'] as String),
      nftTimeout: json['NFTTimeout'] == null
          ? 15
          : stringToInt(json['NFTTimeout'] as String),
      autoDownloadNftAsset: json['AutoDownloadNFTAsset'] == null
          ? true
          : stringToBool(json['AutoDownloadNFTAsset'] as String),
      rejectAssetExtensionTypes: json['RejectAssetExtensionTypes'] == null
          ? DEFAULT_REJECTED_EXTENIONS
          : stringToList(json['RejectAssetExtensionTypes'] as String),
    );

Map<String, dynamic> _$$_ConfigToJson(_$_Config instance) => <String, dynamic>{
      'Port': instance.port,
      'APIPort': instance.apiPort,
      'TestNet': instance.testnet,
      'NFTTimeout': instance.nftTimeout,
      'AutoDownloadNFTAsset': instance.autoDownloadNftAsset,
      'RejectAssetExtensionTypes': instance.rejectAssetExtensionTypes,
    };
