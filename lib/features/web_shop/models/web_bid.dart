import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';

part 'web_bid.freezed.dart';
part 'web_bid.g.dart';

enum WebBidStatus { Accepted, Rejected, Sent, Received }

bidStatusFromJson(int value) => WebBidStatus.values[value];
bidStatusToJson(WebBidStatus value) => WebBidStatus.values.indexOf(value);

enum WebBidSendReceive { Sent, Received }

bidSendReceiveFromJson(int value) => WebBidSendReceive.values[value];
bidSendReveiveToJson(WebBidSendReceive value) => WebBidSendReceive.values.indexOf(value);

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
    @JsonKey(name: "status", fromJson: bidStatusFromJson, toJson: bidStatusToJson) required WebBidStatus bidStatus,
    @JsonKey(name: "send_receive", fromJson: bidSendReceiveFromJson, toJson: bidSendReveiveToJson) required WebBidSendReceive bidSendReceive,
  }) = _WebBid;

  factory WebBid.fromJson(Map<String, dynamic> json) => _$WebBidFromJson(json);

  DateTime get sendDateTime {
    return DateTime.fromMillisecondsSinceEpoch(sendTime * 1000);
  }

  String get sendTimeLabel {
    final d = DateFormat.yMd().add_Hms().format(sendDateTime);
    final timezoneName = DateTime.now().timeZoneName.toString();
    return "$d $timezoneName";
  }
}
