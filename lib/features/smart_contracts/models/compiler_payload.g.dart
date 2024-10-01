// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'compiler_payload.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CompilerPayload _$$_CompilerPayloadFromJson(Map<String, dynamic> json) =>
    _$_CompilerPayload(
      name: json['Name'] as String,
      minterName: json['MinterName'] as String,
      description: json['Description'] as String,
      asset: Asset.fromJson(json['SmartContractAsset'] as Map<String, dynamic>),
      isPublic: json['IsPublic'] as bool? ?? true,
      uuid: json['SmartContractUID'] as String?,
      features: (json['Features'] as List<dynamic>?)
          ?.map((e) => e as Map<String, dynamic>)
          .toList(),
      minterAddress: json['MinterAddress'] as String,
      isMinter: json['IsMinter'] as bool,
      properties: (json['Properties'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String),
      ),
      hash: json['hash'] as String,
    );

Map<String, dynamic> _$$_CompilerPayloadToJson(_$_CompilerPayload instance) =>
    <String, dynamic>{
      'Name': instance.name,
      'MinterName': instance.minterName,
      'Description': instance.description,
      'SmartContractAsset': instance.asset.toJson(),
      'IsPublic': instance.isPublic,
      'Features': instance.features,
      'MinterAddress': instance.minterAddress,
      'IsMinter': instance.isMinter,
      'Properties': instance.properties,
    };
