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
      description: json['description'] as String? ?? '',
    );

Map<String, dynamic> _$$_EvolvePhaseToJson(_$_EvolvePhase instance) =>
    <String, dynamic>{
      'name': instance.name,
      'dateTime': instance.dateTime?.toIso8601String(),
      'description': instance.description,
    };
