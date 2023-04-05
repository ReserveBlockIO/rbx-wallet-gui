// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bid.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Bid _$$_BidFromJson(Map<String, dynamic> json) => _$_Bid(
      id: json['Id'] as String,
      bidAddress: json['BidAddress'] as String,
      bidSignature: json['BidSignature'] as String,
      bidAmount: (json['BidAmount'] as num).toDouble(),
      maxBidAmount: (json['MaxBidAmount'] as num).toDouble(),
      bidSendTime: json['BidSendTime'] as int,
      isBuyNow: json['IsBuyNow'] as bool,
      isAutoBid: json['IsAutoBid'] as bool,
      isProcessed: json['IsProcessed'] as bool?,
      listingId: json['ListingId'] as int,
      collectionId: json['CollectionId'] as int,
      bidStatus: bidStatusFromJson(json['BidStatus'] as int),
      bidSendReceive: bidSendReceiveFromJson(json['BidSendReceive'] as int),
    );

Map<String, dynamic> _$$_BidToJson(_$_Bid instance) => <String, dynamic>{
      'Id': instance.id,
      'BidAddress': instance.bidAddress,
      'BidSignature': instance.bidSignature,
      'BidAmount': instance.bidAmount,
      'MaxBidAmount': instance.maxBidAmount,
      'BidSendTime': instance.bidSendTime,
      'IsBuyNow': instance.isBuyNow,
      'IsAutoBid': instance.isAutoBid,
      'IsProcessed': instance.isProcessed,
      'ListingId': instance.listingId,
      'CollectionId': instance.collectionId,
      'BidStatus': bidStatusToJson(instance.bidStatus),
      'BidSendReceive': bidSendReveiveToJson(instance.bidSendReceive),
    };
