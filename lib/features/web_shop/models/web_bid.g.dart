// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'web_bid.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_WebBid _$$_WebBidFromJson(Map<String, dynamic> json) => _$_WebBid(
      id: json['id'] as int,
      bidId: json['bid_id'] as String,
      address: json['address'] as String,
      signature: json['signature'] as String,
      amount: (json['amount'] as num).toDouble(),
      sendTime: json['send_time'] as int,
      isBuyNow: json['is_buy_now'] as bool? ?? false,
      isProcessed: json['is_processed'] as bool? ?? false,
      purchaseKey: json['purchase_key'] as String?,
      bidStatus: bidStatusFromJson(json['status'] as int),
      bidSendReceive: bidSendReceiveFromJson(json['send_receive'] as int),
    );

Map<String, dynamic> _$$_WebBidToJson(_$_WebBid instance) => <String, dynamic>{
      'id': instance.id,
      'bid_id': instance.bidId,
      'address': instance.address,
      'signature': instance.signature,
      'amount': instance.amount,
      'send_time': instance.sendTime,
      'is_buy_now': instance.isBuyNow,
      'is_processed': instance.isProcessed,
      'purchase_key': instance.purchaseKey,
      'status': bidStatusToJson(instance.bidStatus),
      'send_receive': bidSendReveiveToJson(instance.bidSendReceive),
    };
