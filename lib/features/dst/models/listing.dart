import 'package:freezed_annotation/freezed_annotation.dart';

part 'listing.freezed.dart';
part 'listing.g.dart';

@freezed
class Listing with _$Listing {
  const Listing._();

  factory Listing({
    @JsonKey(name: "Id") required int id,
    @JsonKey(name: "SmartContractUID") required String smartContractUid,
    @JsonKey(name: "AddressOwner") required String ownerAddress,
    @JsonKey(name: "BuyNowPrice") double? buyNowPrice,
    @JsonKey(name: "IsBuyNowOnly") @Default(false) bool isBuyNowOnly,
    @JsonKey(name: "IsRoyaltyEnforced") @Default(false) bool isRoyaltyEnforced,
    @JsonKey(name: "IsCancelled") @Default(false) bool isCancelled,
    @JsonKey(name: "RequireBalanceCheck") @Default(false) bool requireBalanceCheck,
    @JsonKey(name: "FloorPrice") double? floorPrice,
    @JsonKey(name: "ReservePrice") double? reservePrice,
    @JsonKey(name: "StartDate") required DateTime startDate,
    @JsonKey(name: "EndDate") required DateTime endDate,
    @JsonKey(name: "IsVisibleBeforeStartDate") @Default(true) bool isVisibleBeforeStartDate,
    @JsonKey(name: "IsVisibleAfterEndDate") @Default(true) bool isVisibleAfterEndDate,
    @JsonKey(name: "FinalPrice") double? finalPrice,
    @JsonKey(name: "WinningAddress") String? winningAddress,
    @JsonKey(name: "StoreId") required int storeId,
  }) = _Listing;

  factory Listing.fromJson(Map<String, dynamic> json) => _$ListingFromJson(json);
}
