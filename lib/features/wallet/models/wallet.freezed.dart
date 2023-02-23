// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'wallet.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Wallet _$WalletFromJson(Map<String, dynamic> json) {
  return _Wallet.fromJson(json);
}

/// @nodoc
mixin _$Wallet {
  @JsonKey(name: 'Id')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'PublicKey')
  String get publicKey => throw _privateConstructorUsedError;
  @JsonKey(name: 'GetKey')
  String? get privateKey => throw _privateConstructorUsedError;
  @JsonKey(name: 'Address')
  String get address => throw _privateConstructorUsedError;
  String? get friendlyName => throw _privateConstructorUsedError;
  @JsonKey(name: 'Balance')
  double get balance => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsValidating')
  bool get isValidating =>
      throw _privateConstructorUsedError; // @JsonKey(name: 'IsEncrypted') required bool isEncrypted,
  @JsonKey(name: "ADNR")
  String? get adnr => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WalletCopyWith<Wallet> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WalletCopyWith<$Res> {
  factory $WalletCopyWith(Wallet value, $Res Function(Wallet) then) =
      _$WalletCopyWithImpl<$Res, Wallet>;
  @useResult
  $Res call(
      {@JsonKey(name: 'Id') int id,
      @JsonKey(name: 'PublicKey') String publicKey,
      @JsonKey(name: 'GetKey') String? privateKey,
      @JsonKey(name: 'Address') String address,
      String? friendlyName,
      @JsonKey(name: 'Balance') double balance,
      @JsonKey(name: 'IsValidating') bool isValidating,
      @JsonKey(name: "ADNR") String? adnr});
}

/// @nodoc
class _$WalletCopyWithImpl<$Res, $Val extends Wallet>
    implements $WalletCopyWith<$Res> {
  _$WalletCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? publicKey = null,
    Object? privateKey = freezed,
    Object? address = null,
    Object? friendlyName = freezed,
    Object? balance = null,
    Object? isValidating = null,
    Object? adnr = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      publicKey: null == publicKey
          ? _value.publicKey
          : publicKey // ignore: cast_nullable_to_non_nullable
              as String,
      privateKey: freezed == privateKey
          ? _value.privateKey
          : privateKey // ignore: cast_nullable_to_non_nullable
              as String?,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      friendlyName: freezed == friendlyName
          ? _value.friendlyName
          : friendlyName // ignore: cast_nullable_to_non_nullable
              as String?,
      balance: null == balance
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as double,
      isValidating: null == isValidating
          ? _value.isValidating
          : isValidating // ignore: cast_nullable_to_non_nullable
              as bool,
      adnr: freezed == adnr
          ? _value.adnr
          : adnr // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_WalletCopyWith<$Res> implements $WalletCopyWith<$Res> {
  factory _$$_WalletCopyWith(_$_Wallet value, $Res Function(_$_Wallet) then) =
      __$$_WalletCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'Id') int id,
      @JsonKey(name: 'PublicKey') String publicKey,
      @JsonKey(name: 'GetKey') String? privateKey,
      @JsonKey(name: 'Address') String address,
      String? friendlyName,
      @JsonKey(name: 'Balance') double balance,
      @JsonKey(name: 'IsValidating') bool isValidating,
      @JsonKey(name: "ADNR") String? adnr});
}

