import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';
import 'package:rbx_wallet/features/nft/models/nft.dart';

part 'listing.freezed.dart';
part 'listing.g.dart';

stateDateToJson(DateTime date) {
  final offset = DateTime.now().timeZoneOffset;

  final d = offset.inHours < 0 ? date.subtract(offset) : date.add(offset);
  final str = d.isUtc ? d.toIso8601String() : date.toIso8601String();
  print("start");
  print(str);

  return str;
}

startDateFromJson(String dateStr) {
  final date = DateTime.parse(dateStr);

  final offset = DateTime.now().timeZoneOffset;
  final d = offset.inHours > 0 ? date.subtract(offset) : date.add(offset);
  return d;
}

endDateToJson(DateTime date) {
  final offset = DateTime.now().timeZoneOffset;
  final d = offset.inHours < 0 ? date.subtract(offset) : date.add(offset);
  final str = d.isUtc ? d.toIso8601String() : date.toIso8601String();
  print("end");
  print(str);
  return str;
}

endDateFromJson(String dateStr) {
  final date = DateTime.parse(dateStr);

  final offset = DateTime.now().timeZoneOffset;
  final d = offset.inHours > 0 ? date.subtract(offset) : date.add(offset);
  return d;
}

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
    @JsonKey(name: "IsAuctionStarted") @Default(false) bool isAuctionStarted,
    @JsonKey(name: "IsAuctionEnded") @Default(false) bool isAuctionEnded,
    @JsonKey(name: "FloorPrice") double? floorPrice,
    @JsonKey(name: "ReservePrice") double? reservePrice,
    @JsonKey(name: "StartDate", fromJson: startDateFromJson, toJson: stateDateToJson) required DateTime startDate,
    @JsonKey(name: "EndDate", fromJson: endDateFromJson, toJson: endDateToJson) required DateTime endDate,
    @JsonKey(name: "IsVisibleBeforeStartDate") @Default(true) bool isVisibleBeforeStartDate,
    @JsonKey(name: "IsVisibleAfterEndDate") @Default(true) bool isVisibleAfterEndDate,
    @JsonKey(name: "FinalPrice") double? finalPrice,
    @JsonKey(name: "WinningAddress") String? winningAddress,
    @JsonKey(name: "CollectionId") required int collectionId,
    @Default(false) @JsonKey(ignore: true) bool enableBuyNow,
    @Default(false) @JsonKey(ignore: true) bool enableAuction,
    @Default(false) @JsonKey(ignore: true) bool enableReservePrice,
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

  bool get exists {
    return id != 0;
  }

  bool get auctionStarted {
    return DateTime.now().isAfter(startDate);
  }

  bool get auctionEnded {
    return DateTime.now().isAfter(endDate);
  }

  // bool get auctionStarted {
  //   print(isAuctionStarted);
  //   return isAuctionStarted;
  //   // final offset = DateTime.now().timeZoneOffset;
  //   // final d = offset.inHours > 0 ? startDate.subtract(offset) : endDate.add(offset);
  //   // final date = d.isUtc ? d : startDate;

  //   // final now = DateTime.now();
  //   // print("=========");
  //   // print(now);
  //   // print(startDate);
  //   // print("=========");

  //   // final started = DateTime.now().isAfter(date);
  //   // print(started);
  //   // return started;
  // }

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
