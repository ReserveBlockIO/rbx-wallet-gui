// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mother_child.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MotherChild _$$_MotherChildFromJson(Map<String, dynamic> json) =>
    _$_MotherChild(
      address: json['Address'] as String,
      ipAddress: json['IPAddress'] as String,
      peerCount: json['PeerCount'] as int,
      balance: (json['Balance'] as num).toDouble(),
      blockHeight: json['BlockHeight'] as int,
      validatorName: json['ValidatorName'] as String,
      isValidating: json['IsValidating'] as bool,
      activeWithMother: json['ActiveWithMother'] as bool,
      activeWithValidating: json['ActiveWithValidating'] as bool,
      connectTime: DateTime.parse(json['ConnectTime'] as String),
      lastDataSentTime: DateTime.parse(json['LastDataSentTime'] as String),
      lastTaskSent: DateTime.parse(json['LastTaskSent'] as String),
    );

Map<String, dynamic> _$$_MotherChildToJson(_$_MotherChild instance) =>
    <String, dynamic>{
      'Address': instance.address,
      'IPAddress': instance.ipAddress,
      'PeerCount': instance.peerCount,
      'Balance': instance.balance,
      'BlockHeight': instance.blockHeight,
      'ValidatorName': instance.validatorName,
      'IsValidating': instance.isValidating,
      'ActiveWithMother': instance.activeWithMother,
      'ActiveWithValidating': instance.activeWithValidating,
      'ConnectTime': instance.connectTime.toIso8601String(),
      'LastDataSentTime': instance.lastDataSentTime.toIso8601String(),
      'LastTaskSent': instance.lastTaskSent.toIso8601String(),
    };
