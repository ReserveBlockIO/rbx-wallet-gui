// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'evolve_phase.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_EvolvePhase _$$_EvolvePhaseFromJson(Map<String, dynamic> json) =>
    _$_EvolvePhase(
      name: json['name'] as String? ?? '',
      dateTime: json['dateTime'] == null
          ? null
          : DateTime.parse(json['dateTime'] as String),
      blockHeight: json['blockHeight'] as int?,
      description: json['description'] as String? ?? '',
      evolutionState: json['evolutionState'] as int? ?? 0,
      isCurrentState: json['isCurrentState'] as bool? ?? false,
      asset: json['asset'] == null
          ? null
          : Asset.fromJson(json['asset'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_EvolvePhaseToJson(_$_EvolvePhase instance) =>
    <String, dynamic>{
      'name': instance.name,
      'dateTime': instance.dateTime?.toIso8601String(),
      'blockHeight': instance.blockHeight,
      'description': instance.description,
      'evolutionState': instance.evolutionState,
      'isCurrentState': instance.isCurrentState,
      'asset': instance.asset?.toJson(),
    };
