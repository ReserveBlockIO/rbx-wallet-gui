// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shop_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ShopData _$$_ShopDataFromJson(Map<String, dynamic> json) => _$_ShopData(
      decShop: DecShop.fromJson(json['DecShop'] as Map<String, dynamic>),
      collections: (json['Collections'] as List<dynamic>?)
              ?.map((e) => CollectionData.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      listings: (json['Listings'] as List<dynamic>?)
              ?.map((e) => ListingData.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      auctions: json['Auctions'],
      bids: json['Bids'],
    );

Map<String, dynamic> _$$_ShopDataToJson(_$_ShopData instance) =>
    <String, dynamic>{
      'DecShop': instance.decShop,
      'Collections': instance.collections,
      'Listings': instance.listings,
      'Auctions': instance.auctions,
      'Bids': instance.bids,
    };

_$_CollectionData _$$_CollectionDataFromJson(Map<String, dynamic> json) =>
    _$_CollectionData(
      id: json['Id'] as int,
      name: json['Name'] as String,
      description: json['Description'] as String,
      collectionLive: json['CollectionLive'] as bool,
      isDefault: json['IsDefault'] as bool,
    );

Map<String, dynamic> _$$_CollectionDataToJson(_$_CollectionData instance) =>
    <String, dynamic>{
      'Id': instance.id,
      'Name': instance.name,
      'Description': instance.description,
      'CollectionLive': instance.collectionLive,
      'IsDefault': instance.isDefault,
    };

_$_ListingData _$$_ListingDataFromJson(Map<String, dynamic> json) =>
    _$_ListingData(
      id: json['Id'] as int,
      collectionId: json['CollectionId'] as int,
      smartContractUid: json['SmartContractUID'] as String,
      addressOwner: json['AddressOwner'] as String,
      buyNowPrice: (json['BuyNowPrice'] as num?)?.toDouble(),
      isBuyNowOnly: json['IsBuyNowOnly'] as bool,
      isRoyaltyEnforced: json['IsRoyaltyEnforced'] as bool,
      isCancelled: json['IsCancelled'] as bool,
      requireBalanceCheck: json['RequireBalanceCheck'] as bool,
      floorPrice: (json['FloorPrice'] as num?)?.toDouble(),
      reservePrice: (json['ReservePrice'] as num?)?.toDouble(),
      startDate: DateTime.parse(json['StartDate'] as String),
      endDate: DateTime.parse(json['EndDate'] as String),
      isVisibleBeforeStartDate: json['IsVisibleBeforeStartDate'] as bool,
      isVisibleAfterEndDate: json['IsVisibleAfterEndDate'] as bool,
      finalPrice: (json['FinalPrice'] as num?)?.toDouble(),
      winningAddress: json['WinningAddress'] as String?,
    );

Map<String, dynamic> _$$_ListingDataToJson(_$_ListingData instance) =>
    <String, dynamic>{
      'Id': instance.id,
      'CollectionId': instance.collectionId,
      'SmartContractUID': instance.smartContractUid,
      'AddressOwner': instance.addressOwner,
      'BuyNowPrice': instance.buyNowPrice,
      'IsBuyNowOnly': instance.isBuyNowOnly,
      'IsRoyaltyEnforced': instance.isRoyaltyEnforced,
      'IsCancelled': instance.isCancelled,
      'RequireBalanceCheck': instance.requireBalanceCheck,
      'FloorPrice': instance.floorPrice,
      'ReservePrice': instance.reservePrice,
      'StartDate': instance.startDate.toIso8601String(),
      'EndDate': instance.endDate.toIso8601String(),
      'IsVisibleBeforeStartDate': instance.isVisibleBeforeStartDate,
      'IsVisibleAfterEndDate': instance.isVisibleAfterEndDate,
      'FinalPrice': instance.finalPrice,
      'WinningAddress': instance.winningAddress,
    };
