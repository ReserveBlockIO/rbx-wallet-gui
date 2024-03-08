// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'btc_transaction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_BtcTransaction _$$_BtcTransactionFromJson(Map<String, dynamic> json) =>
    _$_BtcTransaction(
      hash: json['Hash'] as String,
      toAddress: json['ToAddress'] as String,
      fromAddress: json['FromAddress'] as String,
      amount: (json['Amount'] as num).toDouble(),
      fee: (json['Fee'] as num).toDouble(),
      timestamp: json['Timestamp'] as int,
      signature: json['Signature'] as String,
      type: json['TransactionType'] as int,
      feeRate: json['FeeRate'] as int,
    );

Map<String, dynamic> _$$_BtcTransactionToJson(_$_BtcTransaction instance) =>
    <String, dynamic>{
      'Hash': instance.hash,
      'ToAddress': instance.toAddress,
      'FromAddress': instance.fromAddress,
      'Amount': instance.amount,
      'Fee': instance.fee,
      'Timestamp': instance.timestamp,
      'Signature': instance.signature,
      'TransactionType': instance.type,
      'FeeRate': instance.feeRate,
    };
