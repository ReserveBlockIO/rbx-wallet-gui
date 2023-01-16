import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../../nft/models/web_nft.dart';
import 'bid.dart';
import 'store.dart';

part 'listing.freezed.dart';
part 'listing.g.dart';

@freezed
abstract class Listing with _$Listing {
  const Listing._();

  factory Listing({
    required int id,
    required String uuid,
    required String slug,
    required String name,
    required String description,
    required Store store,
    required WebNft nft,
    @JsonKey(name: "preview_urls") required List<String> previewUrls,
    @JsonKey(name: "is_auction") required bool isAuction,
    @JsonKey(name: "is_buy_now") required bool isBuyNow,
    @JsonKey(name: "buy_now_price") double? buyNowPrice,
    @JsonKey(name: "buy_now_price_rbx") double? buyNowPriceRbx,
    @JsonKey(name: "floor_price") double? floorPrice,
    @JsonKey(name: "floor_price_rbx") double? floorPriceRbx,
    required List<Bid> bids,
    @JsonKey(name: "is_purchased") required bool isPurchased,
    @JsonKey(name: "highest_bid") Bid? highestBid,
    @JsonKey(name: "starts_at") required DateTime startsAt,
    @JsonKey(name: "ends_at") DateTime? endsAt,
    @JsonKey(name: "allow_rbx") required bool allowRbx,
    @JsonKey(name: "allow_cc") required bool allowCC,
    @JsonKey(name: "append_description_text") String? appendDescriptionText,
  }) = _Listing;

  factory Listing.fromJson(Map<String, dynamic> json) => _$ListingFromJson(json);

  String get floorPriceLabel {
    if (allowRbx) {
      return "\$${(floorPrice ?? 0).toStringAsFixed(2)} USD | $floorPriceRbx RBX";
    }

    return "\$${(floorPrice ?? 0).toStringAsFixed(2)} USD";
  }

  String get buyNowPriceLabel {
    if (allowRbx) {
      return "\$${(buyNowPrice ?? 0).toStringAsFixed(2)} USD | $buyNowPriceRbx RBX";
    }
    return "\$${(buyNowPrice ?? 0).toStringAsFixed(2)} USD";
  }

  String get endTimeLabel {
    if (endsAt == null) {
      return "-";
    }

    return timeago.format(endsAt!, allowFromNow: true);
  }

  String get endTimeLabelPrecise {
    if (endsAt == null) {
      return "-";
    }

    return DateFormat.yMd().add_jm().format(endsAt!);
  }

  double get minimumBidUsd {
    if (highestBid != null) {
      return highestBid!.amount;
    }

    return floorPrice ?? 0;
  }

  double get minimumBidRbx {
    if (highestBid != null) {
      return highestBid!.amountRbx;
    }

    return floorPriceRbx ?? 0;
  }

  bool get isActive {
    if (isPurchased) {
      return false;
    }

    final now = DateTime.now();

    if (endsAt == null) {
      return now.compareTo(startsAt) > 0;
    }

    return now.compareTo(startsAt) > 0 && now.compareTo(endsAt!) < 0;
  }

  bool get hasStarted {
    final now = DateTime.now();

    return now.compareTo(startsAt) > 0;
  }

  bool get hasFinished {
    if (endsAt == null) {
      return false;
    }
    final now = DateTime.now();

    return now.compareTo(endsAt!) > 0;
  }
}
