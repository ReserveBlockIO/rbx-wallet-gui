// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'transaction.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Transaction _$TransactionFromJson(Map<String, dynamic> json) {
  return _Transaction.fromJson(json);
}

/// @nodoc
class _$TransactionTearOff {
  const _$TransactionTearOff();

  _Transaction call(
      {@JsonKey(name: 'Hash') required String hash,
      @JsonKey(name: 'ToAddress') required String toAddress,
      @JsonKey(name: 'FromAddress') required String fromAddress,
      @JsonKey(name: 'Amount') required double amount,
      @JsonKey(name: 'Nonce') required int nonce,
      @JsonKey(name: 'Fee') required double fee,
      @JsonKey(name: 'Timestamp') required int timestamp,
      @JsonKey(name: 'NFTData') required dynamic nftData,
      @JsonKey(name: 'Signature') String? signature,
      @JsonKey(name: 'Height') required int height}) {
    return _Transaction(
      hash: hash,
      toAddress: toAddress,
      fromAddress: fromAddress,
      amount: amount,
      nonce: nonce,
      fee: fee,
      timestamp: timestamp,
      nftData: nftData,
      signature: signature,
      height: height,
    );
  }

  Transaction fromJson(Map<String, Object?> json) {
    return Transaction.fromJson(json);
  }
}

/// @nodoc
const $Transaction = _$TransactionTearOff();

/// @nodoc
mixin _$Transaction {
  @JsonKey(name: 'Hash')
  String get hash => throw _privateConstructorUsedError;
  @JsonKey(name: 'ToAddress')
  String get toAddress => throw _privateConstructorUsedError;
  @JsonKey(name: 'FromAddress')
  String get fromAddress => throw _privateConstructorUsedError;
  @JsonKey(name: 'Amount')
  double get amount => throw _privateConstructorUsedError;
  @JsonKey(name: 'Nonce')
  int get nonce => throw _privateConstructorUsedError;
  @JsonKey(name: 'Fee')
  double get fee => throw _privateConstructorUsedError;
  @JsonKey(name: 'Timestamp')
  int get timestamp => throw _privateConstructorUsedError;
  @JsonKey(name: 'NFTData')
  dynamic get nftData => throw _privateConstructorUsedError;
  @JsonKey(name: 'Signature')
  String? get signature => throw _privateConstructorUsedError;
  @JsonKey(name: 'Height')
  int get height => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TransactionCopyWith<Transaction> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionCopyWith<$Res> {
  factory $TransactionCopyWith(
          Transaction value, $Res Function(Transaction) then) =
      _$TransactionCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'Hash') String hash,
      @JsonKey(name: 'ToAddress') String toAddress,
      @JsonKey(name: 'FromAddress') String fromAddress,
      @JsonKey(name: 'Amount') double amount,
      @JsonKey(name: 'Nonce') int nonce,
      @JsonKey(name: 'Fee') double fee,
      @JsonKey(name: 'Timestamp') int timestamp,
      @JsonKey(name: 'NFTData') dynamic nftData,
      @JsonKey(name: 'Signature') String? signature,
      @JsonKey(name: 'Height') int height});
}

/// @nodoc
class _$TransactionCopyWithImpl<$Res> implements $TransactionCopyWith<$Res> {
  _$TransactionCopyWithImpl(this._value, this._then);

  final Transaction _value;
  // ignore: unused_field
  final $Res Function(Transaction) _then;

  @override
  $Res call({
    Object? hash = freezed,
    Object? toAddress = freezed,
    Object? fromAddress = freezed,
    Object? amount = freezed,
    Object? nonce = freezed,
    Object? fee = freezed,
    Object? timestamp = freezed,
    Object? nftData = freezed,
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
      amount: amount == freezed
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      nonce: nonce == freezed
          ? _value.nonce
          : nonce // ignore: cast_nullable_to_non_nullable
              as int,
      fee: fee == freezed
          ? _value.fee
          : fee // ignore: cast_nullable_to_non_nullable
              as double,
      timestamp: timestamp == freezed
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as int,
      nftData: nftData == freezed
          ? _value.nftData
          : nftData // ignore: cast_nullable_to_non_nullable
              as dynamic,
      signature: signature == freezed
          ? _value.signature
          : signature // ignore: cast_nullable_to_non_nullable
              as String?,
      height: height == freezed
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$TransactionCopyWith<$Res>
    implements $TransactionCopyWith<$Res> {
  factory _$TransactionCopyWith(
          _Transaction value, $Res Function(_Transaction) then) =
      __$TransactionCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'Hash') String hash,
      @JsonKey(name: 'ToAddress') String toAddress,
      @JsonKey(name: 'FromAddress') String fromAddress,
      @JsonKey(name: 'Amount') double amount,
      @JsonKey(name: 'Nonce') int nonce,
      @JsonKey(name: 'Fee') double fee,
      @JsonKey(name: 'Timestamp') int timestamp,
      @JsonKey(name: 'NFTData') dynamic nftData,
      @JsonKey(name: 'Signature') String? signature,
      @JsonKey(name: 'Height') int height});
}

