// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'btc_web_balance_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BtcWebBalanceInfo _$BtcWebBalanceInfoFromJson(Map<String, dynamic> json) {
  return _BtcWebBalanceInfo.fromJson(json);
}

/// @nodoc
mixin _$BtcWebBalanceInfo {
  int get totalRecieved => throw _privateConstructorUsedError;
  int get totalSent => throw _privateConstructorUsedError;
  int get balance => throw _privateConstructorUsedError;
  int get txCount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BtcWebBalanceInfoCopyWith<BtcWebBalanceInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BtcWebBalanceInfoCopyWith<$Res> {
  factory $BtcWebBalanceInfoCopyWith(
          BtcWebBalanceInfo value, $Res Function(BtcWebBalanceInfo) then) =
      _$BtcWebBalanceInfoCopyWithImpl<$Res, BtcWebBalanceInfo>;
  @useResult
  $Res call({int totalRecieved, int totalSent, int balance, int txCount});
}

/// @nodoc
class _$BtcWebBalanceInfoCopyWithImpl<$Res, $Val extends BtcWebBalanceInfo>
    implements $BtcWebBalanceInfoCopyWith<$Res> {
  _$BtcWebBalanceInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalRecieved = null,
    Object? totalSent = null,
    Object? balance = null,
    Object? txCount = null,
  }) {
    return _then(_value.copyWith(
      totalRecieved: null == totalRecieved
          ? _value.totalRecieved
          : totalRecieved // ignore: cast_nullable_to_non_nullable
              as int,
      totalSent: null == totalSent
          ? _value.totalSent
          : totalSent // ignore: cast_nullable_to_non_nullable
              as int,
      balance: null == balance
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as int,
      txCount: null == txCount
          ? _value.txCount
          : txCount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_BtcWebBalanceInfoCopyWith<$Res>
    implements $BtcWebBalanceInfoCopyWith<$Res> {
  factory _$$_BtcWebBalanceInfoCopyWith(_$_BtcWebBalanceInfo value,
          $Res Function(_$_BtcWebBalanceInfo) then) =
      __$$_BtcWebBalanceInfoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int totalRecieved, int totalSent, int balance, int txCount});
}

/// @nodoc
class __$$_BtcWebBalanceInfoCopyWithImpl<$Res>
    extends _$BtcWebBalanceInfoCopyWithImpl<$Res, _$_BtcWebBalanceInfo>
    implements _$$_BtcWebBalanceInfoCopyWith<$Res> {
  __$$_BtcWebBalanceInfoCopyWithImpl(
      _$_BtcWebBalanceInfo _value, $Res Function(_$_BtcWebBalanceInfo) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalRecieved = null,
    Object? totalSent = null,
    Object? balance = null,
    Object? txCount = null,
  }) {
    return _then(_$_BtcWebBalanceInfo(
      totalRecieved: null == totalRecieved
          ? _value.totalRecieved
          : totalRecieved // ignore: cast_nullable_to_non_nullable
              as int,
      totalSent: null == totalSent
          ? _value.totalSent
          : totalSent // ignore: cast_nullable_to_non_nullable
              as int,
      balance: null == balance
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as int,
      txCount: null == txCount
          ? _value.txCount
          : txCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_BtcWebBalanceInfo extends _BtcWebBalanceInfo {
  _$_BtcWebBalanceInfo(
      {required this.totalRecieved,
      required this.totalSent,
      required this.balance,
      required this.txCount})
      : super._();

  factory _$_BtcWebBalanceInfo.fromJson(Map<String, dynamic> json) =>
      _$$_BtcWebBalanceInfoFromJson(json);

  @override
  final int totalRecieved;
  @override
  final int totalSent;
  @override
  final int balance;
  @override
  final int txCount;

  @override
  String toString() {
    return 'BtcWebBalanceInfo(totalRecieved: $totalRecieved, totalSent: $totalSent, balance: $balance, txCount: $txCount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BtcWebBalanceInfo &&
            (identical(other.totalRecieved, totalRecieved) ||
                other.totalRecieved == totalRecieved) &&
            (identical(other.totalSent, totalSent) ||
                other.totalSent == totalSent) &&
            (identical(other.balance, balance) || other.balance == balance) &&
            (identical(other.txCount, txCount) || other.txCount == txCount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, totalRecieved, totalSent, balance, txCount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BtcWebBalanceInfoCopyWith<_$_BtcWebBalanceInfo> get copyWith =>
      __$$_BtcWebBalanceInfoCopyWithImpl<_$_BtcWebBalanceInfo>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BtcWebBalanceInfoToJson(
      this,
    );
  }
}

abstract class _BtcWebBalanceInfo extends BtcWebBalanceInfo {
  factory _BtcWebBalanceInfo(
      {required final int totalRecieved,
      required final int totalSent,
      required final int balance,
      required final int txCount}) = _$_BtcWebBalanceInfo;
  _BtcWebBalanceInfo._() : super._();

  factory _BtcWebBalanceInfo.fromJson(Map<String, dynamic> json) =
      _$_BtcWebBalanceInfo.fromJson;

  @override
  int get totalRecieved;
  @override
  int get totalSent;
  @override
  int get balance;
  @override
  int get txCount;
  @override
  @JsonKey(ignore: true)
  _$$_BtcWebBalanceInfoCopyWith<_$_BtcWebBalanceInfo> get copyWith =>
      throw _privateConstructorUsedError;
}
