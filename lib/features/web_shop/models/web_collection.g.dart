// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'web_collection.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_WebCollection _$$_WebCollectionFromJson(Map<String, dynamic> json) =>
    _$_WebCollection(
      id: json['id'] as int,
      shop: WebShop.fromJson(json['shop'] as Map<String, dynamic>),
      name: json['name'] as String,
      description: json['description'] as String,
    );

Map<String, dynamic> _$$_WebCollectionToJson(_$_WebCollection instance) =>
    <String, dynamic>{
      'id': instance.id,
      'shop': instance.shop,
      'name': instance.name,
      'description': instance.description,
    };
