// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'network_metrics.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_NetworkMetrics _$$_NetworkMetricsFromJson(Map<String, dynamic> json) =>
    _$_NetworkMetrics(
      blockDiffAvg: json['BlockDiffAvg'] as String?,
      blockLastReceived: DateTime.parse(json['BlockLastReceived'] as String),
      blockLastDelay: json['BlockLastDelay'] as String? ?? '0',
      timeSinceLastBlockSeconds:
          json['TimeSinceLastBlockSeconds'] as String? ?? '0',
      blocksAveraged: json['BlocksAveraged'] as String,
    );

Map<String, dynamic> _$$_NetworkMetricsToJson(_$_NetworkMetrics instance) =>
    <String, dynamic>{
      'BlockDiffAvg': instance.blockDiffAvg,
      'BlockLastReceived': instance.blockLastReceived.toIso8601String(),
      'BlockLastDelay': instance.blockLastDelay,
      'TimeSinceLastBlockSeconds': instance.timeSinceLastBlockSeconds,
      'BlocksAveraged': instance.blocksAveraged,
    };
