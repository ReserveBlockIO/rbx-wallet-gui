// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'evolve.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Evolve _$$_EvolveFromJson(Map<String, dynamic> json) => _$_Evolve(
      id: json['id'] as String? ?? '',
      type: $enumDecodeNullable(_$EvolveTypeEnumMap, json['type']) ??
          EvolveType.time,
      url: json['url'] as String? ?? '',
      phases: (json['phases'] as List<dynamic>?)
              ?.map((e) => EvolvePhase.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      isDynamic: json['isDynamic'] as bool? ?? false,
      asset: json['asset'] == null
          ? null
          : Asset.fromJson(json['asset'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_EvolveToJson(_$_Evolve instance) => <String, dynamic>{
      'id': instance.id,
      'type': _$EvolveTypeEnumMap[instance.type],
      'url': instance.url,
      'phases': instance.phases.map((e) => e.toJson()).toList(),
      'isDynamic': instance.isDynamic,
      'asset': instance.asset?.toJson(),
    };

const _$EvolveTypeEnumMap = {
  EvolveType.time: 'time',
  EvolveType.variable: 'variable',
};