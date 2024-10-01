import 'package:freezed_annotation/freezed_annotation.dart';
import '../../nft/models/web_nft.dart';
import 'web_auction.dart';
import 'web_bid.dart';
import 'web_collection.dart';

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
    @JsonKey(name: "listing_id") required int listingId,
    @JsonKey(toJson: collectionToJson) required WebCollection collection,
    @JsonKey(includeToJson: false) WebNft? nft,
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
    @JsonKey(name: "is_cancelled") @Default(false) bool isCancelled,
    @JsonKey(name: "has_started") @Default(true) bool isAuctionStarted,
    @JsonKey(name: "has_ended") @Default(false) bool isAuctionEnded,
    @JsonKey(name: "is_sale_complete") @Default(true) bool isSaleComplete,
    @JsonKey(name: "is_sale_pending") @Default(true) bool isSalePending,
    @JsonKey(name: "purchase_key") @Default("") String purchaseKey,
    @Default(false) @JsonKey(ignore: true) bool enableBuyNow,
    @Default(false) @JsonKey(ignore: true) bool enableAuction,
    @Default(false) @JsonKey(ignore: true) bool enableReservePrice,
    @Default(false) @JsonKey(ignore: true) bool galleryOnly,
    @JsonKey(defaultValue: []) required List<String> thumbnails,
    @JsonKey(name: "thumbnail_previews") Map<String, dynamic>? thumbnailPreviews,
    @Default(null) WebAuction? auction,
    @Default([]) List<WebBid> bids,
  }) = _WebListing;

  factory WebListing.fromJson(Map<String, dynamic> json) => _$WebListingFromJson(json);

  factory WebListing.empty() => WebListing(
        id: 0,
        smartContractUid: '',
        ownerAddress: '',
        startDate: DateTime.now(),
        endDate: DateTime.now().add(Duration(days: 7)),
        collection: WebCollection.empty(),
        isVisibleAfterEndDate: false,
        isVisibleBeforeStartDate: false,
        isAuctionStarted: true,
        thumbnails: [],
        listingId: 0,
      );

  bool get isActive {
    if (isSalePending || isSaleComplete) {
      return false;
    }

    final now = DateTime.now();
    return startDate.isBefore(now) && endDate.isAfter(now);
  }

  // Nft? get nft {
  //   return nft?.smartContract;
  // }

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
