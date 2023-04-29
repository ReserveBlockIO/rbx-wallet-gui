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
      thirdPartyBaseUrl: json['ThirdPartyBaseURL'] as String?,
      thirdParyApiUrl: json['ThirdPartyAPIURL'] as String?,
      description: json['Description'] as String,
      ownerAddress: json['OwnerAddress'] as String?,
      type: json['HostingType'] as int,
      ip: json['IP'] as String? ?? "NA",
      port: json['Port'] as int? ?? 0,
      stunServerGroup: json['STUNServerGroup'] as int? ?? 1,
      originalBlockHeight: (json['OriginalBlockHeight'] as num).toDouble(),
      originaTxHash: json['OriginalTXHash'] as String?,
      latestBlockHeight: (json['LatestBlockHeight'] as num).toDouble(),
      lastestTxHash: json['LatestTXHash'] as String?,
      updateTimestamp: (json['UpdateTimestamp'] as num).toDouble(),
      autoUpdateNetworkDns: json['AutoUpdateNetworkDNS'] as bool,
      needsPublishToNetwork: json['NeedsPublishToNetwork'] as bool,
      isOffline: json['IsOffline'] as bool,
      isPublished: json['IsPublished'] as bool,
      collectionCount: json['CollectionCount'] as int? ?? 0,
      auctionCount: json['AuctionCount'] as int? ?? 0,
      ipIsDifferent: json['IsIPDifferent'] as bool,
    );

Map<String, dynamic> _$$_DecShopToJson(_$_DecShop instance) =>
    <String, dynamic>{
      'Id': instance.id,
      'UniqueId': instance.uuid,
      'Name': instance.name,
      'DecShopURL': instance.url,
      'ThirdPartyBaseURL': instance.thirdPartyBaseUrl,
      'ThirdPartyAPIURL': instance.thirdParyApiUrl,
      'Description': instance.description,
      'OwnerAddress': instance.ownerAddress,
      'HostingType': instance.type,
      'IP': instance.ip,
      'Port': instance.port,
      'STUNServerGroup': instance.stunServerGroup,
      'OriginalBlockHeight': instance.originalBlockHeight,
      'OriginalTXHash': instance.originaTxHash,
      'LatestBlockHeight': instance.latestBlockHeight,
      'LatestTXHash': instance.lastestTxHash,
      'UpdateTimestamp': instance.updateTimestamp,
      'AutoUpdateNetworkDNS': instance.autoUpdateNetworkDns,
      'NeedsPublishToNetwork': instance.needsPublishToNetwork,
      'IsOffline': instance.isOffline,
      'IsPublished': instance.isPublished,
      'CollectionCount': instance.collectionCount,
      'AuctionCount': instance.auctionCount,
      'IsIPDifferent': instance.ipIsDifferent,
    };
