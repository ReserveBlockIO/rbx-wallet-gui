// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'node.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Node _$$_NodeFromJson(Map<String, dynamic> json) => _$_Node(
      id: json['Id'] as int,
      address: json['Address'] as String,
      uniqueName: json['UniqueName'] as String,
      position: json['Position'] as int,
      amount: (json['Amount'] as num).toDouble(),
      signature: json['Signature'] as String,
      isActive: json['IsActive'] as bool,
      failCount: json['FailCount'] as int,
      nodeIp: json['NodeIP'] as String,
      nodeReferenceId: json['NodeReferenceId'] as String,
    );

Map<String, dynamic> _$$_NodeToJson(_$_Node instance) => <String, dynamic>{
      'Id': instance.id,
      'Address': instance.address,
      'UniqueName': instance.uniqueName,
      'Position': instance.position,
      'Amount': instance.amount,
      'Signature': instance.signature,
      'IsActive': instance.isActive,
      'FailCount': instance.failCount,
      'NodeIP': instance.nodeIp,
      'NodeReferenceId': instance.nodeReferenceId,
    };
