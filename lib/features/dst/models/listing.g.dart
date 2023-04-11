// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'listing.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Listing _$$_ListingFromJson(Map<String, dynamic> json) => _$_Listing(
      id: json['Id'] as int,
      smartContractUid: json['SmartContractUID'] as String,
      ownerAddress: json['AddressOwner'] as String,
      buyNowPrice: (json['BuyNowPrice'] as num?)?.toDouble(),
      isBuyNowOnly: json['IsBuyNowOnly'] as bool? ?? false,
      isRoyaltyEnforced: json['IsRoyaltyEnforced'] as bool? ?? false,
      isCancelled: json['IsCancelled'] as bool? ?? false,
      requireBalanceCheck: json['RequireBalanceCheck'] as bool? ?? false,
      floorPrice: (json['FloorPrice'] as num?)?.toDouble(),
      reservePrice: (json['ReservePrice'] as num?)?.toDouble(),
      startDate: DateTime.parse(json['StartDate'] as String),
      endDate: DateTime.parse(json['EndDate'] as String),
      isVisibleBeforeStartDate:
          json['IsVisibleBeforeStartDate'] as bool? ?? true,
      isVisibleAfterEndDate: json['IsVisibleAfterEndDate'] as bool? ?? true,
      finalPrice: (json['FinalPrice'] as num?)?.toDouble(),
      winningAddress: json['WinningAddress'] as String?,
      collectionId: json['CollectionId'] as int,
    );

Map<String, dynamic> _$$_ListingToJson(_$_Listing instance) =>
    <String, dynamic>{
      'Id': instance.id,
      'SmartContractUID': instance.smartContractUid,
      'AddressOwner': instance.ownerAddress,
      'BuyNowPrice': instance.buyNowPrice,
      'IsBuyNowOnly': instance.isBuyNowOnly,
      'IsRoyaltyEnforced': instance.isRoyaltyEnforced,
      'IsCancelled': instance.isCancelled,
      'RequireBalanceCheck': instance.requireBalanceCheck,
      'FloorPrice': instance.floorPrice,
      'ReservePrice': instance.reservePrice,
      'StartDate': stateDateToJson(instance.startDate),
      'EndDate': endDateToJson(instance.endDate),
      'IsVisibleBeforeStartDate': instance.isVisibleBeforeStartDate,
      'IsVisibleAfterEndDate': instance.isVisibleAfterEndDate,
      'FinalPrice': instance.finalPrice,
      'WinningAddress': instance.winningAddress,
      'CollectionId': instance.collectionId,
    };
