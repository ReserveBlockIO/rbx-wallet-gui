// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'compiler_payload.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CompilerPayload _$$_CompilerPayloadFromJson(Map<String, dynamic> json) =>
    _$_CompilerPayload(
      name: json['Name'] as String,
      description: json['Description'] as String,
      address: json['Address'] as String,
      assetId: json['AssetId'] as String,
      isPublic: json['IsPublic'] as bool? ?? true,
      uuid: json['SmartContractUID'] as String?,
      signature: json['Signature'] as String?,
      features: (json['Features'] as List<dynamic>?)
          ?.map((e) => e as Map<String, dynamic>)
          .toList(),
    );

Map<String, dynamic> _$$_CompilerPayloadToJson(_$_CompilerPayload instance) =>
    <String, dynamic>{
      'Name': instance.name,
      'Description': instance.description,
      'Address': instance.address,
      'AssetId': instance.assetId,
      'IsPublic': instance.isPublic,
      'SmartContractUID': instance.uuid,
      'Signature': instance.signature,
      'Features': instance.features,
    };
