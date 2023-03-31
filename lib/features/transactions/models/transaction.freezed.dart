// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Transaction _$TransactionFromJson(Map<String, dynamic> json) {
  return _Transaction.fromJson(json);
}

/// @nodoc
mixin _$Transaction {
  @JsonKey(name: 'Hash')
  String get hash => throw _privateConstructorUsedError;
  @JsonKey(name: 'ToAddress')
  String get toAddress => throw _privateConstructorUsedError;
  @JsonKey(name: 'FromAddress')
  String get fromAddress => throw _privateConstructorUsedError;
  @JsonKey(name: 'TransactionType')
  int get type => throw _privateConstructorUsedError;
  @JsonKey(name: 'TransactionStatus', fromJson: statusFromJson)
  TransactionStatus? get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'Amount')
  double get amount => throw _privateConstructorUsedError;
  @JsonKey(name: 'Nonce')
  int get nonce => throw _privateConstructorUsedError;
  @JsonKey(name: 'Fee')
  double get fee => throw _privateConstructorUsedError;
  @JsonKey(name: 'Timestamp')
  int get timestamp => throw _privateConstructorUsedError;
  @JsonKey(name: 'Data')
  dynamic get nftData => throw _privateConstructorUsedError;
  @JsonKey(name: 'Signature')
  String? get signature => throw _privateConstructorUsedError;
  @JsonKey(name: 'Height')
  int get height => throw _privateConstructorUsedError;
  @JsonKey(name: 'UnlockTime')
  int? get unlockTime => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TransactionCopyWith<Transaction> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionCopyWith<$Res> {
  factory $TransactionCopyWith(
          Transaction value, $Res Function(Transaction) then) =
      _$TransactionCopyWithImpl<$Res, Transaction>;
  @useResult
  $Res call(
      {@JsonKey(name: 'Hash')
          String hash,
      @JsonKey(name: 'ToAddress')
          String toAddress,
      @JsonKey(name: 'FromAddress')
          String fromAddress,
      @JsonKey(name: 'TransactionType')
          int type,
      @JsonKey(name: 'TransactionStatus', fromJson: statusFromJson)
          TransactionStatus? status,
      @JsonKey(name: 'Amount')
          double amount,
      @JsonKey(name: 'Nonce')
          int nonce,
      @JsonKey(name: 'Fee')
          double fee,
      @JsonKey(name: 'Timestamp')
          int timestamp,
      @JsonKey(name: 'Data')
          dynamic nftData,
      @JsonKey(name: 'Signature')
          String? signature,
      @JsonKey(name: 'Height')
          int height,
      @JsonKey(name: 'UnlockTime')
          int? unlockTime});
}

/// @nodoc
class _$TransactionCopyWithImpl<$Res, $Val extends Transaction>
    implements $TransactionCopyWith<$Res> {
  _$TransactionCopyWithImpl(this._value, this._then);

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
    Object? status = freezed,
    Object? amount = null,
    Object? nonce = null,
    Object? fee = null,
    Object? timestamp = null,
    Object? nftData = freezed,
    Object? signature = freezed,
    Object? height = null,
    Object? unlockTime = freezed,
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
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as TransactionStatus?,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      nonce: null == nonce
          ? _value.nonce
          : nonce // ignore: cast_nullable_to_non_nullable
              as int,
      fee: null == fee
          ? _value.fee
          : fee // ignore: cast_nullable_to_non_nullable
              as double,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as int,
      nftData: freezed == nftData
          ? _value.nftData
          : nftData // ignore: cast_nullable_to_non_nullable
              as dynamic,
      signature: freezed == signature
          ? _value.signature
          : signature // ignore: cast_nullable_to_non_nullable
              as String?,
      height: null == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as int,
      unlockTime: freezed == unlockTime
          ? _value.unlockTime
          : unlockTime // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TransactionCopyWith<$Res>
    implements $TransactionCopyWith<$Res> {
  factory _$$_TransactionCopyWith(
          _$_Transaction value, $Res Function(_$_Transaction) then) =
      __$$_TransactionCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'Hash')
          String hash,
      @JsonKey(name: 'ToAddress')
          String toAddress,
      @JsonKey(name: 'FromAddress')
          String fromAddress,
      @JsonKey(name: 'TransactionType')
          int type,
      @JsonKey(name: 'TransactionStatus', fromJson: statusFromJson)
          TransactionStatus? status,
      @JsonKey(name: 'Amount')
          double amount,
      @JsonKey(name: 'Nonce')
          int nonce,
      @JsonKey(name: 'Fee')
          double fee,
      @JsonKey(name: 'Timestamp')
          int timestamp,
      @JsonKey(name: 'Data')
          dynamic nftData,
      @JsonKey(name: 'Signature')
          String? signature,
      @JsonKey(name: 'Height')
          int height,
      @JsonKey(name: 'UnlockTime')
          int? unlockTime});
}

