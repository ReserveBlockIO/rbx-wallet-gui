// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tokenized_bitcoin.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TokenizedBitcoin _$TokenizedBitcoinFromJson(Map<String, dynamic> json) {
  return _TokenizedBitcoin.fromJson(json);
}

/// @nodoc
mixin _$TokenizedBitcoin {
  @JsonKey(name: "Id")
  double get id => throw _privateConstructorUsedError;
  @JsonKey(name: "SmartContractUID")
  String get smartContractUid => throw _privateConstructorUsedError;
  @JsonKey(name: "RBXAddress")
  String get rbxAddress => throw _privateConstructorUsedError;
  @JsonKey(name: "DepositAddress")
  String? get btcAddress => throw _privateConstructorUsedError;
  @JsonKey(name: "Balance")
  double get balance => throw _privateConstructorUsedError;
  @JsonKey(name: "MyBalance")
  double get myBalance => throw _privateConstructorUsedError;
  @JsonKey(name: "TokenName")
  String get tokenName => throw _privateConstructorUsedError;
  @JsonKey(name: "TokenDescription")
  String get tokenDescription => throw _privateConstructorUsedError;
  @JsonKey(name: "SmartContractMainId")
  double get smartContractMainId => throw _privateConstructorUsedError;
  @JsonKey(name: "IsPublished")
  bool get isPublished => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TokenizedBitcoinCopyWith<TokenizedBitcoin> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TokenizedBitcoinCopyWith<$Res> {
  factory $TokenizedBitcoinCopyWith(
          TokenizedBitcoin value, $Res Function(TokenizedBitcoin) then) =
      _$TokenizedBitcoinCopyWithImpl<$Res, TokenizedBitcoin>;
  @useResult
  $Res call(
      {@JsonKey(name: "Id") double id,
      @JsonKey(name: "SmartContractUID") String smartContractUid,
      @JsonKey(name: "RBXAddress") String rbxAddress,
      @JsonKey(name: "DepositAddress") String? btcAddress,
      @JsonKey(name: "Balance") double balance,
      @JsonKey(name: "MyBalance") double myBalance,
      @JsonKey(name: "TokenName") String tokenName,
      @JsonKey(name: "TokenDescription") String tokenDescription,
      @JsonKey(name: "SmartContractMainId") double smartContractMainId,
      @JsonKey(name: "IsPublished") bool isPublished});
}

/// @nodoc
class _$TokenizedBitcoinCopyWithImpl<$Res, $Val extends TokenizedBitcoin>
    implements $TokenizedBitcoinCopyWith<$Res> {
  _$TokenizedBitcoinCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? smartContractUid = null,
    Object? rbxAddress = null,
    Object? btcAddress = freezed,
    Object? balance = null,
    Object? myBalance = null,
    Object? tokenName = null,
    Object? tokenDescription = null,
    Object? smartContractMainId = null,
    Object? isPublished = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as double,
      smartContractUid: null == smartContractUid
          ? _value.smartContractUid
          : smartContractUid // ignore: cast_nullable_to_non_nullable
              as String,
      rbxAddress: null == rbxAddress
          ? _value.rbxAddress
          : rbxAddress // ignore: cast_nullable_to_non_nullable
              as String,
      btcAddress: freezed == btcAddress
          ? _value.btcAddress
          : btcAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      balance: null == balance
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as double,
      myBalance: null == myBalance
          ? _value.myBalance
          : myBalance // ignore: cast_nullable_to_non_nullable
              as double,
      tokenName: null == tokenName
          ? _value.tokenName
          : tokenName // ignore: cast_nullable_to_non_nullable
              as String,
      tokenDescription: null == tokenDescription
          ? _value.tokenDescription
          : tokenDescription // ignore: cast_nullable_to_non_nullable
              as String,
      smartContractMainId: null == smartContractMainId
          ? _value.smartContractMainId
          : smartContractMainId // ignore: cast_nullable_to_non_nullable
              as double,
      isPublished: null == isPublished
          ? _value.isPublished
          : isPublished // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TokenizedBitcoinCopyWith<$Res>
    implements $TokenizedBitcoinCopyWith<$Res> {
  factory _$$_TokenizedBitcoinCopyWith(
          _$_TokenizedBitcoin value, $Res Function(_$_TokenizedBitcoin) then) =
      __$$_TokenizedBitcoinCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "Id") double id,
      @JsonKey(name: "SmartContractUID") String smartContractUid,
      @JsonKey(name: "RBXAddress") String rbxAddress,
      @JsonKey(name: "DepositAddress") String? btcAddress,
      @JsonKey(name: "Balance") double balance,
      @JsonKey(name: "MyBalance") double myBalance,
      @JsonKey(name: "TokenName") String tokenName,
      @JsonKey(name: "TokenDescription") String tokenDescription,
      @JsonKey(name: "SmartContractMainId") double smartContractMainId,
      @JsonKey(name: "IsPublished") bool isPublished});
}

