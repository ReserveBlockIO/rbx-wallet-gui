// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RemoteInfoGui _$$_RemoteInfoGuiFromJson(Map<String, dynamic> json) =>
    _$_RemoteInfoGui(
      version: json['version'] as String,
      tag: json['tag'] as String,
      url: json['url'] as String,
      date: json['date'] as String,
    );

Map<String, dynamic> _$$_RemoteInfoGuiToJson(_$_RemoteInfoGui instance) =>
    <String, dynamic>{
      'version': instance.version,
      'tag': instance.tag,
      'url': instance.url,
      'date': instance.date,
    };

_$_RemoteInfoCli _$$_RemoteInfoCliFromJson(Map<String, dynamic> json) =>
    _$_RemoteInfoCli(
      version: json['version'] as String,
      tag: json['tag'] as String,
      url: json['url'] as String,
      date: json['date'] as String,
    );

Map<String, dynamic> _$$_RemoteInfoCliToJson(_$_RemoteInfoCli instance) =>
    <String, dynamic>{
      'version': instance.version,
      'tag': instance.tag,
      'url': instance.url,
      'date': instance.date,
    };

_$_RemoteInfoSnapshot _$$_RemoteInfoSnapshotFromJson(
        Map<String, dynamic> json) =>
    _$_RemoteInfoSnapshot(
      height: json['height'] as int,
      url: json['url'] as String,
      date: json['date'] as String,
    );

Map<String, dynamic> _$$_RemoteInfoSnapshotToJson(
        _$_RemoteInfoSnapshot instance) =>
    <String, dynamic>{
      'height': instance.height,
      'url': instance.url,
      'date': instance.date,
    };

_$_RemoteInfo _$$_RemoteInfoFromJson(Map<String, dynamic> json) =>
    _$_RemoteInfo(
      gui: RemoteInfoGui.fromJson(json['gui'] as Map<String, dynamic>),
      cli: RemoteInfoCli.fromJson(json['cli'] as Map<String, dynamic>),
      snapshot:
          RemoteInfoSnapshot.fromJson(json['snapshot'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_RemoteInfoToJson(_$_RemoteInfo instance) =>
    <String, dynamic>{
      'gui': instance.gui,
      'cli': instance.cli,
      'snapshot': instance.snapshot,
    };
