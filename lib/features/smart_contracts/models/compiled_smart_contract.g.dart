// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'compiled_smart_contract.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CompiledSmartContract _$$_CompiledSmartContractFromJson(
        Map<String, dynamic> json) =>
    _$_CompiledSmartContract(
      name: json['Name'] as String,
      description: json['Description'] as String,
      address: json['Address'] as String,
      id: json['SmartContractUID'] as String,
      signature: json['Signature'] as String?,
      primaryAsset:
          Asset.fromJson(json['SmartContractAsset'] as Map<String, dynamic>),
      isPublic: json['IsPublic'] as bool,
      features: (json['Features'] as List<dynamic>?)
              ?.map((e) => e as Map<String, dynamic>)
              .toList() ??
          [],
    );

Map<String, dynamic> _$$_CompiledSmartContractToJson(
        _$_CompiledSmartContract instance) =>
    <String, dynamic>{
      'Name': instance.name,
      'Description': instance.description,
      'Address': instance.address,
      'SmartContractUID': instance.id,
      'Signature': instance.signature,
      'SmartContractAsset': instance.primaryAsset,
      'IsPublic': instance.isPublic,
      'Features': instance.features,
    };
