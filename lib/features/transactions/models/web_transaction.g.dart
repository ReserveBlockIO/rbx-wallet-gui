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
      type: json['type'] as int,
      amount: (json['total_amount'] as num?)?.toDouble(),
      fee: (json['total_fee'] as num?)?.toDouble(),
      date: DateTime.parse(json['date_crafted'] as String),
      unlockTime: json['unlock_time'] == null
          ? null
          : DateTime.parse(json['unlock_time'] as String),
      isPending: json['isPending'] as bool? ?? false,
      data: json['data'] as String?,
      height: json['height'] as int,
      callbackDetails: json['callback_details'] == null
          ? null
          : WebTransaction.fromJson(
              json['callback_details'] as Map<String, dynamic>),
      recoveryDetails: json['recovery_details'] == null
          ? null
          : WebRecoveryDetails.fromJson(
              json['recovery_details'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_WebTransactionToJson(_$_WebTransaction instance) =>
    <String, dynamic>{
      'hash': instance.hash,
      'to_address': instance.toAddress,
      'from_address': instance.fromAddress,
      'type': instance.type,
      'total_amount': instance.amount,
      'total_fee': instance.fee,
      'date_crafted': instance.date.toIso8601String(),
      'unlock_time': instance.unlockTime?.toIso8601String(),
      'isPending': instance.isPending,
      'data': instance.data,
      'height': instance.height,
      'callback_details': instance.callbackDetails,
      'recovery_details': instance.recoveryDetails,
    };
