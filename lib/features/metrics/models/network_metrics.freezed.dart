// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'network_metrics.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

NetworkMetrics _$NetworkMetricsFromJson(Map<String, dynamic> json) {
  return _NetworkMetrics.fromJson(json);
}

/// @nodoc
mixin _$NetworkMetrics {
  @JsonKey(name: "BlockDiffAvg")
  String? get blockDiffAvg => throw _privateConstructorUsedError;
  @JsonKey(name: "BlockLastReceived")
  DateTime get blockLastReceived => throw _privateConstructorUsedError;
  @JsonKey(name: "BlockLastDelay")
  String get blockLastDelay => throw _privateConstructorUsedError;
  @JsonKey(name: "TimeSinceLastBlockSeconds")
  String get timeSinceLastBlockSeconds => throw _privateConstructorUsedError;
  @JsonKey(name: "BlocksAveraged")
  String get blocksAveraged => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NetworkMetricsCopyWith<NetworkMetrics> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NetworkMetricsCopyWith<$Res> {
  factory $NetworkMetricsCopyWith(
          NetworkMetrics value, $Res Function(NetworkMetrics) then) =
      _$NetworkMetricsCopyWithImpl<$Res, NetworkMetrics>;
  @useResult
  $Res call(
      {@JsonKey(name: "BlockDiffAvg")
          String? blockDiffAvg,
      @JsonKey(name: "BlockLastReceived")
          DateTime blockLastReceived,
      @JsonKey(name: "BlockLastDelay")
          String blockLastDelay,
      @JsonKey(name: "TimeSinceLastBlockSeconds")
          String timeSinceLastBlockSeconds,
      @JsonKey(name: "BlocksAveraged")
          String blocksAveraged});
}

/// @nodoc
class _$NetworkMetricsCopyWithImpl<$Res, $Val extends NetworkMetrics>
    implements $NetworkMetricsCopyWith<$Res> {
  _$NetworkMetricsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? blockDiffAvg = freezed,
    Object? blockLastReceived = null,
    Object? blockLastDelay = null,
    Object? timeSinceLastBlockSeconds = null,
    Object? blocksAveraged = null,
  }) {
    return _then(_value.copyWith(
      blockDiffAvg: freezed == blockDiffAvg
          ? _value.blockDiffAvg
          : blockDiffAvg // ignore: cast_nullable_to_non_nullable
              as String?,
      blockLastReceived: null == blockLastReceived
          ? _value.blockLastReceived
          : blockLastReceived // ignore: cast_nullable_to_non_nullable
              as DateTime,
      blockLastDelay: null == blockLastDelay
          ? _value.blockLastDelay
          : blockLastDelay // ignore: cast_nullable_to_non_nullable
              as String,
      timeSinceLastBlockSeconds: null == timeSinceLastBlockSeconds
          ? _value.timeSinceLastBlockSeconds
          : timeSinceLastBlockSeconds // ignore: cast_nullable_to_non_nullable
              as String,
      blocksAveraged: null == blocksAveraged
          ? _value.blocksAveraged
          : blocksAveraged // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_NetworkMetricsCopyWith<$Res>
    implements $NetworkMetricsCopyWith<$Res> {
  factory _$$_NetworkMetricsCopyWith(
          _$_NetworkMetrics value, $Res Function(_$_NetworkMetrics) then) =
      __$$_NetworkMetricsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "BlockDiffAvg")
          String? blockDiffAvg,
      @JsonKey(name: "BlockLastReceived")
          DateTime blockLastReceived,
      @JsonKey(name: "BlockLastDelay")
          String blockLastDelay,
      @JsonKey(name: "TimeSinceLastBlockSeconds")
          String timeSinceLastBlockSeconds,
      @JsonKey(name: "BlocksAveraged")
          String blocksAveraged});
}

