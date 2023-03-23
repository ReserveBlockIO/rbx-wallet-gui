import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rbx_wallet/features/dst/models/dec_shop.dart';

part 'shop_data.freezed.dart';
part 'shop_data.g.dart';

@freezed
class OrganizedShop with _$OrganizedShop {
  const OrganizedShop._();

  factory OrganizedShop({
    required DecShop decShop,
    @Default([]) List<OrganizedCollection> collections,
  }) = _OrganizedShop;
}

@freezed
class OrganizedCollection with _$OrganizedCollection {
  const OrganizedCollection._();

  factory OrganizedCollection({
    required int id,
    required String name,
    required String description,
    required bool collectionLive,
    required bool isDefault,
    @Default([]) List<OrganizedListing> listings,
  }) = _OrganizedCollection;
}

@freezed
class OrganizedListing with _$OrganizedListing {
  const OrganizedListing._();

  factory OrganizedListing({
    required int id,
    required String smartContractUid,
    required String addressOwner,
    double? buyNowPrice,
    required bool isBuyNowOnly,
    required bool isRoyaltyEnforced,
    required bool isCancelled,
    required bool requireBalanceCheck,
    required bool isDefault,
    double? floorPrice,
    double? reservePrice,
    required DateTime startDate,
    required DateTime endDate,
    required bool isVisibleBeforeStartDate,
    required bool isVisibleAfterEndDate,
    double? finalPrice,
    String? winningAddress,
  }) = _OrganizedListing;
}

/// RAW DATA

@freezed
class ShopData with _$ShopData {
  const ShopData._();

  factory ShopData({
    @JsonKey(name: "DecShop") required DecShop decShop,
    @JsonKey(name: "Collections") @Default([]) List<CollectionData> collections,
    @JsonKey(name: "Listings") @Default([]) List<ListingData> listings,
    @JsonKey(name: "Auctions") dynamic auctions,
    @JsonKey(name: "Bids") dynamic bids,
  }) = _ShopData;

  factory ShopData.fromJson(Map<String, dynamic> json) => _$ShopDataFromJson(json);
}

@freezed
class CollectionData with _$CollectionData {
  const CollectionData._();

  factory CollectionData({
    @JsonKey(name: "Id") required int id,
    @JsonKey(name: "Name") required String name,
    @JsonKey(name: "Description") required String description,
    @JsonKey(name: "CollectionLive") required bool collectionLive,
    @JsonKey(name: "IsDefault") required bool isDefault,
  }) = _CollectionData;

  factory CollectionData.fromJson(Map<String, dynamic> json) => _$CollectionDataFromJson(json);
}

@freezed
class ListingData with _$ListingData {
  const ListingData._();

  factory ListingData({
    @JsonKey(name: "Id") required int id,
    @JsonKey(name: "CollectionId") required int collectionId,
    @JsonKey(name: "SmartContractUID") required String smartContractUid,
    @JsonKey(name: "AddressOwner") required String addressOwner,
    @JsonKey(name: "BuyNowPrice") double? buyNowPrice,
    @JsonKey(name: "IsBuyNowOnly") required bool isBuyNowOnly,
    @JsonKey(name: "IsRoyaltyEnforced") required bool isRoyaltyEnforced,
    @JsonKey(name: "IsCancelled") required bool isCancelled,
    @JsonKey(name: "RequireBalanceCheck") required bool requireBalanceCheck,
    @JsonKey(name: "IsDefault") required bool isDefault,
    @JsonKey(name: "FloorPrice") double? floorPrice,
    @JsonKey(name: "ReservePrice") double? reservePrice,
    @JsonKey(name: "StartDate") required DateTime startDate,
    @JsonKey(name: "EndDate") required DateTime endDate,
    @JsonKey(name: "IsVisibleBeforeStartDate") required bool isVisibleBeforeStartDate,
    @JsonKey(name: "IsVisibleAfterEndDate") required bool isVisibleAfterEndDate,
    @JsonKey(name: "FinalPrice") double? finalPrice,
    @JsonKey(name: "WinningAddress") String? winningAddress,
  }) = _ListingData;

  factory ListingData.fromJson(Map<String, dynamic> json) => _$ListingDataFromJson(json);
}
