// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'web_nft.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_WebNft _$$_WebNftFromJson(Map<String, dynamic> json) => _$_WebNft(
      identifier: json['identifier'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      minterAddress: json['minter_address'] as String,
      ownerAddress: json['owner_address'] as String,
      minterName: json['minter_name'] as String,
      primaryAssetName: json['primary_asset_name'] as String,
      primaryAssetSize: json['primary_asset_size'] as int,
      smartContractDataString: json['smart_contract_data'] as String,
      mintedAt: DateTime.parse(json['minted_at'] as String),
      data: json['data'] as String?,
      isBurned: json['is_burned'] as bool,
      assetUrls: json['asset_urls'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$_WebNftToJson(_$_WebNft instance) => <String, dynamic>{
      'identifier': instance.identifier,
      'name': instance.name,
      'description': instance.description,
      'minter_address': instance.minterAddress,
      'owner_address': instance.ownerAddress,
      'minter_name': instance.minterName,
      'primary_asset_name': instance.primaryAssetName,
      'primary_asset_size': instance.primaryAssetSize,
      'smart_contract_data': instance.smartContractDataString,
      'minted_at': instance.mintedAt.toIso8601String(),
      'data': instance.data,
      'is_burned': instance.isBurned,
      'asset_urls': instance.assetUrls,
    };
