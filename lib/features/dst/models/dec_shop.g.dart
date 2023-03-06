// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dec_shop.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DecShop _$$_DecShopFromJson(Map<String, dynamic> json) => _$_DecShop(
      id: json['UniqueId'] as String,
      name: json['Name'] as String,
      url: json['DecShopURL'] as String,
      ip: json['IP'] as String?,
      description: json['Description'] as String,
      address: json['Address'] as String,
      blockHeight: json['BlockHeight'] as int?,
      type: json['DecShopHostingType'] as int,
      needsPublishToNetwork: json['NeedsPublishToNetwork'] as bool,
      isOffline: json['IsOffline'] as bool,
    );

Map<String, dynamic> _$$_DecShopToJson(_$_DecShop instance) =>
    <String, dynamic>{
      'UniqueId': instance.id,
      'Name': instance.name,
      'DecShopURL': instance.url,
      'IP': instance.ip,
      'Description': instance.description,
      'Address': instance.address,
      'BlockHeight': instance.blockHeight,
      'DecShopHostingType': instance.type,
      'NeedsPublishToNetwork': instance.needsPublishToNetwork,
      'IsOffline': instance.isOffline,
    };
