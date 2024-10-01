// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sc_property.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ScProperty _$$_ScPropertyFromJson(Map<String, dynamic> json) =>
    _$_ScProperty(
      name: json['name'] as String? ?? "",
      value: json['value'] as String? ?? "",
      type: $enumDecodeNullable(_$ScPropertyTypeEnumMap, json['type']) ??
          ScPropertyType.text,
    );

Map<String, dynamic> _$$_ScPropertyToJson(_$_ScProperty instance) =>
    <String, dynamic>{
      'name': instance.name,
      'value': instance.value,
      'type': _$ScPropertyTypeEnumMap[instance.type]!,
    };

const _$ScPropertyTypeEnumMap = {
  ScPropertyType.text: 'text',
  ScPropertyType.number: 'number',
  ScPropertyType.color: 'color',
  ScPropertyType.url: 'url',
};
