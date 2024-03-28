// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'keypair.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Keypair _$$_KeypairFromJson(Map<String, dynamic> json) => _$_Keypair(
      private: json['private'] as String,
      address: json['address'] as String,
      public: json['public'] as String,
      email: json['email'] as String?,
      mneumonic: json['mneumonic'] as String?,
      btcWif: json['btcWif'] as String?,
    );

Map<String, dynamic> _$$_KeypairToJson(_$_Keypair instance) =>
    <String, dynamic>{
      'private': instance.private,
      'address': instance.address,
      'public': instance.public,
      'email': instance.email,
      'mneumonic': instance.mneumonic,
      'btcWif': instance.btcWif,
    };
