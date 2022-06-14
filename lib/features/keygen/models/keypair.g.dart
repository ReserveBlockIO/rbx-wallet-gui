// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'keypair.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Keypair _$$_KeypairFromJson(Map<String, dynamic> json) => _$_Keypair(
      private: json['private'] as String,
      public: json['public'] as String,
      mneumonic: json['mneumonic'] as String?,
    );

Map<String, dynamic> _$$_KeypairToJson(_$_Keypair instance) =>
    <String, dynamic>{
      'private': instance.private,
      'public': instance.public,
      'mneumonic': instance.mneumonic,
    };
