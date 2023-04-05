import 'package:freezed_annotation/freezed_annotation.dart';

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
    @JsonKey(name: "Id") required int id,
    @JsonKey(name: "BidAddress") required String bidAddress,
    @JsonKey(name: "BidSignature") required String bidSignature,
    @JsonKey(name: "BidAmount") required double bidAmount,
    @JsonKey(name: "MaxBidAmount") required double maxBidAmount,
    @JsonKey(name: "BidSendTime") required int bidSendTime,
    @JsonKey(name: "IsBuyNow") required bool isBuyNow,
    @JsonKey(name: "IsAutoBid") required bool isAutoBid,
    @JsonKey(name: "IsProcessed") bool? isProcessed,
    @JsonKey(name: "ListingId") required int listingId,
    @JsonKey(name: "CollectionId") required String collectionId,
    @JsonKey(name: "BidStatus", fromJson: bidStatusFromJson, toJson: bidStatusToJson) required BidStatus bidStatus,
    @JsonKey(name: "BidSendReceive", fromJson: bidSendReceiveFromJson, toJson: bidSendReveiveToJson) required BidSendReceive bidSendReceive,
  }) = _Bid;

  factory Bid.fromJson(Map<String, dynamic> json) => _$BidFromJson(json);
}
