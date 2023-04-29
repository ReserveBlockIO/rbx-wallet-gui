import 'package:freezed_annotation/freezed_annotation.dart';

part 'web_bid.freezed.dart';
part 'web_bid.g.dart';

enum BidStatus { Accepted, Rejected, Sent, Received }

bidStatusFromJson(int value) => BidStatus.values[value];
bidStatusToJson(BidStatus value) => BidStatus.values.indexOf(value);

enum BidSendReceive { Sent, Received }

bidSendReceiveFromJson(int value) => BidSendReceive.values[value];
bidSendReveiveToJson(BidSendReceive value) => BidSendReceive.values.indexOf(value);

@freezed
class WebBid with _$WebBid {
  const WebBid._();

  factory WebBid({
    required int id,
    @JsonKey(name: "bid_id") required String bidId,
    required String address,
    required String signature,
    required double amount,
    @JsonKey(name: "send_time") required int sendTime,
    @JsonKey(name: "is_buy_now") @Default(false) bool isBuyNow,
    @JsonKey(name: "is_processed") @Default(false) bool isProcessed,
    @JsonKey(name: "purchase_key") String? purchaseKey,
    @JsonKey(name: "status", fromJson: bidStatusFromJson, toJson: bidStatusToJson) required BidStatus bidStatus,
    @JsonKey(name: "send_receive", fromJson: bidSendReceiveFromJson, toJson: bidSendReveiveToJson) required BidSendReceive bidSendReceive,
  }) = _WebBid;

  factory WebBid.fromJson(Map<String, dynamic> json) => _$WebBidFromJson(json);

  DateTime get sendDateTime {
    return DateTime.fromMillisecondsSinceEpoch(sendTime * 1000);
  }
}