/// @nodoc
class __$$_TokenizedBitcoinCopyWithImpl<$Res>
    extends _$TokenizedBitcoinCopyWithImpl<$Res, _$_TokenizedBitcoin>
    implements _$$_TokenizedBitcoinCopyWith<$Res> {
  __$$_TokenizedBitcoinCopyWithImpl(
      _$_TokenizedBitcoin _value, $Res Function(_$_TokenizedBitcoin) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? smartContractUid = null,
    Object? rbxAddress = null,
    Object? btcAddress = freezed,
    Object? balance = null,
    Object? myBalance = null,
    Object? tokenName = null,
    Object? tokenDescription = null,
    Object? smartContractMainId = null,
    Object? isPublished = null,
  }) {
    return _then(_$_TokenizedBitcoin(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as double,
      smartContractUid: null == smartContractUid
          ? _value.smartContractUid
          : smartContractUid // ignore: cast_nullable_to_non_nullable
              as String,
      rbxAddress: null == rbxAddress
          ? _value.rbxAddress
          : rbxAddress // ignore: cast_nullable_to_non_nullable
              as String,
      btcAddress: freezed == btcAddress
          ? _value.btcAddress
          : btcAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      balance: null == balance
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as double,
      myBalance: null == myBalance
          ? _value.myBalance
          : myBalance // ignore: cast_nullable_to_non_nullable
              as double,
      tokenName: null == tokenName
          ? _value.tokenName
          : tokenName // ignore: cast_nullable_to_non_nullable
              as String,
      tokenDescription: null == tokenDescription
          ? _value.tokenDescription
          : tokenDescription // ignore: cast_nullable_to_non_nullable
              as String,
      smartContractMainId: null == smartContractMainId
          ? _value.smartContractMainId
          : smartContractMainId // ignore: cast_nullable_to_non_nullable
              as double,
      isPublished: null == isPublished
          ? _value.isPublished
          : isPublished // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TokenizedBitcoin extends _TokenizedBitcoin {
  _$_TokenizedBitcoin(
      {@JsonKey(name: "Id") required this.id,
      @JsonKey(name: "SmartContractUID") required this.smartContractUid,
      @JsonKey(name: "RBXAddress") required this.rbxAddress,
      @JsonKey(name: "DepositAddress") this.btcAddress,
      @JsonKey(name: "Balance") this.balance = 0.0,
      @JsonKey(name: "MyBalance") this.myBalance = 0.0,
      @JsonKey(name: "TokenName") required this.tokenName,
      @JsonKey(name: "TokenDescription") required this.tokenDescription,
      @JsonKey(name: "SmartContractMainId") required this.smartContractMainId,
      @JsonKey(name: "IsPublished") required this.isPublished})
      : super._();

  factory _$_TokenizedBitcoin.fromJson(Map<String, dynamic> json) =>
      _$$_TokenizedBitcoinFromJson(json);

  @override
  @JsonKey(name: "Id")
  final double id;
  @override
  @JsonKey(name: "SmartContractUID")
  final String smartContractUid;
  @override
  @JsonKey(name: "RBXAddress")
  final String rbxAddress;
  @override
  @JsonKey(name: "DepositAddress")
  final String? btcAddress;
  @override
  @JsonKey(name: "Balance")
  final double balance;
  @override
  @JsonKey(name: "MyBalance")
  final double myBalance;
  @override
  @JsonKey(name: "TokenName")
  final String tokenName;
  @override
  @JsonKey(name: "TokenDescription")
  final String tokenDescription;
  @override
  @JsonKey(name: "SmartContractMainId")
  final double smartContractMainId;
  @override
  @JsonKey(name: "IsPublished")
  final bool isPublished;

  @override
  String toString() {
    return 'TokenizedBitcoin(id: $id, smartContractUid: $smartContractUid, rbxAddress: $rbxAddress, btcAddress: $btcAddress, balance: $balance, myBalance: $myBalance, tokenName: $tokenName, tokenDescription: $tokenDescription, smartContractMainId: $smartContractMainId, isPublished: $isPublished)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TokenizedBitcoin &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.smartContractUid, smartContractUid) ||
                other.smartContractUid == smartContractUid) &&
            (identical(other.rbxAddress, rbxAddress) ||
                other.rbxAddress == rbxAddress) &&
            (identical(other.btcAddress, btcAddress) ||
                other.btcAddress == btcAddress) &&
            (identical(other.balance, balance) || other.balance == balance) &&
            (identical(other.myBalance, myBalance) ||
                other.myBalance == myBalance) &&
            (identical(other.tokenName, tokenName) ||
                other.tokenName == tokenName) &&
            (identical(other.tokenDescription, tokenDescription) ||
                other.tokenDescription == tokenDescription) &&
            (identical(other.smartContractMainId, smartContractMainId) ||
                other.smartContractMainId == smartContractMainId) &&
            (identical(other.isPublished, isPublished) ||
                other.isPublished == isPublished));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      smartContractUid,
      rbxAddress,
      btcAddress,
      balance,
      myBalance,
      tokenName,
      tokenDescription,
      smartContractMainId,
      isPublished);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TokenizedBitcoinCopyWith<_$_TokenizedBitcoin> get copyWith =>
      __$$_TokenizedBitcoinCopyWithImpl<_$_TokenizedBitcoin>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TokenizedBitcoinToJson(
      this,
    );
  }
}

