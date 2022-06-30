// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'web_block.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_WebBlock _$$_WebBlockFromJson(Map<String, dynamic> json) => _$_WebBlock(
      height: json['height'] as int,
      timestamp: json['timestamp'] as int,
      hash: json['hash'] as String,
      validator: json['validator'] as String,
      totalAmount: (json['total_amount'] as num).toDouble(),
      totalReward: (json['total_reward'] as num).toDouble(),
      numberOfTransactions: json['number_of_transactions'] as int,
      size: json['size'] as int,
      craftTime: json['craft_time'] as int,
      prevHash: json['prev_hash'] as String,
    );

Map<String, dynamic> _$$_WebBlockToJson(_$_WebBlock instance) =>
    <String, dynamic>{
      'height': instance.height,
      'timestamp': instance.timestamp,
      'hash': instance.hash,
      'validator': instance.validator,
      'total_amount': instance.totalAmount,
      'total_reward': instance.totalReward,
      'number_of_transactions': instance.numberOfTransactions,
      'size': instance.size,
      'craft_time': instance.craftTime,
      'prev_hash': instance.prevHash,
    };
