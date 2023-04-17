// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'web_shop.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_WebShop _$$_WebShopFromJson(Map<String, dynamic> json) => _$_WebShop(
      id: json['id'] as int,
      name: json['name'] as String,
      description: json['description'] as String,
      url: json['url'] as String,
      uid: json['unique_id'] as String,
      ownerAddress: json['owner_address'] as String,
      isOffline: json['is_offline'] as bool,
    );

Map<String, dynamic> _$$_WebShopToJson(_$_WebShop instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'url': instance.url,
      'unique_id': instance.uid,
      'owner_address': instance.ownerAddress,
      'is_offline': instance.isOffline,
    };