/// @nodoc
class __$TransactionCopyWithImpl<$Res> extends _$TransactionCopyWithImpl<$Res>
    implements _$TransactionCopyWith<$Res> {
  __$TransactionCopyWithImpl(
      _Transaction _value, $Res Function(_Transaction) _then)
      : super(_value, (v) => _then(v as _Transaction));

  @override
  _Transaction get _value => super._value as _Transaction;

  @override
  $Res call({
    Object? hash = freezed,
    Object? toAddress = freezed,
    Object? fromAddress = freezed,
    Object? amount = freezed,
    Object? nonce = freezed,
    Object? fee = freezed,
    Object? timestamp = freezed,
    Object? nftData = freezed,
    Object? signature = freezed,
    Object? height = freezed,
  }) {
    return _then(_Transaction(
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
      amount: amount == freezed
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      nonce: nonce == freezed
          ? _value.nonce
          : nonce // ignore: cast_nullable_to_non_nullable
              as int,
      fee: fee == freezed
          ? _value.fee
          : fee // ignore: cast_nullable_to_non_nullable
              as double,
      timestamp: timestamp == freezed
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as int,
      nftData: nftData == freezed
          ? _value.nftData
          : nftData // ignore: cast_nullable_to_non_nullable
              as dynamic,
      signature: signature == freezed
          ? _value.signature
          : signature // ignore: cast_nullable_to_non_nullable
              as String?,
      height: height == freezed
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Transaction extends _Transaction {
  _$_Transaction(
      {@JsonKey(name: 'Hash') required this.hash,
      @JsonKey(name: 'ToAddress') required this.toAddress,
      @JsonKey(name: 'FromAddress') required this.fromAddress,
      @JsonKey(name: 'Amount') required this.amount,
      @JsonKey(name: 'Nonce') required this.nonce,
      @JsonKey(name: 'Fee') required this.fee,
      @JsonKey(name: 'Timestamp') required this.timestamp,
      @JsonKey(name: 'NFTData') required this.nftData,
      @JsonKey(name: 'Signature') this.signature,
      @JsonKey(name: 'Height') required this.height})
      : super._();

  factory _$_Transaction.fromJson(Map<String, dynamic> json) =>
      _$$_TransactionFromJson(json);

  @override
  @JsonKey(name: 'Hash')
  final String hash;
  @override
  @JsonKey(name: 'ToAddress')
  final String toAddress;
  @override
  @JsonKey(name: 'FromAddress')
  final String fromAddress;
  @override
  @JsonKey(name: 'Amount')
  final double amount;
  @override
  @JsonKey(name: 'Nonce')
  final int nonce;
  @override
  @JsonKey(name: 'Fee')
  final double fee;
  @override
  @JsonKey(name: 'Timestamp')
  final int timestamp;
  @override
  @JsonKey(name: 'NFTData')
  final dynamic nftData;
  @override
  @JsonKey(name: 'Signature')
  final String? signature;
  @override
  @JsonKey(name: 'Height')
  final int height;

  @override
  String toString() {
    return 'Transaction(hash: $hash, toAddress: $toAddress, fromAddress: $fromAddress, amount: $amount, nonce: $nonce, fee: $fee, timestamp: $timestamp, nftData: $nftData, signature: $signature, height: $height)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Transaction &&
            const DeepCollectionEquality().equals(other.hash, hash) &&
            const DeepCollectionEquality().equals(other.toAddress, toAddress) &&
            const DeepCollectionEquality()
                .equals(other.fromAddress, fromAddress) &&
            const DeepCollectionEquality().equals(other.amount, amount) &&
            const DeepCollectionEquality().equals(other.nonce, nonce) &&
            const DeepCollectionEquality().equals(other.fee, fee) &&
            const DeepCollectionEquality().equals(other.timestamp, timestamp) &&
            const DeepCollectionEquality().equals(other.nftData, nftData) &&
            const DeepCollectionEquality().equals(other.signature, signature) &&
            const DeepCollectionEquality().equals(other.height, height));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(hash),
      const DeepCollectionEquality().hash(toAddress),
      const DeepCollectionEquality().hash(fromAddress),
      const DeepCollectionEquality().hash(amount),
      const DeepCollectionEquality().hash(nonce),
      const DeepCollectionEquality().hash(fee),
      const DeepCollectionEquality().hash(timestamp),
      const DeepCollectionEquality().hash(nftData),
      const DeepCollectionEquality().hash(signature),
      const DeepCollectionEquality().hash(height));

  @JsonKey(ignore: true)
  @override
  _$TransactionCopyWith<_Transaction> get copyWith =>
      __$TransactionCopyWithImpl<_Transaction>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TransactionToJson(this);
  }
}

abstract class _Transaction extends Transaction {
  factory _Transaction(
      {@JsonKey(name: 'Hash') required String hash,
      @JsonKey(name: 'ToAddress') required String toAddress,
      @JsonKey(name: 'FromAddress') required String fromAddress,
      @JsonKey(name: 'Amount') required double amount,
      @JsonKey(name: 'Nonce') required int nonce,
      @JsonKey(name: 'Fee') required double fee,
      @JsonKey(name: 'Timestamp') required int timestamp,
      @JsonKey(name: 'NFTData') required dynamic nftData,
      @JsonKey(name: 'Signature') String? signature,
      @JsonKey(name: 'Height') required int height}) = _$_Transaction;
  _Transaction._() : super._();

  factory _Transaction.fromJson(Map<String, dynamic> json) =
      _$_Transaction.fromJson;

  @override
  @JsonKey(name: 'Hash')
  String get hash;
  @override
  @JsonKey(name: 'ToAddress')
  String get toAddress;
  @override
  @JsonKey(name: 'FromAddress')
  String get fromAddress;
  @override
  @JsonKey(name: 'Amount')
  double get amount;
  @override
  @JsonKey(name: 'Nonce')
  int get nonce;
  @override
  @JsonKey(name: 'Fee')
  double get fee;
  @override
  @JsonKey(name: 'Timestamp')
  int get timestamp;
  @override
  @JsonKey(name: 'NFTData')
  dynamic get nftData;
  @override
  @JsonKey(name: 'Signature')
  String? get signature;
  @override
  @JsonKey(name: 'Height')
  int get height;
  @override
  @JsonKey(ignore: true)
  _$TransactionCopyWith<_Transaction> get copyWith =>
      throw _privateConstructorUsedError;
}