/// @nodoc
class __$$_TransactionCopyWithImpl<$Res>
    extends _$TransactionCopyWithImpl<$Res, _$_Transaction>
    implements _$$_TransactionCopyWith<$Res> {
  __$$_TransactionCopyWithImpl(
      _$_Transaction _value, $Res Function(_$_Transaction) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hash = null,
    Object? toAddress = null,
    Object? fromAddress = null,
    Object? type = null,
    Object? status = freezed,
    Object? amount = null,
    Object? nonce = null,
    Object? fee = null,
    Object? timestamp = null,
    Object? nftData = freezed,
    Object? signature = freezed,
    Object? height = null,
    Object? unlockTime = freezed,
  }) {
    return _then(_$_Transaction(
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
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as TransactionStatus?,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      nonce: null == nonce
          ? _value.nonce
          : nonce // ignore: cast_nullable_to_non_nullable
              as int,
      fee: null == fee
          ? _value.fee
          : fee // ignore: cast_nullable_to_non_nullable
              as double,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as int,
      nftData: freezed == nftData
          ? _value.nftData
          : nftData // ignore: cast_nullable_to_non_nullable
              as dynamic,
      signature: freezed == signature
          ? _value.signature
          : signature // ignore: cast_nullable_to_non_nullable
              as String?,
      height: null == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as int,
      unlockTime: freezed == unlockTime
          ? _value.unlockTime
          : unlockTime // ignore: cast_nullable_to_non_nullable
              as int?,
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
      @JsonKey(name: 'TransactionType') required this.type,
      @JsonKey(name: 'TransactionStatus', fromJson: statusFromJson) this.status,
      @JsonKey(name: 'Amount') required this.amount,
      @JsonKey(name: 'Nonce') required this.nonce,
      @JsonKey(name: 'Fee') required this.fee,
      @JsonKey(name: 'Timestamp') required this.timestamp,
      @JsonKey(name: 'Data') required this.nftData,
      @JsonKey(name: 'Signature') this.signature,
      @JsonKey(name: 'Height') required this.height,
      @JsonKey(name: 'UnlockTime') this.unlockTime})
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
  @JsonKey(name: 'TransactionType')
  final int type;
  @override
  @JsonKey(name: 'TransactionStatus', fromJson: statusFromJson)
  final TransactionStatus? status;
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
  @JsonKey(name: 'Data')
  final dynamic nftData;
  @override
  @JsonKey(name: 'Signature')
  final String? signature;
  @override
  @JsonKey(name: 'Height')
  final int height;
  @override
  @JsonKey(name: 'UnlockTime')
  final int? unlockTime;

  @override
  String toString() {
    return 'Transaction(hash: $hash, toAddress: $toAddress, fromAddress: $fromAddress, type: $type, status: $status, amount: $amount, nonce: $nonce, fee: $fee, timestamp: $timestamp, nftData: $nftData, signature: $signature, height: $height, unlockTime: $unlockTime)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Transaction &&
            (identical(other.hash, hash) || other.hash == hash) &&
            (identical(other.toAddress, toAddress) ||
                other.toAddress == toAddress) &&
            (identical(other.fromAddress, fromAddress) ||
                other.fromAddress == fromAddress) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.nonce, nonce) || other.nonce == nonce) &&
            (identical(other.fee, fee) || other.fee == fee) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            const DeepCollectionEquality().equals(other.nftData, nftData) &&
            (identical(other.signature, signature) ||
                other.signature == signature) &&
            (identical(other.height, height) || other.height == height) &&
            (identical(other.unlockTime, unlockTime) ||
                other.unlockTime == unlockTime));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      hash,
      toAddress,
      fromAddress,
      type,
      status,
      amount,
      nonce,
      fee,
      timestamp,
      const DeepCollectionEquality().hash(nftData),
      signature,
      height,
      unlockTime);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TransactionCopyWith<_$_Transaction> get copyWith =>
      __$$_TransactionCopyWithImpl<_$_Transaction>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TransactionToJson(
      this,
    );
  }
}

abstract class _Transaction extends Transaction {
  factory _Transaction(
      {@JsonKey(name: 'Hash')
          required final String hash,
      @JsonKey(name: 'ToAddress')
          required final String toAddress,
      @JsonKey(name: 'FromAddress')
          required final String fromAddress,
      @JsonKey(name: 'TransactionType')
          required final int type,
      @JsonKey(name: 'TransactionStatus', fromJson: statusFromJson)
          final TransactionStatus? status,
      @JsonKey(name: 'Amount')
          required final double amount,
      @JsonKey(name: 'Nonce')
          required final int nonce,
      @JsonKey(name: 'Fee')
          required final double fee,
      @JsonKey(name: 'Timestamp')
          required final int timestamp,
      @JsonKey(name: 'Data')
          required final dynamic nftData,
      @JsonKey(name: 'Signature')
          final String? signature,
      @JsonKey(name: 'Height')
          required final int height,
      @JsonKey(name: 'UnlockTime')
          final int? unlockTime}) = _$_Transaction;
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
  @JsonKey(name: 'TransactionType')
  int get type;
  @override
  @JsonKey(name: 'TransactionStatus', fromJson: statusFromJson)
  TransactionStatus? get status;
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
  @JsonKey(name: 'Data')
  dynamic get nftData;
  @override
  @JsonKey(name: 'Signature')
  String? get signature;
  @override
  @JsonKey(name: 'Height')
  int get height;
  @override
  @JsonKey(name: 'UnlockTime')
  int? get unlockTime;
  @override
  @JsonKey(ignore: true)
  _$$_TransactionCopyWith<_$_Transaction> get copyWith =>
      throw _privateConstructorUsedError;
}
