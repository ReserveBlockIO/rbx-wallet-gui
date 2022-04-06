// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'node.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Node _$$_NodeFromJson(Map<String, dynamic> json) => _$_Node(
      address: json['Address'] as String,
      uniqueName: json['UniqueName'] as String,
      connectionId: json['ConnectionId'] as int,
      ipAddress: json['IpAddress'] as String,
      connectDate: DateTime.parse(json['ConnectDate'] as String),
    );

Map<String, dynamic> _$$_NodeToJson(_$_Node instance) => <String, dynamic>{
      'Address': instance.address,
      'UniqueName': instance.uniqueName,
      'ConnectionId': instance.connectionId,
      'IpAddress': instance.ipAddress,
      'ConnectDate': instance.connectDate.toIso8601String(),
    };
