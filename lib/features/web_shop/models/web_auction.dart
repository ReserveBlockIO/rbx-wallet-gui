import 'package:freezed_annotation/freezed_annotation.dart';

part 'web_auction.freezed.dart';
part 'web_auction.g.dart';

@freezed
class WebAuction with _$WebAuction {
  const WebAuction._();

  factory WebAuction({
    required int id,
    @JsonKey(name: "current_bid_price") double? currentBidPrice,
    @JsonKey(name: "increment_amount") required double incrementAmount,
    @JsonKey(name: "is_reserve_met") @Default(false) bool isReserveMet,
    @JsonKey(name: "is_auction_over") @Default(false) bool isAuctionOver,
    @JsonKey(name: "current_winning_address") String? currentWinningAddress,
  }) = _WebAuction;

  factory WebAuction.fromJson(Map<String, dynamic> json) => _$WebAuctionFromJson(json);
}
