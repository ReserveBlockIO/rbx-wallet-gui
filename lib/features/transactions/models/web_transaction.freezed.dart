// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

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
  @JsonKey(name: 'transaction_type')
  int get type => throw _privateConstructorUsedError;
  @JsonKey(fromJson: stringToDouble)
  double? get amount => throw _privateConstructorUsedError;
  @JsonKey(fromJson: stringToDouble)
  double? get fee => throw _privateConstructorUsedError;
  int get nonce => throw _privateConstructorUsedError;
  int get timestamp =>
      throw _privateConstructorUsedError; // @JsonKey(name: 'nft_data') dynamic nftData,
  String get signature => throw _privateConstructorUsedError;
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
      _$WebTransactionCopyWithImpl<$Res>;
  $Res call(
      {String hash,
      @JsonKey(name: 'to_address') String toAddress,
      @JsonKey(name: 'from_address') String fromAddress,
      @JsonKey(name: 'transaction_type') int type,
      @JsonKey(fromJson: stringToDouble) double? amount,
      @JsonKey(fromJson: stringToDouble) double? fee,
      int nonce,
      int timestamp,
      String signature,
      int height});
}

/// @nodoc
class _$WebTransactionCopyWithImpl<$Res>
    implements $WebTransactionCopyWith<$Res> {
  _$WebTransactionCopyWithImpl(this._value, this._then);

  final WebTransaction _value;
  // ignore: unused_field
  final $Res Function(WebTransaction) _then;

  @override
  $Res call({
    Object? hash = freezed,
    Object? toAddress = freezed,
    Object? fromAddress = freezed,
    Object? type = freezed,
    Object? amount = freezed,
    Object? fee = freezed,
    Object? nonce = freezed,
    Object? timestamp = freezed,
    Object? signature = freezed,
    Object? height = freezed,
  }) {
    return _then(_value.copyWith(
      hash: hash == freezed
          ? _value.hash
          : hash // ignore: cast_nullable_to_non_nullable
              as String,
      toAddress: toAddress == freezed
          ? _value.toAddress
          : toAddress // ignore: cast_nullable_to_non_nullable
              as String,
      fromAddress: fromAddress == freezed
          ? _value.fromAddress
          : fromAddress // ignore: cast_nullable_to_non_nullable
              as String,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as int,
      amount: amount == freezed
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double?,
      fee: fee == freezed
          ? _value.fee
          : fee // ignore: cast_nullable_to_non_nullable
              as double?,
      nonce: nonce == freezed
          ? _value.nonce
          : nonce // ignore: cast_nullable_to_non_nullable
              as int,
      timestamp: timestamp == freezed
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as int,
      signature: signature == freezed
          ? _value.signature
          : signature // ignore: cast_nullable_to_non_nullable
              as String,
      height: height == freezed
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$$_WebTransactionCopyWith<$Res>
    implements $WebTransactionCopyWith<$Res> {
  factory _$$_WebTransactionCopyWith(
          _$_WebTransaction value, $Res Function(_$_WebTransaction) then) =
      __$$_WebTransactionCopyWithImpl<$Res>;
  @override
  $Res call(
      {String hash,
      @JsonKey(name: 'to_address') String toAddress,
      @JsonKey(name: 'from_address') String fromAddress,
      @JsonKey(name: 'transaction_type') int type,
      @JsonKey(fromJson: stringToDouble) double? amount,
      @JsonKey(fromJson: stringToDouble) double? fee,
      int nonce,
      int timestamp,
      String signature,
      int height});
}

/// @nodoc
class __$$_WebTransactionCopyWithImpl<$Res>
    extends _$WebTransactionCopyWithImpl<$Res>
    implements _$$_WebTransactionCopyWith<$Res> {
  __$$_WebTransactionCopyWithImpl(
      _$_WebTransaction _value, $Res Function(_$_WebTransaction) _then)
      : super(_value, (v) => _then(v as _$_WebTransaction));

  @override
  _$_WebTransaction get _value => super._value as _$_WebTransaction;

  @override
  $Res call({
    Object? hash = freezed,
    Object? toAddress = freezed,
    Object? fromAddress = freezed,
    Object? type = freezed,
    Object? amount = freezed,
    Object? fee = freezed,
    Object? nonce = freezed,
    Object? timestamp = freezed,
    Object? signature = freezed,
    Object? height = freezed,
  }) {
    return _then(_$_WebTransaction(
      hash: hash == freezed
          ? _value.hash
          : hash // ignore: cast_nullable_to_non_nullable
              as String,
      toAddress: toAddress == freezed
          ? _value.toAddress
          : toAddress // ignore: cast_nullable_to_non_nullable
              as String,
      fromAddress: fromAddress == freezed
          ? _value.fromAddress
          : fromAddress // ignore: cast_nullable_to_non_nullable
              as String,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as int,
      amount: amount == freezed
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double?,
      fee: fee == freezed
          ? _value.fee
          : fee // ignore: cast_nullable_to_non_nullable
              as double?,
      nonce: nonce == freezed
          ? _value.nonce
          : nonce // ignore: cast_nullable_to_non_nullable
              as int,
      timestamp: timestamp == freezed
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as int,
      signature: signature == freezed
          ? _value.signature
          : signature // ignore: cast_nullable_to_non_nullable
              as String,
      height: height == freezed
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
      @JsonKey(name: 'transaction_type') required this.type,
      @JsonKey(fromJson: stringToDouble) required this.amount,
      @JsonKey(fromJson: stringToDouble) required this.fee,
      required this.nonce,
      required this.timestamp,
      required this.signature,
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
  @JsonKey(name: 'transaction_type')
  final int type;
  @override
  @JsonKey(fromJson: stringToDouble)
  final double? amount;
  @override
  @JsonKey(fromJson: stringToDouble)
  final double? fee;
  @override
  final int nonce;
  @override
  final int timestamp;
// @JsonKey(name: 'nft_data') dynamic nftData,
  @override
  final String signature;
  @override
  final int height;

  @override
  String toString() {
    return 'WebTransaction(hash: $hash, toAddress: $toAddress, fromAddress: $fromAddress, type: $type, amount: $amount, fee: $fee, nonce: $nonce, timestamp: $timestamp, signature: $signature, height: $height)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_WebTransaction &&
            const DeepCollectionEquality().equals(other.hash, hash) &&
            const DeepCollectionEquality().equals(other.toAddress, toAddress) &&
            const DeepCollectionEquality()
                .equals(other.fromAddress, fromAddress) &&
            const DeepCollectionEquality().equals(other.type, type) &&
            const DeepCollectionEquality().equals(other.amount, amount) &&
            const DeepCollectionEquality().equals(other.fee, fee) &&
            const DeepCollectionEquality().equals(other.nonce, nonce) &&
            const DeepCollectionEquality().equals(other.timestamp, timestamp) &&
            const DeepCollectionEquality().equals(other.signature, signature) &&
            const DeepCollectionEquality().equals(other.height, height));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(hash),
      const DeepCollectionEquality().hash(toAddress),
      const DeepCollectionEquality().hash(fromAddress),
      const DeepCollectionEquality().hash(type),
      const DeepCollectionEquality().hash(amount),
      const DeepCollectionEquality().hash(fee),
      const DeepCollectionEquality().hash(nonce),
      const DeepCollectionEquality().hash(timestamp),
      const DeepCollectionEquality().hash(signature),
      const DeepCollectionEquality().hash(height));

  @JsonKey(ignore: true)
  @override
  _$$_WebTransactionCopyWith<_$_WebTransaction> get copyWith =>
      __$$_WebTransactionCopyWithImpl<_$_WebTransaction>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_WebTransactionToJson(this);
  }
}

abstract class _WebTransaction extends WebTransaction {
  factory _WebTransaction(
      {required final String hash,
      @JsonKey(name: 'to_address') required final String toAddress,
      @JsonKey(name: 'from_address') required final String fromAddress,
      @JsonKey(name: 'transaction_type') required final int type,
      @JsonKey(fromJson: stringToDouble) required final double? amount,
      @JsonKey(fromJson: stringToDouble) required final double? fee,
      required final int nonce,
      required final int timestamp,
      required final String signature,
      required final int height}) = _$_WebTransaction;
  _WebTransaction._() : super._();

  factory _WebTransaction.fromJson(Map<String, dynamic> json) =
      _$_WebTransaction.fromJson;

  @override
  String get hash => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'to_address')
  String get toAddress => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'from_address')
  String get fromAddress => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'transaction_type')
  int get type => throw _privateConstructorUsedError;
  @override
  @JsonKey(fromJson: stringToDouble)
  double? get amount => throw _privateConstructorUsedError;
  @override
  @JsonKey(fromJson: stringToDouble)
  double? get fee => throw _privateConstructorUsedError;
  @override
  int get nonce => throw _privateConstructorUsedError;
  @override
  int get timestamp => throw _privateConstructorUsedError;
  @override // @JsonKey(name: 'nft_data') dynamic nftData,
  String get signature => throw _privateConstructorUsedError;
  @override
  int get height => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_WebTransactionCopyWith<_$_WebTransaction> get copyWith =>
      throw _privateConstructorUsedError;
}
