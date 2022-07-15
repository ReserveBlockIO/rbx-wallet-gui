// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bid.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Bid _$$_BidFromJson(Map<String, dynamic> json) => _$_Bid(
      walletAddress: json['wallet_address'] as String,
      amount: (json['amount'] as num).toDouble(),
      amountRbx: (json['amount_rbx'] as num).toDouble(),
      createdAt: DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$$_BidToJson(_$_Bid instance) => <String, dynamic>{
      'wallet_address': instance.walletAddress,
      'amount': instance.amount,
      'amount_rbx': instance.amountRbx,
      'created_at': instance.createdAt.toIso8601String(),
    };
