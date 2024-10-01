import 'dart:io';

import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../nft/models/nft.dart';
import '../../../utils/files.dart';

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
    @JsonKey(name: "RequireBalanceCheck")
    @Default(true)
        bool requireBalanceCheck,
    @JsonKey(name: "IsAuctionStarted") @Default(false) bool isAuctionStarted,
    @JsonKey(name: "IsAuctionEnded") @Default(false) bool isAuctionEnded,
    @JsonKey(name: "IsSaleComplete") @Default(false) bool isSaleComplete,
    @JsonKey(name: "FloorPrice") double? floorPrice,
    @JsonKey(name: "ReservePrice") double? reservePrice,
    @JsonKey(name: "StartDate", fromJson: startDateFromJson, toJson: stateDateToJson)
        required DateTime startDate,
    @JsonKey(name: "EndDate", fromJson: endDateFromJson, toJson: endDateToJson)
        required DateTime endDate,
    @JsonKey(name: "IsVisibleBeforeStartDate")
    @Default(true)
        bool isVisibleBeforeStartDate,
    @JsonKey(name: "IsVisibleAfterEndDate")
    @Default(true)
        bool isVisibleAfterEndDate,
    @JsonKey(name: "FinalPrice") double? finalPrice,
    @JsonKey(name: "WinningAddress") String? winningAddress,
    @JsonKey(name: "CollectionId") required int collectionId,
    @JsonKey(name: "SaleHasFailed") @Default(false) bool saleHasFailed,
    @Default(false) @JsonKey(ignore: true) bool enableBuyNow,
    @Default(false) @JsonKey(ignore: true) bool enableAuction,
    @Default(false) @JsonKey(ignore: true) bool enableReservePrice,
    @Default(false) @JsonKey(ignore: true) bool galleryOnly,
    @JsonKey(ignore: true) Nft? nft,
  }) = _Listing;

  factory Listing.fromJson(Map<String, dynamic> json) =>
      _$ListingFromJson(json);

  factory Listing.empty() => Listing(
        id: 0,
        smartContractUid: '',
        ownerAddress: '',
        startDate: DateTime.now(),
        endDate: DateTime.now().add(Duration(days: 7)),
        collectionId: 0,
      );

  bool get exists {
    return id != 0;
  }

  bool get auctionStarted {
    return isAuctionStarted;
  }

  bool get auctionEnded {
    return isAuctionEnded;
  }

  bool get isBuyNow {
    return buyNowPrice != null && buyNowPrice != 0;
  }

  bool get isAuction {
    return floorPrice != null && floorPrice != 0;
  }

  String get label {
    if (isGallery) {
      return "Gallery Listing";
    }

    final List<String> components = [];
    if (isBuyNow) {
      components.add("Buy Now: $buyNowPrice VFX");
    }
    if (isAuction) {
      components.add("Floor: $floorPrice VFX");
      if (floorPrice != reservePrice) {
        components.add("Reserve: $reservePrice VFX");
      }
    }

    return components.join(' | ');
  }

  bool get deactivateForSeller {
    return isAuctionEnded || isSaleComplete || isCancelled;
  }

  bool get isGallery {
    return !isBuyNow && !isAuction;
  }

  Future<Widget> thumbnail([double size = 32]) async {
    if (nft == null) {
      return SizedBox(
        width: size,
        height: size,
      );
    }
    final a = nft!.primaryAsset;

    String? filePath;

    String thumbsPath = await assetsPath();
    thumbsPath = Platform.isMacOS
        ? "$thumbsPath/${nft!.id.replaceAll(':', '')}/thumbs/"
        : "$thumbsPath\\${nft!.id.replaceAll(':', '')}\\thumbs\\";

    if (a.isImage) {
      filePath = "$thumbsPath${a.fileName}"
          .replaceAll(".png", ".jpg")
          .replaceAll(".jpeg", ".jpg")
          .replaceAll(".gif", ".jpg")
          .replaceAll(".webp", ".jpg");
    } else if (a.isPdf) {
      filePath = "$thumbsPath${a.fileName.replaceAll('.pdf', '.jpg')}";
    }

    if (filePath != null && File(filePath).existsSync()) {
      return Image.file(
        File(filePath),
        width: size,
        height: size,
      );
    }

    if (a.isImage && File(a.fixedLocation).existsSync()) {
      return Image.file(
        File(a.fixedLocation),
        width: size,
        height: size,
      );
    }

    return Icon(a.icon);
  }
}
