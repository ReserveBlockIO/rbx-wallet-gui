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
      primaryAssetSize: (json['primary_asset_size'] as num).toDouble(),
      mintedAt: DateTime.parse(json['minted_at'] as String),
      mintTransaction: json['mint_transaction'] as String,
      burnTransaction: json['burn_transaction'] as String?,
      data: json['data'] as String,
      isBurned: json['is_burned'] as bool,
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
      'minted_at': instance.mintedAt.toIso8601String(),
      'mint_transaction': instance.mintTransaction,
      'burn_transaction': instance.burnTransaction,
      'data': instance.data,
      'is_burned': instance.isBurned,
    };
