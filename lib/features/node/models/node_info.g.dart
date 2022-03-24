// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'node_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_NodeInfo _$$_NodeInfoFromJson(Map<String, dynamic> json) => _$_NodeInfo(
      ip: json['NodeIP'] as String,
      height: json['NodeHeight'] as int,
      latency: json['NodeLatency'] as int,
      lastCheked: json['NodeLastChecked'] == null
          ? null
          : DateTime.parse(json['NodeLastChecked'] as String),
    );

Map<String, dynamic> _$$_NodeInfoToJson(_$_NodeInfo instance) =>
    <String, dynamic>{
      'NodeIP': instance.ip,
      'NodeHeight': instance.height,
      'NodeLatency': instance.latency,
      'NodeLastChecked': instance.lastCheked?.toIso8601String(),
    };
