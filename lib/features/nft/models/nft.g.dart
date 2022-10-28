// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nft.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Nft _$$_NftFromJson(Map<String, dynamic> json) => _$_Nft(
      name: json['Name'] as String,
      description: json['Description'] as String,
      currentOwner: json['CurrentOwner'] as String? ?? "",
      minterAddress: json['MinterAddress'] as String? ?? "",
      minterName: json['MinterName'] as String? ?? "",
      id: json['SmartContractUID'] as String,
      primaryAsset:
          Asset.fromJson(json['SmartContractAsset'] as Map<String, dynamic>),
      isPublic: json['IsPublic'] as bool,
      isPublished: json['IsPublished'] as bool,
      isMinter: json['IsMinter'] as bool,
      features: (json['Features'] as List<dynamic>?)
              ?.map((e) => e as Map<String, dynamic>)
              .toList() ??
          [],
      isProcessing: json['isProcessing'] as bool? ?? false,
      code: json['code'] as String?,
      proxiedAsset: nullToNull(json['proxiedAsset']),
      additionalProxiedAssets: nullToNull(json['additionalProxiedAssets']),
      additionalLocalAssets: json['additionalLocalAssets'] == null
          ? const []
          : nullToNull(json['additionalLocalAssets']),
      updatedEvolutionPhases: json['updatedEvolutionPhases'] == null
          ? const []
          : nullToNull(json['updatedEvolutionPhases']),
      assetsAvailable: json['assetsAvailable'] as bool? ?? false,
    );

Map<String, dynamic> _$$_NftToJson(_$_Nft instance) => <String, dynamic>{
      'Name': instance.name,
      'Description': instance.description,
      'CurrentOwner': instance.currentOwner,
      'MinterAddress': instance.minterAddress,
      'MinterName': instance.minterName,
      'SmartContractUID': instance.id,
      'SmartContractAsset': instance.primaryAsset.toJson(),
      'IsPublic': instance.isPublic,
      'IsPublished': instance.isPublished,
      'IsMinter': instance.isMinter,
      'Features': instance.features,
      'isProcessing': instance.isProcessing,
      'code': instance.code,
      'proxiedAsset': nullToNull(instance.proxiedAsset),
      'additionalProxiedAssets': nullToNull(instance.additionalProxiedAssets),
      'additionalLocalAssets': nullToNull(instance.additionalLocalAssets),
      'updatedEvolutionPhases': nullToNull(instance.updatedEvolutionPhases),
      'assetsAvailable': instance.assetsAvailable,
    };
