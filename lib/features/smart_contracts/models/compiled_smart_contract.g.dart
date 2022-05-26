// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'compiled_smart_contract.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CompiledSmartContract _$$_CompiledSmartContractFromJson(
        Map<String, dynamic> json) =>
    _$_CompiledSmartContract(
      name: json['Name'] as String,
      minterName: json['MinterName'] as String?,
      description: json['Description'] as String,
      address: json['Address'] as String,
      id: json['SmartContractUID'] as String,
      signature: json['Signature'] as String?,
      primaryAsset:
          Asset.fromJson(json['SmartContractAsset'] as Map<String, dynamic>),
      isPublic: json['IsPublic'] as bool,
      isPublished: json['IsPublished'] as bool,
      features: (json['Features'] as List<dynamic>?)
              ?.map((e) => e as Map<String, dynamic>)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_CompiledSmartContractToJson(
        _$_CompiledSmartContract instance) =>
    <String, dynamic>{
      'Name': instance.name,
      'MinterName': instance.minterName,
      'Description': instance.description,
      'Address': instance.address,
      'SmartContractUID': instance.id,
      'Signature': instance.signature,
      'SmartContractAsset': instance.primaryAsset,
      'IsPublic': instance.isPublic,
      'IsPublished': instance.isPublished,
      'Features': instance.features,
    };
