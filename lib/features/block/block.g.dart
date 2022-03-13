// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'block.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Block _$$_BlockFromJson(Map<String, dynamic> json) => _$_Block(
      height: json['Height'] as int,
      timestamp: json['Timestamp'] as int,
      hash: json['Hash'] as String,
      validator: json['Validator'] as String,
      nextValidators: json['NextValidators'] as String,
      totalAmount: (json['TotalAmount'] as num).toDouble(),
      totalReward: (json['TotalReward'] as num).toDouble(),
      numberOfTransactions: json['NumOfTx'] as int,
      size: json['Size'] as int,
      craftTime: json['BCraftTime'] as int,
      transactions: (json['Transctions'] as List<dynamic>?)
              ?.map((e) => Transaction.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$$_BlockToJson(_$_Block instance) => <String, dynamic>{
      'Height': instance.height,
      'Timestamp': instance.timestamp,
      'Hash': instance.hash,
      'Validator': instance.validator,
      'NextValidators': instance.nextValidators,
      'TotalAmount': instance.totalAmount,
      'TotalReward': instance.totalReward,
      'NumOfTx': instance.numberOfTransactions,
      'Size': instance.size,
      'BCraftTime': instance.craftTime,
      'Transctions': instance.transactions,
    };
