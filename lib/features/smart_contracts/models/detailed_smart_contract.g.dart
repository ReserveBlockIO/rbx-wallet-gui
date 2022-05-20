// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detailed_smart_contract.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DetailedSmartContract _$$_DetailedSmartContractFromJson(
        Map<String, dynamic> json) =>
    _$_DetailedSmartContract(
      smartContract: CompiledSmartContract.fromJson(
          json['SmartContract'] as Map<String, dynamic>),
      code: json['SmartContractCode'] as String? ?? '',
    );

Map<String, dynamic> _$$_DetailedSmartContractToJson(
        _$_DetailedSmartContract instance) =>
    <String, dynamic>{
      'SmartContract': instance.smartContract,
      'SmartContractCode': instance.code,
    };
