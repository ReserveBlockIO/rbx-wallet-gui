// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'collection.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Collection _$$_CollectionFromJson(Map<String, dynamic> json) =>
    _$_Collection(
      id: json['Id'] as int,
      name: json['Name'] as String,
      description: json['Description'] as String,
      isLive: json['CollectionLive'] as bool,
      isDefault: json['IsDefault'] as bool,
    );

Map<String, dynamic> _$$_CollectionToJson(_$_Collection instance) =>
    <String, dynamic>{
      'Id': instance.id,
      'Name': instance.name,
      'Description': instance.description,
      'CollectionLive': instance.isLive,
      'IsDefault': instance.isDefault,
    };
