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
      properties: json['Properties'] == null
          ? const []
          : propertiesFromJson(json['Properties'] as Map<String, dynamic>?),
      nextOwner: json['NextOwner'] as String?,
      isLocked: json['IsLocked'] as bool? ?? false,
      isProcessing: json['isProcessing'] as bool? ?? false,
      code: json['code'] as String?,
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
      'Properties': instance.properties.map((e) => e.toJson()).toList(),
      'NextOwner': instance.nextOwner,
      'IsLocked': instance.isLocked,
      'isProcessing': instance.isProcessing,
      'code': instance.code,
    };
