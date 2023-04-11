import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rbx_wallet/features/nft/models/nft.dart';

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
    @JsonKey(name: "IsVisibleBeforeStartDate") @Default(false) bool isVisibleBeforeStartDate,
    @JsonKey(name: "IsVisibleAfterEndDate") @Default(false) bool isVisibleAfterEndDate,
    @JsonKey(name: "FinalPrice") double? finalPrice,
    @JsonKey(name: "WinningAddress") String? winningAddress,
    @JsonKey(name: "CollectionId") required int collectionId,
    @Default(false) @JsonKey(ignore: true) bool enableBuyNow,
    @Default(false) @JsonKey(ignore: true) bool enableAuction,
    @JsonKey(ignore: true) Nft? nft,
  }) = _Listing;

  factory Listing.fromJson(Map<String, dynamic> json) => _$ListingFromJson(json);

  factory Listing.empty() => Listing(
        id: 0,
        smartContractUid: '',
        ownerAddress: '',
        startDate: DateTime.now(),
        endDate: DateTime.now(),
        collectionId: 0,
      );

  bool get isBuyNow {
    return buyNowPrice != null && buyNowPrice != 0;
  }

  bool get isAuction {
    return floorPrice != null && floorPrice != 0;
  }

  String get label {
    final List<String> components = [];
    if (isBuyNow) {
      components.add("Buy Now: $buyNowPrice RBX");
    }
    if (isAuction) {
      components.add("Floor: $floorPrice RBX");
      components.add("Reserve: $reservePrice RBX");
    }

    return components.join(' | ');
  }
}
