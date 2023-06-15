// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'web_transaction.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

WebTransaction _$WebTransactionFromJson(Map<String, dynamic> json) {
  return _WebTransaction.fromJson(json);
}

/// @nodoc
mixin _$WebTransaction {
  String get hash => throw _privateConstructorUsedError;
  @JsonKey(name: 'to_address')
  String get toAddress => throw _privateConstructorUsedError;
  @JsonKey(name: 'from_address')
  String get fromAddress => throw _privateConstructorUsedError;
  int get type => throw _privateConstructorUsedError;
  @JsonKey(name: "total_amount")
  double? get amount => throw _privateConstructorUsedError;
  @JsonKey(name: "total_fee")
  double? get fee => throw _privateConstructorUsedError;
  @JsonKey(name: 'date_crafted')
  DateTime get date => throw _privateConstructorUsedError;
  @JsonKey(name: 'unlock_time')
  DateTime? get unlockTime => throw _privateConstructorUsedError;
  bool get isPending =>
      throw _privateConstructorUsedError; // required int nonce,
// required int timestamp,
  String? get data =>
      throw _privateConstructorUsedError; // required String signature,
  int get height => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WebTransactionCopyWith<WebTransaction> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WebTransactionCopyWith<$Res> {
  factory $WebTransactionCopyWith(
          WebTransaction value, $Res Function(WebTransaction) then) =
      _$WebTransactionCopyWithImpl<$Res, WebTransaction>;
  @useResult
  $Res call(
      {String hash,
      @JsonKey(name: 'to_address') String toAddress,
      @JsonKey(name: 'from_address') String fromAddress,
      int type,
      @JsonKey(name: "total_amount") double? amount,
      @JsonKey(name: "total_fee") double? fee,
      @JsonKey(name: 'date_crafted') DateTime date,
      @JsonKey(name: 'unlock_time') DateTime? unlockTime,
      bool isPending,
      String? data,
      int height});
}

/// @nodoc
class _$WebTransactionCopyWithImpl<$Res, $Val extends WebTransaction>
    implements $WebTransactionCopyWith<$Res> {
  _$WebTransactionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hash = null,
    Object? toAddress = null,
    Object? fromAddress = null,
    Object? type = null,
    Object? amount = freezed,
    Object? fee = freezed,
    Object? date = null,
    Object? unlockTime = freezed,
    Object? isPending = null,
    Object? data = freezed,
    Object? height = null,
  }) {
    return _then(_value.copyWith(
      hash: null == hash
          ? _value.hash
          : hash // ignore: cast_nullable_to_non_nullable
              as String,
      toAddress: null == toAddress
          ? _value.toAddress
          : toAddress // ignore: cast_nullable_to_non_nullable
              as String,
      fromAddress: null == fromAddress
          ? _value.fromAddress
          : fromAddress // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as int,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double?,
      fee: freezed == fee
          ? _value.fee
          : fee // ignore: cast_nullable_to_non_nullable
              as double?,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      unlockTime: freezed == unlockTime
          ? _value.unlockTime
          : unlockTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isPending: null == isPending
          ? _value.isPending
          : isPending // ignore: cast_nullable_to_non_nullable
              as bool,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as String?,
      height: null == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_WebTransactionCopyWith<$Res>
    implements $WebTransactionCopyWith<$Res> {
  factory _$$_WebTransactionCopyWith(
          _$_WebTransaction value, $Res Function(_$_WebTransaction) then) =
      __$$_WebTransactionCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String hash,
      @JsonKey(name: 'to_address') String toAddress,
      @JsonKey(name: 'from_address') String fromAddress,
      int type,
      @JsonKey(name: "total_amount") double? amount,
      @JsonKey(name: "total_fee") double? fee,
      @JsonKey(name: 'date_crafted') DateTime date,
      @JsonKey(name: 'unlock_time') DateTime? unlockTime,
      bool isPending,
      String? data,
      int height});
}

/// @nodoc
class __$$_WebTransactionCopyWithImpl<$Res>
    extends _$WebTransactionCopyWithImpl<$Res, _$_WebTransaction>
    implements _$$_WebTransactionCopyWith<$Res> {
  __$$_WebTransactionCopyWithImpl(
      _$_WebTransaction _value, $Res Function(_$_WebTransaction) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hash = null,
    Object? toAddress = null,
    Object? fromAddress = null,
    Object? type = null,
    Object? amount = freezed,
    Object? fee = freezed,
    Object? date = null,
    Object? unlockTime = freezed,
    Object? isPending = null,
    Object? data = freezed,
    Object? height = null,
  }) {
    return _then(_$_WebTransaction(
      hash: null == hash
          ? _value.hash
          : hash // ignore: cast_nullable_to_non_nullable
              as String,
      toAddress: null == toAddress
          ? _value.toAddress
          : toAddress // ignore: cast_nullable_to_non_nullable
              as String,
      fromAddress: null == fromAddress
          ? _value.fromAddress
          : fromAddress // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as int,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double?,
      fee: freezed == fee
          ? _value.fee
          : fee // ignore: cast_nullable_to_non_nullable
              as double?,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      unlockTime: freezed == unlockTime
          ? _value.unlockTime
          : unlockTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isPending: null == isPending
          ? _value.isPending
          : isPending // ignore: cast_nullable_to_non_nullable
              as bool,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as String?,
      height: null == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_WebTransaction extends _WebTransaction {
  _$_WebTransaction(
      {required this.hash,
      @JsonKey(name: 'to_address') required this.toAddress,
      @JsonKey(name: 'from_address') required this.fromAddress,
      required this.type,
      @JsonKey(name: "total_amount") required this.amount,
      @JsonKey(name: "total_fee") required this.fee,
      @JsonKey(name: 'date_crafted') required this.date,
      @JsonKey(name: 'unlock_time') this.unlockTime,
      this.isPending = false,
      this.data,
      required this.height})
      : super._();

  factory _$_WebTransaction.fromJson(Map<String, dynamic> json) =>
      _$$_WebTransactionFromJson(json);

  @override
  final String hash;
  @override
  @JsonKey(name: 'to_address')
  final String toAddress;
  @override
  @JsonKey(name: 'from_address')
  final String fromAddress;
  @override
  final int type;
  @override
  @JsonKey(name: "total_amount")
  final double? amount;
  @override
  @JsonKey(name: "total_fee")
  final double? fee;
  @override
  @JsonKey(name: 'date_crafted')
  final DateTime date;
  @override
  @JsonKey(name: 'unlock_time')
  final DateTime? unlockTime;
  @override
  @JsonKey()
  final bool isPending;
// required int nonce,
// required int timestamp,
  @override
  final String? data;
// required String signature,
  @override
  final int height;

  @override
  String toString() {
    return 'WebTransaction(hash: $hash, toAddress: $toAddress, fromAddress: $fromAddress, type: $type, amount: $amount, fee: $fee, date: $date, unlockTime: $unlockTime, isPending: $isPending, data: $data, height: $height)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_WebTransaction &&
            (identical(other.hash, hash) || other.hash == hash) &&
            (identical(other.toAddress, toAddress) ||
                other.toAddress == toAddress) &&
            (identical(other.fromAddress, fromAddress) ||
                other.fromAddress == fromAddress) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.fee, fee) || other.fee == fee) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.unlockTime, unlockTime) ||
                other.unlockTime == unlockTime) &&
            (identical(other.isPending, isPending) ||
                other.isPending == isPending) &&
            (identical(other.data, data) || other.data == data) &&
            (identical(other.height, height) || other.height == height));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, hash, toAddress, fromAddress,
      type, amount, fee, date, unlockTime, isPending, data, height);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_WebTransactionCopyWith<_$_WebTransaction> get copyWith =>
      __$$_WebTransactionCopyWithImpl<_$_WebTransaction>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_WebTransactionToJson(
      this,
    );
  }
}

