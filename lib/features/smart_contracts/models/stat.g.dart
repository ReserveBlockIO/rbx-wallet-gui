// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stat.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Stat _$$_StatFromJson(Map<String, dynamic> json) => _$_Stat(
      label: json['label'] as String? ?? "",
      value: json['value'] as String? ?? "",
      description: json['description'] as String? ?? "",
      type: $enumDecodeNullable(_$StatTypeEnumMap, json['type']) ?? StatType.string,
    );

Map<String, dynamic> _$$_StatToJson(_$_Stat instance) => <String, dynamic>{
      'label': instance.label,
      'value': instance.value,
      'description': instance.description,
      'type': _$StatTypeEnumMap[instance.type]!,
    };

const _$StatTypeEnumMap = {
  StatType.string: 'string',
  StatType.integer: 'integer',
  StatType.float: 'float',
  StatType.percent: 'percent',
  StatType.color: 'color',
};
