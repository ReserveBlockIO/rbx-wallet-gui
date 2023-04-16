import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';

part 'bid.freezed.dart';
part 'bid.g.dart';

enum BidStatus { Accepted, Rejected, Sent, Received }

bidStatusFromJson(int value) => BidStatus.values[value];
bidStatusToJson(BidStatus value) => BidStatus.values.indexOf(value);

enum BidSendReceive { Sent, Received }

bidSendReceiveFromJson(int value) => BidSendReceive.values[value];
bidSendReveiveToJson(BidSendReceive value) => BidSendReceive.values.indexOf(value);

@freezed
class Bid with _$Bid {
  const Bid._();

  factory Bid({
    @JsonKey(name: "Id") required String id,
    @JsonKey(name: "BidAddress") required String bidAddress,
    @JsonKey(name: "BidSignature") required String bidSignature,
    @JsonKey(name: "BidAmount") required double bidAmount,
    @JsonKey(name: "MaxBidAmount") required double maxBidAmount,
    @JsonKey(name: "BidSendTime") required int bidSendTime,
    @JsonKey(name: "IsBuyNow") required bool isBuyNow,
    @JsonKey(name: "IsAutoBid") required bool isAutoBid,
    @JsonKey(name: "IsProcessed") bool? isProcessed,
    @JsonKey(name: "ListingId") required int listingId,
    @JsonKey(name: "CollectionId") required int collectionId,
    @JsonKey(name: "PurchaseKey") @Default("") String purchaseKey,
    @JsonKey(name: "BidStatus", fromJson: bidStatusFromJson, toJson: bidStatusToJson) required BidStatus bidStatus,
    @JsonKey(name: "BidSendReceive", fromJson: bidSendReceiveFromJson, toJson: bidSendReveiveToJson) required BidSendReceive bidSendReceive,
  }) = _Bid;

  factory Bid.fromJson(Map<String, dynamic> json) => _$BidFromJson(json);

  factory Bid.create({
    required String address,
    required int listingId,
    required int collectionId,
    required double bidAmount,
    required double maxBidAmount,
    bool isBuyNow = false,
    required String purchaseKey,
  }) {
    return Bid(
      id: "00000000-0000-0000-0000-000000000000",
      bidAddress: address,
      bidSignature: "",
      bidAmount: bidAmount,
      maxBidAmount: maxBidAmount,
      bidSendTime: 0,
      isBuyNow: isBuyNow,
      isAutoBid: false,
      listingId: listingId,
      collectionId: collectionId,
      bidStatus: BidStatus.Sent,
      bidSendReceive: BidSendReceive.Sent,
      purchaseKey: purchaseKey,
    );
  }

  DateTime get bidSendDateTime {
    return DateTime.fromMillisecondsSinceEpoch(bidSendTime * 1000);
  }

  String get bidSendTimeLabel {
    final d = DateFormat.yMd().add_Hms().format(bidSendDateTime);
    final timezoneName = DateTime.now().timeZoneName.toString();
    return "$d $timezoneName";
  }
}
