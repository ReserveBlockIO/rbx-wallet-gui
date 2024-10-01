// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'btc_account.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BtcAccount _$BtcAccountFromJson(Map<String, dynamic> json) {
  return _BtcAccount.fromJson(json);
}

/// @nodoc
mixin _$BtcAccount {
  @JsonKey(name: "Id")
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: "Address")
  String get address => throw _privateConstructorUsedError;
  @JsonKey(name: "PrivateKey")
  String get privateKey => throw _privateConstructorUsedError;
  @JsonKey(name: "ADNR")
  String? get adnr => throw _privateConstructorUsedError;
  @JsonKey(name: "ADNROwnerAddress")
  String? get adnrOwnerAddress => throw _privateConstructorUsedError;
  @JsonKey(name: "WifKey")
  String get wifKey => throw _privateConstructorUsedError;
  @JsonKey(name: "Balance")
  double get balance => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BtcAccountCopyWith<BtcAccount> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BtcAccountCopyWith<$Res> {
  factory $BtcAccountCopyWith(
          BtcAccount value, $Res Function(BtcAccount) then) =
      _$BtcAccountCopyWithImpl<$Res, BtcAccount>;
  @useResult
  $Res call(
      {@JsonKey(name: "Id") int id,
      @JsonKey(name: "Address") String address,
      @JsonKey(name: "PrivateKey") String privateKey,
      @JsonKey(name: "ADNR") String? adnr,
      @JsonKey(name: "ADNROwnerAddress") String? adnrOwnerAddress,
      @JsonKey(name: "WifKey") String wifKey,
      @JsonKey(name: "Balance") double balance});
}

/// @nodoc
class _$BtcAccountCopyWithImpl<$Res, $Val extends BtcAccount>
    implements $BtcAccountCopyWith<$Res> {
  _$BtcAccountCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? address = null,
    Object? privateKey = null,
    Object? adnr = freezed,
    Object? adnrOwnerAddress = freezed,
    Object? wifKey = null,
    Object? balance = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      privateKey: null == privateKey
          ? _value.privateKey
          : privateKey // ignore: cast_nullable_to_non_nullable
              as String,
      adnr: freezed == adnr
          ? _value.adnr
          : adnr // ignore: cast_nullable_to_non_nullable
              as String?,
      adnrOwnerAddress: freezed == adnrOwnerAddress
          ? _value.adnrOwnerAddress
          : adnrOwnerAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      wifKey: null == wifKey
          ? _value.wifKey
          : wifKey // ignore: cast_nullable_to_non_nullable
              as String,
      balance: null == balance
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_BtcAccountCopyWith<$Res>
    implements $BtcAccountCopyWith<$Res> {
  factory _$$_BtcAccountCopyWith(
          _$_BtcAccount value, $Res Function(_$_BtcAccount) then) =
      __$$_BtcAccountCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "Id") int id,
      @JsonKey(name: "Address") String address,
      @JsonKey(name: "PrivateKey") String privateKey,
      @JsonKey(name: "ADNR") String? adnr,
      @JsonKey(name: "ADNROwnerAddress") String? adnrOwnerAddress,
      @JsonKey(name: "WifKey") String wifKey,
      @JsonKey(name: "Balance") double balance});
}

