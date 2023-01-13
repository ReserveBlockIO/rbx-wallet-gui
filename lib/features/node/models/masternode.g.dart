// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'masternode.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Masternode _$$_MasternodeFromJson(Map<String, dynamic> json) => _$_Masternode(
      address: json['address'] as String,
      uniqueName: json['unique_name'] as String,
      connectDate: DateTime.parse(json['connect_date'] as String),
      isActive: json['is_active'] as bool,
      blockCount: json['block_count'] as int,
    );

Map<String, dynamic> _$$_MasternodeToJson(_$_Masternode instance) => <String, dynamic>{
      'address': instance.address,
      'unique_name': instance.uniqueName,
      'connect_date': instance.connectDate.toIso8601String(),
      'is_active': instance.isActive,
      'block_count': instance.blockCount,
    };
