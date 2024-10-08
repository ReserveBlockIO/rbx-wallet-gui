// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'btc_web_account.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BtcWebAccount _$BtcWebAccountFromJson(Map<String, dynamic> json) {
  return _BtcWebAccount.fromJson(json);
}

/// @nodoc
mixin _$BtcWebAccount {
  String get address => throw _privateConstructorUsedError;
  String get wif => throw _privateConstructorUsedError;
  String get privateKey => throw _privateConstructorUsedError;
  String get publicKey => throw _privateConstructorUsedError;
  String? get mnemonic => throw _privateConstructorUsedError;
  String? get adnr => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BtcWebAccountCopyWith<BtcWebAccount> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BtcWebAccountCopyWith<$Res> {
  factory $BtcWebAccountCopyWith(
          BtcWebAccount value, $Res Function(BtcWebAccount) then) =
      _$BtcWebAccountCopyWithImpl<$Res, BtcWebAccount>;
  @useResult
  $Res call(
      {String address,
      String wif,
      String privateKey,
      String publicKey,
      String? mnemonic,
      String? adnr});
}

/// @nodoc
class _$BtcWebAccountCopyWithImpl<$Res, $Val extends BtcWebAccount>
    implements $BtcWebAccountCopyWith<$Res> {
  _$BtcWebAccountCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? address = null,
    Object? wif = null,
    Object? privateKey = null,
    Object? publicKey = null,
    Object? mnemonic = freezed,
    Object? adnr = freezed,
  }) {
    return _then(_value.copyWith(
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      wif: null == wif
          ? _value.wif
          : wif // ignore: cast_nullable_to_non_nullable
              as String,
      privateKey: null == privateKey
          ? _value.privateKey
          : privateKey // ignore: cast_nullable_to_non_nullable
              as String,
      publicKey: null == publicKey
          ? _value.publicKey
          : publicKey // ignore: cast_nullable_to_non_nullable
              as String,
      mnemonic: freezed == mnemonic
          ? _value.mnemonic
          : mnemonic // ignore: cast_nullable_to_non_nullable
              as String?,
      adnr: freezed == adnr
          ? _value.adnr
          : adnr // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_BtcWebAccountCopyWith<$Res>
    implements $BtcWebAccountCopyWith<$Res> {
  factory _$$_BtcWebAccountCopyWith(
          _$_BtcWebAccount value, $Res Function(_$_BtcWebAccount) then) =
      __$$_BtcWebAccountCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String address,
      String wif,
      String privateKey,
      String publicKey,
      String? mnemonic,
      String? adnr});
}

/// @nodoc
class __$$_BtcWebAccountCopyWithImpl<$Res>
    extends _$BtcWebAccountCopyWithImpl<$Res, _$_BtcWebAccount>
    implements _$$_BtcWebAccountCopyWith<$Res> {
  __$$_BtcWebAccountCopyWithImpl(
      _$_BtcWebAccount _value, $Res Function(_$_BtcWebAccount) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? address = null,
    Object? wif = null,
    Object? privateKey = null,
    Object? publicKey = null,
    Object? mnemonic = freezed,
    Object? adnr = freezed,
  }) {
    return _then(_$_BtcWebAccount(
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      wif: null == wif
          ? _value.wif
          : wif // ignore: cast_nullable_to_non_nullable
              as String,
      privateKey: null == privateKey
          ? _value.privateKey
          : privateKey // ignore: cast_nullable_to_non_nullable
              as String,
      publicKey: null == publicKey
          ? _value.publicKey
          : publicKey // ignore: cast_nullable_to_non_nullable
              as String,
      mnemonic: freezed == mnemonic
          ? _value.mnemonic
          : mnemonic // ignore: cast_nullable_to_non_nullable
              as String?,
      adnr: freezed == adnr
          ? _value.adnr
          : adnr // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_BtcWebAccount extends _BtcWebAccount {
  _$_BtcWebAccount(
      {required this.address,
      required this.wif,
      required this.privateKey,
      required this.publicKey,
      this.mnemonic,
      this.adnr})
      : super._();

  factory _$_BtcWebAccount.fromJson(Map<String, dynamic> json) =>
      _$$_BtcWebAccountFromJson(json);

  @override
  final String address;
  @override
  final String wif;
  @override
  final String privateKey;
  @override
  final String publicKey;
  @override
  final String? mnemonic;
  @override
  final String? adnr;

  @override
  String toString() {
    return 'BtcWebAccount(address: $address, wif: $wif, privateKey: $privateKey, publicKey: $publicKey, mnemonic: $mnemonic, adnr: $adnr)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BtcWebAccount &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.wif, wif) || other.wif == wif) &&
            (identical(other.privateKey, privateKey) ||
                other.privateKey == privateKey) &&
            (identical(other.publicKey, publicKey) ||
                other.publicKey == publicKey) &&
            (identical(other.mnemonic, mnemonic) ||
                other.mnemonic == mnemonic) &&
            (identical(other.adnr, adnr) || other.adnr == adnr));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, address, wif, privateKey, publicKey, mnemonic, adnr);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BtcWebAccountCopyWith<_$_BtcWebAccount> get copyWith =>
      __$$_BtcWebAccountCopyWithImpl<_$_BtcWebAccount>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BtcWebAccountToJson(
      this,
    );
  }
}

abstract class _BtcWebAccount extends BtcWebAccount {
  factory _BtcWebAccount(
      {required final String address,
      required final String wif,
      required final String privateKey,
      required final String publicKey,
      final String? mnemonic,
      final String? adnr}) = _$_BtcWebAccount;
  _BtcWebAccount._() : super._();

  factory _BtcWebAccount.fromJson(Map<String, dynamic> json) =
      _$_BtcWebAccount.fromJson;

  @override
  String get address;
  @override
  String get wif;
  @override
  String get privateKey;
  @override
  String get publicKey;
  @override
  String? get mnemonic;
  @override
  String? get adnr;
  @override
  @JsonKey(ignore: true)
  _$$_BtcWebAccountCopyWith<_$_BtcWebAccount> get copyWith =>
      throw _privateConstructorUsedError;
}