abstract class _TokenizedBitcoin extends TokenizedBitcoin {
  factory _TokenizedBitcoin(
      {@JsonKey(name: "Id")
          required final double id,
      @JsonKey(name: "SmartContractUID")
          required final String smartContractUid,
      @JsonKey(name: "RBXAddress")
          required final String rbxAddress,
      @JsonKey(name: "DepositAddress")
          final String? btcAddress,
      @JsonKey(name: "Balance")
          final double balance,
      @JsonKey(name: "MyBalance")
          final double myBalance,
      @JsonKey(name: "TokenName")
          required final String tokenName,
      @JsonKey(name: "TokenDescription")
          required final String tokenDescription,
      @JsonKey(name: "SmartContractMainId")
          required final double smartContractMainId,
      @JsonKey(name: "IsPublished")
          required final bool isPublished}) = _$_TokenizedBitcoin;
  _TokenizedBitcoin._() : super._();

  factory _TokenizedBitcoin.fromJson(Map<String, dynamic> json) =
      _$_TokenizedBitcoin.fromJson;

  @override
  @JsonKey(name: "Id")
  double get id;
  @override
  @JsonKey(name: "SmartContractUID")
  String get smartContractUid;
  @override
  @JsonKey(name: "RBXAddress")
  String get rbxAddress;
  @override
  @JsonKey(name: "DepositAddress")
  String? get btcAddress;
  @override
  @JsonKey(name: "Balance")
  double get balance;
  @override
  @JsonKey(name: "MyBalance")
  double get myBalance;
  @override
  @JsonKey(name: "TokenName")
  String get tokenName;
  @override
  @JsonKey(name: "TokenDescription")
  String get tokenDescription;
  @override
  @JsonKey(name: "SmartContractMainId")
  double get smartContractMainId;
  @override
  @JsonKey(name: "IsPublished")
  bool get isPublished;
  @override
  @JsonKey(ignore: true)
  _$$_TokenizedBitcoinCopyWith<_$_TokenizedBitcoin> get copyWith =>
      throw _privateConstructorUsedError;
}
