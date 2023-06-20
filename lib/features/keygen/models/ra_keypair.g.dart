// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ra_keypair.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RaKeypair _$$_RaKeypairFromJson(Map<String, dynamic> json) => _$_RaKeypair(
      private: json['private'] as String,
      address: json['address'] as String,
      public: json['public'] as String,
      recoveryPrivate: json['recoveryPrivate'] as String,
      recoveryAddress: json['recoveryAddress'] as String,
      recoveryPublic: json['recoveryPublic'] as String,
      restoreCode: json['restoreCode'] as String,
    );

Map<String, dynamic> _$$_RaKeypairToJson(_$_RaKeypair instance) =>
    <String, dynamic>{
      'private': instance.private,
      'address': instance.address,
      'public': instance.public,
      'recoveryPrivate': instance.recoveryPrivate,
      'recoveryAddress': instance.recoveryAddress,
      'recoveryPublic': instance.recoveryPublic,
      'restoreCode': instance.restoreCode,
    };
