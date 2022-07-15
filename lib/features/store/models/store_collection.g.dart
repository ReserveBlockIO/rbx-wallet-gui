// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_collection.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_StoreCollection _$$_StoreCollectionFromJson(Map<String, dynamic> json) =>
    _$_StoreCollection(
      id: json['id'] as int,
      uuid: json['uuid'] as String,
      slug: json['slug'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      logoUrl: json['logo_url'] as String?,
      listings: (json['listings'] as List<dynamic>?)
              ?.map((e) => Listing.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$$_StoreCollectionToJson(_$_StoreCollection instance) =>
    <String, dynamic>{
      'id': instance.id,
      'uuid': instance.uuid,
      'slug': instance.slug,
      'name': instance.name,
      'description': instance.description,
      'logo_url': instance.logoUrl,
      'listings': instance.listings,
    };
