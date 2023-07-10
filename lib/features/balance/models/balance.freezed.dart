// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'balance.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Balance _$BalanceFromJson(Map<String, dynamic> json) {
  return _Balance.fromJson(json);
}

/// @nodoc
mixin _$Balance {
  @JsonKey(name: "Address")
  String get address => throw _privateConstructorUsedError;
  @JsonKey(name: "RBXBalance")
  double get balance => throw _privateConstructorUsedError;
  @JsonKey(name: "RBXLockedBalance")
  double get lockedBalance => throw _privateConstructorUsedError;
  @JsonKey(name: "TokenAccounts")
  List<TokenAccount> get tokens => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BalanceCopyWith<Balance> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BalanceCopyWith<$Res> {
  factory $BalanceCopyWith(Balance value, $Res Function(Balance) then) =
      _$BalanceCopyWithImpl<$Res, Balance>;
  @useResult
  $Res call(
      {@JsonKey(name: "Address") String address,
      @JsonKey(name: "RBXBalance") double balance,
      @JsonKey(name: "RBXLockedBalance") double lockedBalance,
      @JsonKey(name: "TokenAccounts") List<TokenAccount> tokens});
}

/// @nodoc
class _$BalanceCopyWithImpl<$Res, $Val extends Balance>
    implements $BalanceCopyWith<$Res> {
  _$BalanceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? address = null,
    Object? balance = null,
    Object? lockedBalance = null,
    Object? tokens = null,
  }) {
    return _then(_value.copyWith(
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      balance: null == balance
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as double,
      lockedBalance: null == lockedBalance
          ? _value.lockedBalance
          : lockedBalance // ignore: cast_nullable_to_non_nullable
              as double,
      tokens: null == tokens
          ? _value.tokens
          : tokens // ignore: cast_nullable_to_non_nullable
              as List<TokenAccount>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_BalanceCopyWith<$Res> implements $BalanceCopyWith<$Res> {
  factory _$$_BalanceCopyWith(
          _$_Balance value, $Res Function(_$_Balance) then) =
      __$$_BalanceCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "Address") String address,
      @JsonKey(name: "RBXBalance") double balance,
      @JsonKey(name: "RBXLockedBalance") double lockedBalance,
      @JsonKey(name: "TokenAccounts") List<TokenAccount> tokens});
}

/// @nodoc
class __$$_BalanceCopyWithImpl<$Res>
    extends _$BalanceCopyWithImpl<$Res, _$_Balance>
    implements _$$_BalanceCopyWith<$Res> {
  __$$_BalanceCopyWithImpl(_$_Balance _value, $Res Function(_$_Balance) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? address = null,
    Object? balance = null,
    Object? lockedBalance = null,
    Object? tokens = null,
  }) {
    return _then(_$_Balance(
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      balance: null == balance
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as double,
      lockedBalance: null == lockedBalance
          ? _value.lockedBalance
          : lockedBalance // ignore: cast_nullable_to_non_nullable
              as double,
      tokens: null == tokens
          ? _value._tokens
          : tokens // ignore: cast_nullable_to_non_nullable
              as List<TokenAccount>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Balance extends _Balance {
  const _$_Balance(
      {@JsonKey(name: "Address") required this.address,
      @JsonKey(name: "RBXBalance") required this.balance,
      @JsonKey(name: "RBXLockedBalance") required this.lockedBalance,
      @JsonKey(name: "TokenAccounts") required final List<TokenAccount> tokens})
      : _tokens = tokens,
        super._();

  factory _$_Balance.fromJson(Map<String, dynamic> json) =>
      _$$_BalanceFromJson(json);

  @override
  @JsonKey(name: "Address")
  final String address;
  @override
  @JsonKey(name: "RBXBalance")
  final double balance;
  @override
  @JsonKey(name: "RBXLockedBalance")
  final double lockedBalance;
  final List<TokenAccount> _tokens;
  @override
  @JsonKey(name: "TokenAccounts")
  List<TokenAccount> get tokens {
    if (_tokens is EqualUnmodifiableListView) return _tokens;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tokens);
  }

  @override
  String toString() {
    return 'Balance(address: $address, balance: $balance, lockedBalance: $lockedBalance, tokens: $tokens)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Balance &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.balance, balance) || other.balance == balance) &&
            (identical(other.lockedBalance, lockedBalance) ||
                other.lockedBalance == lockedBalance) &&
            const DeepCollectionEquality().equals(other._tokens, _tokens));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, address, balance, lockedBalance,
      const DeepCollectionEquality().hash(_tokens));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BalanceCopyWith<_$_Balance> get copyWith =>
      __$$_BalanceCopyWithImpl<_$_Balance>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BalanceToJson(
      this,
    );
  }
}

abstract class _Balance extends Balance {
  const factory _Balance(
      {@JsonKey(name: "Address")
          required final String address,
      @JsonKey(name: "RBXBalance")
          required final double balance,
      @JsonKey(name: "RBXLockedBalance")
          required final double lockedBalance,
      @JsonKey(name: "TokenAccounts")
          required final List<TokenAccount> tokens}) = _$_Balance;
  const _Balance._() : super._();

  factory _Balance.fromJson(Map<String, dynamic> json) = _$_Balance.fromJson;

  @override
  @JsonKey(name: "Address")
  String get address;
  @override
  @JsonKey(name: "RBXBalance")
  double get balance;
  @override
  @JsonKey(name: "RBXLockedBalance")
  double get lockedBalance;
  @override
  @JsonKey(name: "TokenAccounts")
  List<TokenAccount> get tokens;
  @override
  @JsonKey(ignore: true)
  _$$_BalanceCopyWith<_$_Balance> get copyWith =>
      throw _privateConstructorUsedError;
}