/// @nodoc
class __$$_WalletCopyWithImpl<$Res>
    extends _$WalletCopyWithImpl<$Res, _$_Wallet>
    implements _$$_WalletCopyWith<$Res> {
  __$$_WalletCopyWithImpl(_$_Wallet _value, $Res Function(_$_Wallet) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? publicKey = null,
    Object? privateKey = freezed,
    Object? address = null,
    Object? friendlyName = freezed,
    Object? balance = null,
    Object? isValidating = null,
    Object? adnr = freezed,
  }) {
    return _then(_$_Wallet(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      publicKey: null == publicKey
          ? _value.publicKey
          : publicKey // ignore: cast_nullable_to_non_nullable
              as String,
      privateKey: freezed == privateKey
          ? _value.privateKey
          : privateKey // ignore: cast_nullable_to_non_nullable
              as String?,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      friendlyName: freezed == friendlyName
          ? _value.friendlyName
          : friendlyName // ignore: cast_nullable_to_non_nullable
              as String?,
      balance: null == balance
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as double,
      isValidating: null == isValidating
          ? _value.isValidating
          : isValidating // ignore: cast_nullable_to_non_nullable
              as bool,
      adnr: freezed == adnr
          ? _value.adnr
          : adnr // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Wallet extends _Wallet {
  _$_Wallet(
      {@JsonKey(name: 'Id') required this.id,
      @JsonKey(name: 'PublicKey') required this.publicKey,
      @JsonKey(name: 'GetKey') this.privateKey,
      @JsonKey(name: 'Address') required this.address,
      this.friendlyName,
      @JsonKey(name: 'Balance') required this.balance,
      @JsonKey(name: 'IsValidating') required this.isValidating,
      @JsonKey(name: "ADNR") this.adnr})
      : super._();

  factory _$_Wallet.fromJson(Map<String, dynamic> json) =>
      _$$_WalletFromJson(json);

  @override
  @JsonKey(name: 'Id')
  final int id;
  @override
  @JsonKey(name: 'PublicKey')
  final String publicKey;
  @override
  @JsonKey(name: 'GetKey')
  final String? privateKey;
  @override
  @JsonKey(name: 'Address')
  final String address;
  @override
  final String? friendlyName;
  @override
  @JsonKey(name: 'Balance')
  final double balance;
  @override
  @JsonKey(name: 'IsValidating')
  final bool isValidating;
// @JsonKey(name: 'IsEncrypted') required bool isEncrypted,
  @override
  @JsonKey(name: "ADNR")
  final String? adnr;

  @override
  String toString() {
    return 'Wallet(id: $id, publicKey: $publicKey, privateKey: $privateKey, address: $address, friendlyName: $friendlyName, balance: $balance, isValidating: $isValidating, adnr: $adnr)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Wallet &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.publicKey, publicKey) ||
                other.publicKey == publicKey) &&
            (identical(other.privateKey, privateKey) ||
                other.privateKey == privateKey) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.friendlyName, friendlyName) ||
                other.friendlyName == friendlyName) &&
            (identical(other.balance, balance) || other.balance == balance) &&
            (identical(other.isValidating, isValidating) ||
                other.isValidating == isValidating) &&
            (identical(other.adnr, adnr) || other.adnr == adnr));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, publicKey, privateKey,
      address, friendlyName, balance, isValidating, adnr);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_WalletCopyWith<_$_Wallet> get copyWith =>
      __$$_WalletCopyWithImpl<_$_Wallet>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_WalletToJson(
      this,
    );
  }
}

abstract class _Wallet extends Wallet {
  factory _Wallet(
      {@JsonKey(name: 'Id') required final int id,
      @JsonKey(name: 'PublicKey') required final String publicKey,
      @JsonKey(name: 'GetKey') final String? privateKey,
      @JsonKey(name: 'Address') required final String address,
      final String? friendlyName,
      @JsonKey(name: 'Balance') required final double balance,
      @JsonKey(name: 'IsValidating') required final bool isValidating,
      @JsonKey(name: "ADNR") final String? adnr}) = _$_Wallet;
  _Wallet._() : super._();

  factory _Wallet.fromJson(Map<String, dynamic> json) = _$_Wallet.fromJson;

  @override
  @JsonKey(name: 'Id')
  int get id;
  @override
  @JsonKey(name: 'PublicKey')
  String get publicKey;
  @override
  @JsonKey(name: 'GetKey')
  String? get privateKey;
  @override
  @JsonKey(name: 'Address')
  String get address;
  @override
  String? get friendlyName;
  @override
  @JsonKey(name: 'Balance')
  double get balance;
  @override
  @JsonKey(name: 'IsValidating')
  bool get isValidating;
  @override // @JsonKey(name: 'IsEncrypted') required bool isEncrypted,
  @JsonKey(name: "ADNR")
  String? get adnr;
  @override
  @JsonKey(ignore: true)
  _$$_WalletCopyWith<_$_Wallet> get copyWith =>
      throw _privateConstructorUsedError;
}
