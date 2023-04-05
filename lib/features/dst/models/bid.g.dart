// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bid.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Bid _$$_BidFromJson(Map<String, dynamic> json) => _$_Bid(
      id: json['Id'] as int,
      bidAddress: json['BidAddress'] as String,
      bidSignature: json['BidSignature'] as String,
      bidAmount: (json['BidAmount'] as num).toDouble(),
      maxBidAmount: (json['MaxBidAmount'] as num).toDouble(),
      bidSendTime: json['BidSendTime'] as int,
      isBuyNow: json['IsBuyNow'] as bool,
      isAutoBid: json['IsAutoBid'] as bool,
      isProcessed: json['IsProcessed'] as bool?,
      listingId: json['ListingId'] as int,
      collectionId: json['CollectionId'] as String,
      bidStatus: $enumDecode(_$BidStatusEnumMap, json['BidStatus']),
      bidSendReceive:
          $enumDecode(_$BidSendReceiveEnumMap, json['BidSendReceive']),
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
      'BidStatus': _$BidStatusEnumMap[instance.bidStatus]!,
      'BidSendReceive': _$BidSendReceiveEnumMap[instance.bidSendReceive]!,
    };

const _$BidStatusEnumMap = {
  BidStatus.Accepted: 'Accepted',
  BidStatus.Rejected: 'Rejected',
  BidStatus.Sent: 'Sent',
  BidStatus.Received: 'Received',
};

const _$BidSendReceiveEnumMap = {
  BidSendReceive.Sent: 'Sent',
  BidSendReceive.Received: 'Received',
};
