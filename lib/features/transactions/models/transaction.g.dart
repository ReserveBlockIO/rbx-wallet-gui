// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Transaction _$$_TransactionFromJson(Map<String, dynamic> json) =>
    _$_Transaction(
      hash: json['Hash'] as String,
      toAddress: json['ToAddress'] as String,
      fromAddress: json['FromAddress'] as String,
      amount: (json['Amount'] as num).toDouble(),
      nonce: json['Nonce'] as int,
      fee: (json['Fee'] as num).toDouble(),
      timestamp: json['Timestamp'] as int,
      nftData: json['NFTData'],
      signature: json['Signature'] as String,
      height: json['Height'] as int,
    );

Map<String, dynamic> _$$_TransactionToJson(_$_Transaction instance) =>
    <String, dynamic>{
      'Hash': instance.hash,
      'ToAddress': instance.toAddress,
      'FromAddress': instance.fromAddress,
      'Amount': instance.amount,
      'Nonce': instance.nonce,
      'Fee': instance.fee,
      'Timestamp': instance.timestamp,
      'NFTData': instance.nftData,
      'Signature': instance.signature,
      'Height': instance.height,
    };
