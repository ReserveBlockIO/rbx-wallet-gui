// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'web_nft.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_WebNft _$$_WebNftFromJson(Map<String, dynamic> json) => _$_WebNft(
      identifier: json['identifier'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      ownerAddress: json['owner_address'] as String,
      minterName: json['minter_name'] as String,
      primaryAssetName: json['primary_asset_name'] as String,
      primaryAssetSize: json['primary_asset_size'] as int,
      primaryAssetRemoteKey: json['primary_asset_remote_key'] as String?,
      smartContractDataString: json['smart_contract_data'] as String,
      mintedAt: DateTime.parse(json['minted_at'] as String),
      assetsAvailable: json['assets_available'] as bool,
      data: json['data'] as String?,
    );

Map<String, dynamic> _$$_WebNftToJson(_$_WebNft instance) => <String, dynamic>{
      'identifier': instance.identifier,
      'name': instance.name,
      'description': instance.description,
      'owner_address': instance.ownerAddress,
      'minter_name': instance.minterName,
      'primary_asset_name': instance.primaryAssetName,
      'primary_asset_size': instance.primaryAssetSize,
      'primary_asset_remote_key': instance.primaryAssetRemoteKey,
      'smart_contract_data': instance.smartContractDataString,
      'minted_at': instance.mintedAt.toIso8601String(),
      'assets_available': instance.assetsAvailable,
      'data': instance.data,
    };
