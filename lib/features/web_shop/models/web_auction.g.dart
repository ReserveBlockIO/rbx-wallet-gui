// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'web_auction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_WebAuction _$$_WebAuctionFromJson(Map<String, dynamic> json) =>
    _$_WebAuction(
      id: json['id'] as int,
      currentBidPrice: (json['current_bid_price'] as num?)?.toDouble(),
      incrementAmount: (json['increment_amount'] as num).toDouble(),
      isReserveMet: json['is_reserve_met'] as bool? ?? false,
      isAuctionOver: json['is_auction_over'] as bool? ?? false,
      currentWinningAddress: json['current_winning_address'] as String?,
    );

Map<String, dynamic> _$$_WebAuctionToJson(_$_WebAuction instance) =>
    <String, dynamic>{
      'id': instance.id,
      'current_bid_price': instance.currentBidPrice,
      'increment_amount': instance.incrementAmount,
      'is_reserve_met': instance.isReserveMet,
      'is_auction_over': instance.isAuctionOver,
      'current_winning_address': instance.currentWinningAddress,
    };