/// @nodoc
class __$$_NetworkMetricsCopyWithImpl<$Res>
    extends _$NetworkMetricsCopyWithImpl<$Res, _$_NetworkMetrics>
    implements _$$_NetworkMetricsCopyWith<$Res> {
  __$$_NetworkMetricsCopyWithImpl(
      _$_NetworkMetrics _value, $Res Function(_$_NetworkMetrics) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? blockDiffAvg = freezed,
    Object? blockLastReceived = null,
    Object? blockLastDelay = null,
    Object? timeSinceLastBlockSeconds = null,
    Object? blocksAveraged = null,
  }) {
    return _then(_$_NetworkMetrics(
      blockDiffAvg: freezed == blockDiffAvg
          ? _value.blockDiffAvg
          : blockDiffAvg // ignore: cast_nullable_to_non_nullable
              as String?,
      blockLastReceived: null == blockLastReceived
          ? _value.blockLastReceived
          : blockLastReceived // ignore: cast_nullable_to_non_nullable
              as DateTime,
      blockLastDelay: null == blockLastDelay
          ? _value.blockLastDelay
          : blockLastDelay // ignore: cast_nullable_to_non_nullable
              as String,
      timeSinceLastBlockSeconds: null == timeSinceLastBlockSeconds
          ? _value.timeSinceLastBlockSeconds
          : timeSinceLastBlockSeconds // ignore: cast_nullable_to_non_nullable
              as String,
      blocksAveraged: null == blocksAveraged
          ? _value.blocksAveraged
          : blocksAveraged // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_NetworkMetrics extends _NetworkMetrics {
  _$_NetworkMetrics(
      {@JsonKey(name: "BlockDiffAvg")
          this.blockDiffAvg,
      @JsonKey(name: "BlockLastReceived")
          required this.blockLastReceived,
      @JsonKey(name: "BlockLastDelay")
          this.blockLastDelay = '0',
      @JsonKey(name: "TimeSinceLastBlockSeconds")
          this.timeSinceLastBlockSeconds = '0',
      @JsonKey(name: "BlocksAveraged")
          required this.blocksAveraged})
      : super._();

  factory _$_NetworkMetrics.fromJson(Map<String, dynamic> json) =>
      _$$_NetworkMetricsFromJson(json);

  @override
  @JsonKey(name: "BlockDiffAvg")
  final String? blockDiffAvg;
  @override
  @JsonKey(name: "BlockLastReceived")
  final DateTime blockLastReceived;
  @override
  @JsonKey(name: "BlockLastDelay")
  final String blockLastDelay;
  @override
  @JsonKey(name: "TimeSinceLastBlockSeconds")
  final String timeSinceLastBlockSeconds;
  @override
  @JsonKey(name: "BlocksAveraged")
  final String blocksAveraged;

  @override
  String toString() {
    return 'NetworkMetrics(blockDiffAvg: $blockDiffAvg, blockLastReceived: $blockLastReceived, blockLastDelay: $blockLastDelay, timeSinceLastBlockSeconds: $timeSinceLastBlockSeconds, blocksAveraged: $blocksAveraged)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NetworkMetrics &&
            (identical(other.blockDiffAvg, blockDiffAvg) ||
                other.blockDiffAvg == blockDiffAvg) &&
            (identical(other.blockLastReceived, blockLastReceived) ||
                other.blockLastReceived == blockLastReceived) &&
            (identical(other.blockLastDelay, blockLastDelay) ||
                other.blockLastDelay == blockLastDelay) &&
            (identical(other.timeSinceLastBlockSeconds,
                    timeSinceLastBlockSeconds) ||
                other.timeSinceLastBlockSeconds == timeSinceLastBlockSeconds) &&
            (identical(other.blocksAveraged, blocksAveraged) ||
                other.blocksAveraged == blocksAveraged));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, blockDiffAvg, blockLastReceived,
      blockLastDelay, timeSinceLastBlockSeconds, blocksAveraged);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NetworkMetricsCopyWith<_$_NetworkMetrics> get copyWith =>
      __$$_NetworkMetricsCopyWithImpl<_$_NetworkMetrics>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_NetworkMetricsToJson(
      this,
    );
  }
}

abstract class _NetworkMetrics extends NetworkMetrics {
  factory _NetworkMetrics(
      {@JsonKey(name: "BlockDiffAvg")
          final String? blockDiffAvg,
      @JsonKey(name: "BlockLastReceived")
          required final DateTime blockLastReceived,
      @JsonKey(name: "BlockLastDelay")
          final String blockLastDelay,
      @JsonKey(name: "TimeSinceLastBlockSeconds")
          final String timeSinceLastBlockSeconds,
      @JsonKey(name: "BlocksAveraged")
          required final String blocksAveraged}) = _$_NetworkMetrics;
  _NetworkMetrics._() : super._();

  factory _NetworkMetrics.fromJson(Map<String, dynamic> json) =
      _$_NetworkMetrics.fromJson;

  @override
  @JsonKey(name: "BlockDiffAvg")
  String? get blockDiffAvg;
  @override
  @JsonKey(name: "BlockLastReceived")
  DateTime get blockLastReceived;
  @override
  @JsonKey(name: "BlockLastDelay")
  String get blockLastDelay;
  @override
  @JsonKey(name: "TimeSinceLastBlockSeconds")
  String get timeSinceLastBlockSeconds;
  @override
  @JsonKey(name: "BlocksAveraged")
  String get blocksAveraged;
  @override
  @JsonKey(ignore: true)
  _$$_NetworkMetricsCopyWith<_$_NetworkMetrics> get copyWith =>
      throw _privateConstructorUsedError;
}
