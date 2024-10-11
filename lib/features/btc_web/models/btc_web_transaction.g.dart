// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'btc_web_transaction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_BtcWebTransaction _$$_BtcWebTransactionFromJson(Map<String, dynamic> json) =>
    _$_BtcWebTransaction(
      txid: json['txid'] as String,
      vin: (json['vin'] as List<dynamic>)
          .map((e) => BtcWebVin.fromJson(e as Map<String, dynamic>))
          .toList(),
      vout: (json['vout'] as List<dynamic>)
          .map((e) => BtcWebVout.fromJson(e as Map<String, dynamic>))
          .toList(),
      size: json['size'] as int,
      weight: json['weight'] as int,
      fee: json['fee'] as int,
      status: BtcWebTxStatus.fromJson(json['status'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_BtcWebTransactionToJson(
        _$_BtcWebTransaction instance) =>
    <String, dynamic>{
      'txid': instance.txid,
      'vin': instance.vin,
      'vout': instance.vout,
      'size': instance.size,
      'weight': instance.weight,
      'fee': instance.fee,
      'status': instance.status,
    };

_$_BtcWebVin _$$_BtcWebVinFromJson(Map<String, dynamic> json) => _$_BtcWebVin(
      txid: json['txid'] as String,
      vout: json['vout'] as int,
      prevout: BtcWebVout.fromJson(json['prevout'] as Map<String, dynamic>),
      sequence: json['sequence'] as int,
    );

Map<String, dynamic> _$$_BtcWebVinToJson(_$_BtcWebVin instance) =>
    <String, dynamic>{
      'txid': instance.txid,
      'vout': instance.vout,
      'prevout': instance.prevout,
      'sequence': instance.sequence,
    };

_$_BtcWebVout _$$_BtcWebVoutFromJson(Map<String, dynamic> json) =>
    _$_BtcWebVout(
      scriptpubkey: json['scriptpubkey'] as String,
      scriptpubkeyAsm: json['scriptpubkey_asm'] as String,
      scriptpubkeyType: json['scriptpubkey_type'] as String,
      scriptpubkeyAddress: json['scriptpubkey_address'] as String,
      value: json['value'] as int,
    );

Map<String, dynamic> _$$_BtcWebVoutToJson(_$_BtcWebVout instance) =>
    <String, dynamic>{
      'scriptpubkey': instance.scriptpubkey,
      'scriptpubkey_asm': instance.scriptpubkeyAsm,
      'scriptpubkey_type': instance.scriptpubkeyType,
      'scriptpubkey_address': instance.scriptpubkeyAddress,
      'value': instance.value,
    };

_$_BtcWebTxStatus _$$_BtcWebTxStatusFromJson(Map<String, dynamic> json) =>
    _$_BtcWebTxStatus(
      confirmed: json['confirmed'] as bool,
      blockHeight: json['block_height'] as int?,
      blockHash: json['block_hash'] as String?,
      blockTime: json['block_time'] as int?,
    );

Map<String, dynamic> _$$_BtcWebTxStatusToJson(_$_BtcWebTxStatus instance) =>
    <String, dynamic>{
      'confirmed': instance.confirmed,
      'block_height': instance.blockHeight,
      'block_hash': instance.blockHash,
      'block_time': instance.blockTime,
    };