abstract class _WebTransaction extends WebTransaction {
  factory _WebTransaction(
      {required final String hash,
      @JsonKey(name: 'to_address') required final String toAddress,
      @JsonKey(name: 'from_address') required final String fromAddress,
      required final int type,
      @JsonKey(name: "total_amount") required final double? amount,
      @JsonKey(name: "total_fee") required final double? fee,
      @JsonKey(name: 'date_crafted') required final DateTime date,
      @JsonKey(name: 'unlock_time') final DateTime? unlockTime,
      final bool isPending,
      final String? data,
      required final int height}) = _$_WebTransaction;
  _WebTransaction._() : super._();

  factory _WebTransaction.fromJson(Map<String, dynamic> json) =
      _$_WebTransaction.fromJson;

  @override
  String get hash;
  @override
  @JsonKey(name: 'to_address')
  String get toAddress;
  @override
  @JsonKey(name: 'from_address')
  String get fromAddress;
  @override
  int get type;
  @override
  @JsonKey(name: "total_amount")
  double? get amount;
  @override
  @JsonKey(name: "total_fee")
  double? get fee;
  @override
  @JsonKey(name: 'date_crafted')
  DateTime get date;
  @override
  @JsonKey(name: 'unlock_time')
  DateTime? get unlockTime;
  @override
  bool get isPending;
  @override // required int nonce,
// required int timestamp,
  String? get data;
  @override // required String signature,
  int get height;
  @override
  @JsonKey(ignore: true)
  _$$_WebTransactionCopyWith<_$_WebTransaction> get copyWith =>
      throw _privateConstructorUsedError;
}
