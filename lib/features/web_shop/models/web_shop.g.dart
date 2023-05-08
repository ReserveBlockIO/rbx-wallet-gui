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
      isOnline: json['is_online'] as bool,
      isPublished: json['is_published'] as bool,
      isThirdParty: json['is_third_party'] as bool? ?? false,
    );

Map<String, dynamic> _$$_WebShopToJson(_$_WebShop instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'url': instance.url,
      'unique_id': instance.uid,
      'owner_address': instance.ownerAddress,
      'is_online': instance.isOnline,
      'is_published': instance.isPublished,
      'is_third_party': instance.isThirdParty,
    };
