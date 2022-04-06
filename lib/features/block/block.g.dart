// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'block.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Block _$$_BlockFromJson(Map<String, dynamic> json) => _$_Block(
      height: json['Height'] as int,
      chainRefId: json['ChainRefId'] as String,
      timestamp: json['Timestamp'] as int,
      hash: json['Hash'] as String,
      prevHash: json['PrevHash'] as String,
      merkleRoot: json['MerkleRoot'] as String,
      stateRoot: json['StateRoot'] as String,
      validator: json['Validator'] as String,
      validatorSignature: json['ValidatorSignature'] as String,
      validatorAnswer: json['ValidatorAnswer'] as String,
      totalValidators: json['TotalValidators'] as int,
      version: json['Version'] as int,
      totalAmount: (json['TotalAmount'] as num).toDouble(),
      totalReward: (json['TotalReward'] as num).toDouble(),
      numberOfTransactions: json['NumOfTx'] as int,
      size: json['Size'] as int,
      craftTime: json['BCraftTime'] as int,
      transactions: (json['Transactions'] as List<dynamic>)
          .map((e) => Transaction.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_BlockToJson(_$_Block instance) => <String, dynamic>{
      'Height': instance.height,
      'ChainRefId': instance.chainRefId,
      'Timestamp': instance.timestamp,
      'Hash': instance.hash,
      'PrevHash': instance.prevHash,
      'MerkleRoot': instance.merkleRoot,
      'StateRoot': instance.stateRoot,
      'Validator': instance.validator,
      'ValidatorSignature': instance.validatorSignature,
      'ValidatorAnswer': instance.validatorAnswer,
      'TotalValidators': instance.totalValidators,
      'Version': instance.version,
      'TotalAmount': instance.totalAmount,
      'TotalReward': instance.totalReward,
      'NumOfTx': instance.numberOfTransactions,
      'Size': instance.size,
      'BCraftTime': instance.craftTime,
      'Transactions': instance.transactions,
    };
