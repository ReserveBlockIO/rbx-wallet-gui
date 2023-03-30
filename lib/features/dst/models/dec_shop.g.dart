// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dec_shop.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DecShop _$$_DecShopFromJson(Map<String, dynamic> json) => _$_DecShop(
      id: json['Id'] as int,
      uuid: json['UniqueId'] as String,
      name: json['Name'] as String,
      url: json['DecShopURL'] as String,
      description: json['Description'] as String,
      ownerAddress: json['OwnerAddress'] as String?,
      type: json['HostingType'] as int,
      ip: json['IP'] as String? ?? "",
      port: json['Port'] as int? ?? 0,
      originalBlockHeight: (json['OriginalBlockHeight'] as num).toDouble(),
      originaTxHash: json['OriginalTXHash'] as String?,
      latestBlockHeight: (json['LatestBlockHeight'] as num).toDouble(),
      lastestTxHash: json['LatestTXHash'] as String?,
      updateTimestamp: (json['UpdateTimestamp'] as num).toDouble(),
      autoUpdateNetworkDns: json['AutoUpdateNetworkDNS'] as bool,
      needsPublishToNetwork: json['NeedsPublishToNetwork'] as bool,
      isOffline: json['IsOffline'] as bool,
      isPublished: json['IsPublished'] as bool,
    );

Map<String, dynamic> _$$_DecShopToJson(_$_DecShop instance) =>
    <String, dynamic>{
      'Id': instance.id,
      'UniqueId': instance.uuid,
      'Name': instance.name,
      'DecShopURL': instance.url,
      'Description': instance.description,
      'OwnerAddress': instance.ownerAddress,
      'HostingType': instance.type,
      'IP': instance.ip,
      'Port': instance.port,
      'OriginalBlockHeight': instance.originalBlockHeight,
      'OriginalTXHash': instance.originaTxHash,
      'LatestBlockHeight': instance.latestBlockHeight,
      'LatestTXHash': instance.lastestTxHash,
      'UpdateTimestamp': instance.updateTimestamp,
      'AutoUpdateNetworkDNS': instance.autoUpdateNetworkDns,
      'NeedsPublishToNetwork': instance.needsPublishToNetwork,
      'IsOffline': instance.isOffline,
      'IsPublished': instance.isPublished,
    };
