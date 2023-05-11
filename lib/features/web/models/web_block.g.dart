// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'web_block.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_WebBlock _$$_WebBlockFromJson(Map<String, dynamic> json) => _$_WebBlock(
      height: json['height'] as int,
      dateCrafted: DateTime.parse(json['date_crafted'] as String),
      hash: json['hash'] as String,
      validator: json['validator_address'] as String,
      totalAmount: (json['total_amount'] as num).toDouble(),
      totalReward: (json['total_reward'] as num).toDouble(),
      transactions: (json['transactions'] as List<dynamic>?)
              ?.map((e) => WebTransaction.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      size: json['size'] as int,
      craftTime: json['craft_time'] as int,
      prevHash: json['previous_hash'] as String,
    );

Map<String, dynamic> _$$_WebBlockToJson(_$_WebBlock instance) =>
    <String, dynamic>{
      'height': instance.height,
      'date_crafted': instance.dateCrafted.toIso8601String(),
      'hash': instance.hash,
      'validator_address': instance.validator,
      'total_amount': instance.totalAmount,
      'total_reward': instance.totalReward,
      'transactions': instance.transactions,
      'size': instance.size,
      'craft_time': instance.craftTime,
      'previous_hash': instance.prevHash,
    };
