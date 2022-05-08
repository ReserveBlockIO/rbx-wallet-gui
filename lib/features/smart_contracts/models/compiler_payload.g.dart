// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'compiler_payload.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CompilerPayload _$$_CompilerPayloadFromJson(Map<String, dynamic> json) =>
    _$_CompilerPayload(
      name: json['Name'] as String,
      features: (json['Features'] as List<dynamic>?)
              ?.map((e) => e as Map<String, dynamic>)
              .toList() ??
          [],
    );

Map<String, dynamic> _$$_CompilerPayloadToJson(_$_CompilerPayload instance) =>
    <String, dynamic>{
      'Name': instance.name,
      'Features': instance.features,
    };
