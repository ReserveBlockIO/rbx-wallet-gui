// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'web_transaction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_WebTransaction _$$_WebTransactionFromJson(Map<String, dynamic> json) =>
    _$_WebTransaction(
      hash: json['hash'] as String,
      toAddress: json['to_address'] as String,
      fromAddress: json['from_address'] as String,
      type: json['transaction_type'] as int,
      amount: stringToDouble(json['amount'] as String),
      fee: stringToDouble(json['fee'] as String),
      nonce: json['nonce'] as int,
      timestamp: json['timestamp'] as int,
      signature: json['signature'] as String,
      height: json['height'] as int,
    );

Map<String, dynamic> _$$_WebTransactionToJson(_$_WebTransaction instance) =>
    <String, dynamic>{
      'hash': instance.hash,
      'to_address': instance.toAddress,
      'from_address': instance.fromAddress,
      'transaction_type': instance.type,
      'amount': instance.amount,
      'fee': instance.fee,
      'nonce': instance.nonce,
      'timestamp': instance.timestamp,
      'signature': instance.signature,
      'height': instance.height,
    };
