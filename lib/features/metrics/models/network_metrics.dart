import 'package:freezed_annotation/freezed_annotation.dart';
part 'network_metrics.freezed.dart';
part 'network_metrics.g.dart';

@freezed
abstract class NetworkMetrics with _$NetworkMetrics {
  const NetworkMetrics._();

  factory NetworkMetrics({
    @JsonKey(name: "BlockDiffAvg") String? blockDiffAvg,
    @JsonKey(name: "BlockLastReceived") required DateTime blockLastReceived,
    @JsonKey(name: "BlockLastDelay") @Default('0') String blockLastDelay,
    @JsonKey(name: "TimeSinceLastBlockSeconds") @Default('0') String timeSinceLastBlockSeconds,
    @JsonKey(name: "BlocksAveraged") required String blocksAveraged,
  }) = _NetworkMetrics;

  factory NetworkMetrics.fromJson(Map<String, dynamic> json) => _$NetworkMetricsFromJson(json);
}
