import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rbx_wallet/features/web_shop/models/web_collection.dart';

import 'web_nft.dart';

part 'web_listing.freezed.dart';
part 'web_listing.g.dart';

collectionToJson(WebCollection collection) {
  return collection.id;
}

@freezed
class WebListing with _$WebListing {
  const WebListing._();

  factory WebListing({
    required int id,
    @JsonKey(toJson: collectionToJson) required WebCollection collection,
    required WebNft nft,
    @JsonKey(name: "smart_contract_uid") required String smartContractUid,
    @JsonKey(name: "owner_address") required String ownerAddress,
    @JsonKey(name: "winning_address") String? winningAddress,
    @JsonKey(name: "buy_now_price") double? buyNowPrice,
    @JsonKey(name: "floor_price") double? floorPrice,
    @JsonKey(name: "reserve_price") double? reservePrice,
    @JsonKey(name: "final_price") @Default(0) double? finalPrice,
    @JsonKey(name: "start_date") required DateTime startDate,
    @JsonKey(name: "end_date") required DateTime endDate,
    @JsonKey(name: "is_visible_before_start_date") required bool isVisibleBeforeStartDate,
    @JsonKey(name: "is_visible_after_end_date") required bool isVisibleAfterEndDate,
    @JsonKey(name: "thumbnails_fetched") required bool thumbnailsFetched,
    @JsonKey(name: "IsCancelled") @Default(false) bool isCancelled,
    @JsonKey(name: "IsAuctionStarted") @Default(true) bool isAuctionStarted,
    @JsonKey(name: "IsAuctionEnded") @Default(false) bool isAuctionEnded,
    @Default(false) @JsonKey(ignore: true) bool enableBuyNow,
    @Default(false) @JsonKey(ignore: true) bool enableAuction,
    @Default(false) @JsonKey(ignore: true) bool enableReservePrice,
    @JsonKey(defaultValue: []) required List<String> thumbnails,
  }) = _WebListing;

  factory WebListing.fromJson(Map<String, dynamic> json) => _$WebListingFromJson(json);

  factory WebListing.empty() => WebListing(
        id: 0,
        smartContractUid: '',
        ownerAddress: '',
        nft: WebNft.empty(),
        startDate: DateTime.now(),
        endDate: DateTime.now(),
        collection: WebCollection.empty(),
        isVisibleAfterEndDate: false,
        isVisibleBeforeStartDate: false,
        isAuctionStarted: true,
        thumbnails: [],
        thumbnailsFetched: false,
      );

  bool get isActive {
    final now = DateTime.now();
    return startDate.isBefore(now) && endDate.isAfter(now);
  }

  bool get exists {
    return id != 0;
  }

  bool get isBuyNow {
    return buyNowPrice != null && buyNowPrice != 0;
  }

  bool get isAuction {
    return floorPrice != null && floorPrice != 0;
  }

  bool get canBuyNow {
    return isActive && buyNowPrice != null;
  }

  bool get canBid {
    return isActive && floorPrice != null;
  }
}