/// @nodoc
class __$$_BtcAccountCopyWithImpl<$Res>
    extends _$BtcAccountCopyWithImpl<$Res, _$_BtcAccount>
    implements _$$_BtcAccountCopyWith<$Res> {
  __$$_BtcAccountCopyWithImpl(
      _$_BtcAccount _value, $Res Function(_$_BtcAccount) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? address = null,
    Object? privateKey = null,
    Object? adnr = freezed,
    Object? adnrOwnerAddress = freezed,
    Object? wifKey = null,
    Object? balance = null,
  }) {
    return _then(_$_BtcAccount(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      privateKey: null == privateKey
          ? _value.privateKey
          : privateKey // ignore: cast_nullable_to_non_nullable
              as String,
      adnr: freezed == adnr
          ? _value.adnr
          : adnr // ignore: cast_nullable_to_non_nullable
              as String?,
      adnrOwnerAddress: freezed == adnrOwnerAddress
          ? _value.adnrOwnerAddress
          : adnrOwnerAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      wifKey: null == wifKey
          ? _value.wifKey
          : wifKey // ignore: cast_nullable_to_non_nullable
              as String,
      balance: null == balance
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_BtcAccount extends _BtcAccount {
  _$_BtcAccount(
      {@JsonKey(name: "Id") this.id = 0,
      @JsonKey(name: "Address") required this.address,
      @JsonKey(name: "PrivateKey") required this.privateKey,
      @JsonKey(name: "ADNR") this.adnr,
      @JsonKey(name: "ADNROwnerAddress") this.adnrOwnerAddress,
      @JsonKey(name: "WifKey") required this.wifKey,
      @JsonKey(name: "Balance") this.balance = 0.0})
      : super._();

  factory _$_BtcAccount.fromJson(Map<String, dynamic> json) =>
      _$$_BtcAccountFromJson(json);

  @override
  @JsonKey(name: "Id")
  final int id;
  @override
  @JsonKey(name: "Address")
  final String address;
  @override
  @JsonKey(name: "PrivateKey")
  final String privateKey;
  @override
  @JsonKey(name: "ADNR")
  final String? adnr;
  @override
  @JsonKey(name: "ADNROwnerAddress")
  final String? adnrOwnerAddress;
  @override
  @JsonKey(name: "WifKey")
  final String wifKey;
  @override
  @JsonKey(name: "Balance")
  final double balance;

  @override
  String toString() {
    return 'BtcAccount(id: $id, address: $address, privateKey: $privateKey, adnr: $adnr, adnrOwnerAddress: $adnrOwnerAddress, wifKey: $wifKey, balance: $balance)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BtcAccount &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.privateKey, privateKey) ||
                other.privateKey == privateKey) &&
            (identical(other.adnr, adnr) || other.adnr == adnr) &&
            (identical(other.adnrOwnerAddress, adnrOwnerAddress) ||
                other.adnrOwnerAddress == adnrOwnerAddress) &&
            (identical(other.wifKey, wifKey) || other.wifKey == wifKey) &&
            (identical(other.balance, balance) || other.balance == balance));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, address, privateKey, adnr,
      adnrOwnerAddress, wifKey, balance);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BtcAccountCopyWith<_$_BtcAccount> get copyWith =>
      __$$_BtcAccountCopyWithImpl<_$_BtcAccount>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BtcAccountToJson(
      this,
    );
  }
}

abstract class _BtcAccount extends BtcAccount {
  factory _BtcAccount(
      {@JsonKey(name: "Id") final int id,
      @JsonKey(name: "Address") required final String address,
      @JsonKey(name: "PrivateKey") required final String privateKey,
      @JsonKey(name: "ADNR") final String? adnr,
      @JsonKey(name: "ADNROwnerAddress") final String? adnrOwnerAddress,
      @JsonKey(name: "WifKey") required final String wifKey,
      @JsonKey(name: "Balance") final double balance}) = _$_BtcAccount;
  _BtcAccount._() : super._();

  factory _BtcAccount.fromJson(Map<String, dynamic> json) =
      _$_BtcAccount.fromJson;

  @override
  @JsonKey(name: "Id")
  int get id;
  @override
  @JsonKey(name: "Address")
  String get address;
  @override
  @JsonKey(name: "PrivateKey")
  String get privateKey;
  @override
  @JsonKey(name: "ADNR")
  String? get adnr;
  @override
  @JsonKey(name: "ADNROwnerAddress")
  String? get adnrOwnerAddress;
  @override
  @JsonKey(name: "WifKey")
  String get wifKey;
  @override
  @JsonKey(name: "Balance")
  double get balance;
  @override
  @JsonKey(ignore: true)
  _$$_BtcAccountCopyWith<_$_BtcAccount> get copyWith =>
      throw _privateConstructorUsedError;
}
