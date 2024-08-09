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
      type: txTypeFromJson(json['TransactionType'] as int),
      feeRate: json['FeeRate'] as int,
      confirmedHeight: json['ConfirmedHeight'] as int,
      isConfirmed: json['IsConfirmed'] as bool,
      utxos: (json['BitcoinUTXOs'] as List<dynamic>?)
              ?.map((e) => BtcUtxo.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
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
      'TransactionType': _$BTCTransactionTypeEnumMap[instance.type]!,
      'FeeRate': instance.feeRate,
      'ConfirmedHeight': instance.confirmedHeight,
      'IsConfirmed': instance.isConfirmed,
      'BitcoinUTXOs': instance.utxos,
    };

const _$BTCTransactionTypeEnumMap = {
  BTCTransactionType.send: 'send',
  BTCTransactionType.recieve: 'recieve',
  BTCTransactionType.replaced: 'replaced',
  BTCTransactionType.multiSigSend: 'multiSigSend',
  BTCTransactionType.sameWalletTx: 'sameWalletTx',
};
