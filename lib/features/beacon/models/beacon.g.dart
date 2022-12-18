// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'beacon.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Beacon _$$_BeaconFromJson(Map<String, dynamic> json) => _$_Beacon(
      id: json['Id'] as int,
      ipAddress: json['IPAddress'] as String,
      port: json['Port'] as int,
      name: json['Name'] as String,
      uid: json['BeaconUID'] as String,
      selfBeacon: json['SelfBeacon'] as bool,
      selfBeaconActive: json['SelfBeaconActive'] as bool,
    );

Map<String, dynamic> _$$_BeaconToJson(_$_Beacon instance) => <String, dynamic>{
      'Id': instance.id,
      'IPAddress': instance.ipAddress,
      'Port': instance.port,
      'Name': instance.name,
      'BeaconUID': instance.uid,
      'SelfBeacon': instance.selfBeacon,
      'SelfBeaconActive': instance.selfBeaconActive,
    };
