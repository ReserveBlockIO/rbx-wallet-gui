// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'btc_web_transaction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_BtcWebTxInput _$$_BtcWebTxInputFromJson(Map<String, dynamic> json) =>
    _$_BtcWebTxInput(
      prevHash: json['prev_hash'] as String,
      outputIndex: json['output_index'] as int,
      outputValue: json['output_value'] as int,
      sequence: json['sequence'] as int,
      addresses: (json['addresses'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      scriptType: json['script_type'] as String,
      age: json['age'] as int,
      witness: (json['witness'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_BtcWebTxInputToJson(_$_BtcWebTxInput instance) =>
    <String, dynamic>{
      'prev_hash': instance.prevHash,
      'output_index': instance.outputIndex,
      'output_value': instance.outputValue,
      'sequence': instance.sequence,
      'addresses': instance.addresses,
      'script_type': instance.scriptType,
      'age': instance.age,
      'witness': instance.witness,
    };

_$_BtcWebTxOutput _$$_BtcWebTxOutputFromJson(Map<String, dynamic> json) =>
    _$_BtcWebTxOutput(
      value: json['value'] as int,
      script: json['script'] as String,
      addresses: (json['addresses'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      scriptType: json['script_type'] as String,
    );

Map<String, dynamic> _$$_BtcWebTxOutputToJson(_$_BtcWebTxOutput instance) =>
    <String, dynamic>{
      'value': instance.value,
      'script': instance.script,
      'addresses': instance.addresses,
      'script_type': instance.scriptType,
    };

_$_BtcWebTransaction _$$_BtcWebTransactionFromJson(Map<String, dynamic> json) =>
    _$_BtcWebTransaction(
      blockHash: json['block_hash'] as String,
      blockHeight: json['block_height'] as int,
      hash: json['hash'] as String,
      addresses: (json['addresses'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      total: json['total'] as int,
      fees: json['fees'] as int,
      confirmations: json['confirmations'] as int? ?? 0,
      confirmed: json['confirmed'] == null
          ? null
          : DateTime.parse(json['confirmed'] as String),
      received: json['received'] == null
          ? null
          : DateTime.parse(json['received'] as String),
      relayedBy: json['relayed_by'] as String?,
      inputs: (json['inputs'] as List<dynamic>?)
              ?.map((e) => BtcWebTxInput.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      outputs: (json['outputs'] as List<dynamic>?)
              ?.map((e) => BtcWebTxOutput.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_BtcWebTransactionToJson(
        _$_BtcWebTransaction instance) =>
    <String, dynamic>{
      'block_hash': instance.blockHash,
      'block_height': instance.blockHeight,
      'hash': instance.hash,
      'addresses': instance.addresses,
      'total': instance.total,
      'fees': instance.fees,
      'confirmations': instance.confirmations,
      'confirmed': instance.confirmed?.toIso8601String(),
      'received': instance.received?.toIso8601String(),
      'relayed_by': instance.relayedBy,
      'inputs': instance.inputs,
      'outputs': instance.outputs,
    };
