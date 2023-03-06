// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Store _$$_StoreFromJson(Map<String, dynamic> json) => _$_Store(
      id: json['Id'] as int,
      name: json['Name'] as String,
      description: json['Description'] as String,
      isLive: json['CollectionLive'] as bool,
      isDefault: json['IsDefault'] as bool,
    );

Map<String, dynamic> _$$_StoreToJson(_$_Store instance) => <String, dynamic>{
      'Id': instance.id,
      'Name': instance.name,
      'Description': instance.description,
      'CollectionLive': instance.isLive,
      'IsDefault': instance.isDefault,
    };
