// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'genesis_block.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_GenesisBlock _$$_GenesisBlockFromJson(Map<String, dynamic> json) => _$_GenesisBlock(
      height: json['Height'] as int,
      chainRefId: json['ChainRefId'] as String,
      timestamp: json['Timestamp'] as int,
      hash: json['Hash'] as String,
      totalAmount: (json['TotalAmount'] as num).toDouble(),
      totalReward: (json['TotalReward'] as num).toDouble(),
      size: (json['Size'] as num).toDouble(),
      bCraftTime: json['BCraftTime'] as int,
    );

Map<String, dynamic> _$$_GenesisBlockToJson(_$_GenesisBlock instance) => <String, dynamic>{
      'Height': instance.height,
      'ChainRefId': instance.chainRefId,
      'Timestamp': instance.timestamp,
      'Hash': instance.hash,
      'TotalAmount': instance.totalAmount,
      'TotalReward': instance.totalReward,
      'Size': instance.size,
      'BCraftTime': instance.bCraftTime,
    };
