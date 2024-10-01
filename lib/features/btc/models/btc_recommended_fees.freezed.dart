// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'btc_recommended_fees.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BtcRecommendedFees _$BtcRecommendedFeesFromJson(Map<String, dynamic> json) {
  return _BtcRecommendedFees.fromJson(json);
}

/// @nodoc
mixin _$BtcRecommendedFees {
  int get fastestFee => throw _privateConstructorUsedError;
  int get halfHourFee => throw _privateConstructorUsedError;
  int get hourFee => throw _privateConstructorUsedError;
  int get economyFee => throw _privateConstructorUsedError;
  int get minimumFee => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BtcRecommendedFeesCopyWith<BtcRecommendedFees> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BtcRecommendedFeesCopyWith<$Res> {
  factory $BtcRecommendedFeesCopyWith(
          BtcRecommendedFees value, $Res Function(BtcRecommendedFees) then) =
      _$BtcRecommendedFeesCopyWithImpl<$Res, BtcRecommendedFees>;
  @useResult
  $Res call(
      {int fastestFee,
      int halfHourFee,
      int hourFee,
      int economyFee,
      int minimumFee});
}

/// @nodoc
class _$BtcRecommendedFeesCopyWithImpl<$Res, $Val extends BtcRecommendedFees>
    implements $BtcRecommendedFeesCopyWith<$Res> {
  _$BtcRecommendedFeesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fastestFee = null,
    Object? halfHourFee = null,
    Object? hourFee = null,
    Object? economyFee = null,
    Object? minimumFee = null,
  }) {
    return _then(_value.copyWith(
      fastestFee: null == fastestFee
          ? _value.fastestFee
          : fastestFee // ignore: cast_nullable_to_non_nullable
              as int,
      halfHourFee: null == halfHourFee
          ? _value.halfHourFee
          : halfHourFee // ignore: cast_nullable_to_non_nullable
              as int,
      hourFee: null == hourFee
          ? _value.hourFee
          : hourFee // ignore: cast_nullable_to_non_nullable
              as int,
      economyFee: null == economyFee
          ? _value.economyFee
          : economyFee // ignore: cast_nullable_to_non_nullable
              as int,
      minimumFee: null == minimumFee
          ? _value.minimumFee
          : minimumFee // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_BtcRecommendedFeesCopyWith<$Res>
    implements $BtcRecommendedFeesCopyWith<$Res> {
  factory _$$_BtcRecommendedFeesCopyWith(_$_BtcRecommendedFees value,
          $Res Function(_$_BtcRecommendedFees) then) =
      __$$_BtcRecommendedFeesCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int fastestFee,
      int halfHourFee,
      int hourFee,
      int economyFee,
      int minimumFee});
}

/// @nodoc
class __$$_BtcRecommendedFeesCopyWithImpl<$Res>
    extends _$BtcRecommendedFeesCopyWithImpl<$Res, _$_BtcRecommendedFees>
    implements _$$_BtcRecommendedFeesCopyWith<$Res> {
  __$$_BtcRecommendedFeesCopyWithImpl(
      _$_BtcRecommendedFees _value, $Res Function(_$_BtcRecommendedFees) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fastestFee = null,
    Object? halfHourFee = null,
    Object? hourFee = null,
    Object? economyFee = null,
    Object? minimumFee = null,
  }) {
    return _then(_$_BtcRecommendedFees(
      fastestFee: null == fastestFee
          ? _value.fastestFee
          : fastestFee // ignore: cast_nullable_to_non_nullable
              as int,
      halfHourFee: null == halfHourFee
          ? _value.halfHourFee
          : halfHourFee // ignore: cast_nullable_to_non_nullable
              as int,
      hourFee: null == hourFee
          ? _value.hourFee
          : hourFee // ignore: cast_nullable_to_non_nullable
              as int,
      economyFee: null == economyFee
          ? _value.economyFee
          : economyFee // ignore: cast_nullable_to_non_nullable
              as int,
      minimumFee: null == minimumFee
          ? _value.minimumFee
          : minimumFee // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_BtcRecommendedFees extends _BtcRecommendedFees {
  _$_BtcRecommendedFees(
      {required this.fastestFee,
      required this.halfHourFee,
      required this.hourFee,
      required this.economyFee,
      required this.minimumFee})
      : super._();

  factory _$_BtcRecommendedFees.fromJson(Map<String, dynamic> json) =>
      _$$_BtcRecommendedFeesFromJson(json);

  @override
  final int fastestFee;
  @override
  final int halfHourFee;
  @override
  final int hourFee;
  @override
  final int economyFee;
  @override
  final int minimumFee;

  @override
  String toString() {
    return 'BtcRecommendedFees(fastestFee: $fastestFee, halfHourFee: $halfHourFee, hourFee: $hourFee, economyFee: $economyFee, minimumFee: $minimumFee)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BtcRecommendedFees &&
            (identical(other.fastestFee, fastestFee) ||
                other.fastestFee == fastestFee) &&
            (identical(other.halfHourFee, halfHourFee) ||
                other.halfHourFee == halfHourFee) &&
            (identical(other.hourFee, hourFee) || other.hourFee == hourFee) &&
            (identical(other.economyFee, economyFee) ||
                other.economyFee == economyFee) &&
            (identical(other.minimumFee, minimumFee) ||
                other.minimumFee == minimumFee));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, fastestFee, halfHourFee, hourFee, economyFee, minimumFee);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BtcRecommendedFeesCopyWith<_$_BtcRecommendedFees> get copyWith =>
      __$$_BtcRecommendedFeesCopyWithImpl<_$_BtcRecommendedFees>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BtcRecommendedFeesToJson(
      this,
    );
  }
}

abstract class _BtcRecommendedFees extends BtcRecommendedFees {
  factory _BtcRecommendedFees(
      {required final int fastestFee,
      required final int halfHourFee,
      required final int hourFee,
      required final int economyFee,
      required final int minimumFee}) = _$_BtcRecommendedFees;
  _BtcRecommendedFees._() : super._();

  factory _BtcRecommendedFees.fromJson(Map<String, dynamic> json) =
      _$_BtcRecommendedFees.fromJson;

  @override
  int get fastestFee;
  @override
  int get halfHourFee;
  @override
  int get hourFee;
  @override
  int get economyFee;
  @override
  int get minimumFee;
  @override
  @JsonKey(ignore: true)
  _$$_BtcRecommendedFeesCopyWith<_$_BtcRecommendedFees> get copyWith =>
      throw _privateConstructorUsedError;
}
