// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'token_account.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TokenAccount _$TokenAccountFromJson(Map<String, dynamic> json) {
  return _TokenAccount.fromJson(json);
}

/// @nodoc
mixin _$TokenAccount {
  @JsonKey(name: "SmartContractUID")
  String get smartContractId => throw _privateConstructorUsedError;
  @JsonKey(name: "TokenName")
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: "TokenTicker")
  String get ticker => throw _privateConstructorUsedError;
  @JsonKey(name: "Balance")
  double get balance => throw _privateConstructorUsedError;
  @JsonKey(name: "LockedBalance")
  double get lockedBalance => throw _privateConstructorUsedError;
  @JsonKey(name: "DecimalPlaces")
  int get decimalPlaces => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TokenAccountCopyWith<TokenAccount> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TokenAccountCopyWith<$Res> {
  factory $TokenAccountCopyWith(
          TokenAccount value, $Res Function(TokenAccount) then) =
      _$TokenAccountCopyWithImpl<$Res, TokenAccount>;
  @useResult
  $Res call(
      {@JsonKey(name: "SmartContractUID") String smartContractId,
      @JsonKey(name: "TokenName") String name,
      @JsonKey(name: "TokenTicker") String ticker,
      @JsonKey(name: "Balance") double balance,
      @JsonKey(name: "LockedBalance") double lockedBalance,
      @JsonKey(name: "DecimalPlaces") int decimalPlaces});
}

/// @nodoc
class _$TokenAccountCopyWithImpl<$Res, $Val extends TokenAccount>
    implements $TokenAccountCopyWith<$Res> {
  _$TokenAccountCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? smartContractId = null,
    Object? name = null,
    Object? ticker = null,
    Object? balance = null,
    Object? lockedBalance = null,
    Object? decimalPlaces = null,
  }) {
    return _then(_value.copyWith(
      smartContractId: null == smartContractId
          ? _value.smartContractId
          : smartContractId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      ticker: null == ticker
          ? _value.ticker
          : ticker // ignore: cast_nullable_to_non_nullable
              as String,
      balance: null == balance
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as double,
      lockedBalance: null == lockedBalance
          ? _value.lockedBalance
          : lockedBalance // ignore: cast_nullable_to_non_nullable
              as double,
      decimalPlaces: null == decimalPlaces
          ? _value.decimalPlaces
          : decimalPlaces // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TokenAccountCopyWith<$Res>
    implements $TokenAccountCopyWith<$Res> {
  factory _$$_TokenAccountCopyWith(
          _$_TokenAccount value, $Res Function(_$_TokenAccount) then) =
      __$$_TokenAccountCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "SmartContractUID") String smartContractId,
      @JsonKey(name: "TokenName") String name,
      @JsonKey(name: "TokenTicker") String ticker,
      @JsonKey(name: "Balance") double balance,
      @JsonKey(name: "LockedBalance") double lockedBalance,
      @JsonKey(name: "DecimalPlaces") int decimalPlaces});
}

/// @nodoc
class __$$_TokenAccountCopyWithImpl<$Res>
    extends _$TokenAccountCopyWithImpl<$Res, _$_TokenAccount>
    implements _$$_TokenAccountCopyWith<$Res> {
  __$$_TokenAccountCopyWithImpl(
      _$_TokenAccount _value, $Res Function(_$_TokenAccount) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? smartContractId = null,
    Object? name = null,
    Object? ticker = null,
    Object? balance = null,
    Object? lockedBalance = null,
    Object? decimalPlaces = null,
  }) {
    return _then(_$_TokenAccount(
      smartContractId: null == smartContractId
          ? _value.smartContractId
          : smartContractId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      ticker: null == ticker
          ? _value.ticker
          : ticker // ignore: cast_nullable_to_non_nullable
              as String,
      balance: null == balance
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as double,
      lockedBalance: null == lockedBalance
          ? _value.lockedBalance
          : lockedBalance // ignore: cast_nullable_to_non_nullable
              as double,
      decimalPlaces: null == decimalPlaces
          ? _value.decimalPlaces
          : decimalPlaces // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TokenAccount extends _TokenAccount {
  const _$_TokenAccount(
      {@JsonKey(name: "SmartContractUID") required this.smartContractId,
      @JsonKey(name: "TokenName") required this.name,
      @JsonKey(name: "TokenTicker") required this.ticker,
      @JsonKey(name: "Balance") required this.balance,
      @JsonKey(name: "LockedBalance") required this.lockedBalance,
      @JsonKey(name: "DecimalPlaces") required this.decimalPlaces})
      : super._();

  factory _$_TokenAccount.fromJson(Map<String, dynamic> json) =>
      _$$_TokenAccountFromJson(json);

  @override
  @JsonKey(name: "SmartContractUID")
  final String smartContractId;
  @override
  @JsonKey(name: "TokenName")
  final String name;
  @override
  @JsonKey(name: "TokenTicker")
  final String ticker;
  @override
  @JsonKey(name: "Balance")
  final double balance;
  @override
  @JsonKey(name: "LockedBalance")
  final double lockedBalance;
  @override
  @JsonKey(name: "DecimalPlaces")
  final int decimalPlaces;

  @override
  String toString() {
    return 'TokenAccount(smartContractId: $smartContractId, name: $name, ticker: $ticker, balance: $balance, lockedBalance: $lockedBalance, decimalPlaces: $decimalPlaces)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TokenAccount &&
            (identical(other.smartContractId, smartContractId) ||
                other.smartContractId == smartContractId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.ticker, ticker) || other.ticker == ticker) &&
            (identical(other.balance, balance) || other.balance == balance) &&
            (identical(other.lockedBalance, lockedBalance) ||
                other.lockedBalance == lockedBalance) &&
            (identical(other.decimalPlaces, decimalPlaces) ||
                other.decimalPlaces == decimalPlaces));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, smartContractId, name, ticker,
      balance, lockedBalance, decimalPlaces);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TokenAccountCopyWith<_$_TokenAccount> get copyWith =>
      __$$_TokenAccountCopyWithImpl<_$_TokenAccount>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TokenAccountToJson(
      this,
    );
  }
}

abstract class _TokenAccount extends TokenAccount {
  const factory _TokenAccount(
      {@JsonKey(name: "SmartContractUID")
          required final String smartContractId,
      @JsonKey(name: "TokenName")
          required final String name,
      @JsonKey(name: "TokenTicker")
          required final String ticker,
      @JsonKey(name: "Balance")
          required final double balance,
      @JsonKey(name: "LockedBalance")
          required final double lockedBalance,
      @JsonKey(name: "DecimalPlaces")
          required final int decimalPlaces}) = _$_TokenAccount;
  const _TokenAccount._() : super._();

  factory _TokenAccount.fromJson(Map<String, dynamic> json) =
      _$_TokenAccount.fromJson;

  @override
  @JsonKey(name: "SmartContractUID")
  String get smartContractId;
  @override
  @JsonKey(name: "TokenName")
  String get name;
  @override
  @JsonKey(name: "TokenTicker")
  String get ticker;
  @override
  @JsonKey(name: "Balance")
  double get balance;
  @override
  @JsonKey(name: "LockedBalance")
  double get lockedBalance;
  @override
  @JsonKey(name: "DecimalPlaces")
  int get decimalPlaces;
  @override
  @JsonKey(ignore: true)
  _$$_TokenAccountCopyWith<_$_TokenAccount> get copyWith =>
      throw _privateConstructorUsedError;
}
