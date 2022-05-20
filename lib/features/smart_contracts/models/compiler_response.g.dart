// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'compiler_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CompilerResponse _$$_CompilerResponseFromJson(Map<String, dynamic> json) =>
    _$_CompilerResponse(
      success: json['Success'] as bool,
      code: json['SmartContractCode'] as String,
      smartContract: CompiledSmartContract.fromJson(
          json['SmartContract'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_CompilerResponseToJson(_$_CompilerResponse instance) =>
    <String, dynamic>{
      'Success': instance.success,
      'SmartContractCode': instance.code,
      'SmartContract': instance.smartContract,
    };
