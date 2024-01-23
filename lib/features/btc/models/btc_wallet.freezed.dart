// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'btc_wallet.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BtcWallet _$BtcWalletFromJson(Map<String, dynamic> json) {
  return _BtcWallet.fromJson(json);
}

/// @nodoc
mixin _$BtcWallet {
  String get privateKey => throw _privateConstructorUsedError;
  String get publicKey => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BtcWalletCopyWith<BtcWallet> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BtcWalletCopyWith<$Res> {
  factory $BtcWalletCopyWith(BtcWallet value, $Res Function(BtcWallet) then) =
      _$BtcWalletCopyWithImpl<$Res, BtcWallet>;
  @useResult
  $Res call({String privateKey, String publicKey, String address});
}

/// @nodoc
class _$BtcWalletCopyWithImpl<$Res, $Val extends BtcWallet>
    implements $BtcWalletCopyWith<$Res> {
  _$BtcWalletCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? privateKey = null,
    Object? publicKey = null,
    Object? address = null,
  }) {
    return _then(_value.copyWith(
      privateKey: null == privateKey
          ? _value.privateKey
          : privateKey // ignore: cast_nullable_to_non_nullable
              as String,
      publicKey: null == publicKey
          ? _value.publicKey
          : publicKey // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_BtcWalletCopyWith<$Res> implements $BtcWalletCopyWith<$Res> {
  factory _$$_BtcWalletCopyWith(
          _$_BtcWallet value, $Res Function(_$_BtcWallet) then) =
      __$$_BtcWalletCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String privateKey, String publicKey, String address});
}

/// @nodoc
class __$$_BtcWalletCopyWithImpl<$Res>
    extends _$BtcWalletCopyWithImpl<$Res, _$_BtcWallet>
    implements _$$_BtcWalletCopyWith<$Res> {
  __$$_BtcWalletCopyWithImpl(
      _$_BtcWallet _value, $Res Function(_$_BtcWallet) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? privateKey = null,
    Object? publicKey = null,
    Object? address = null,
  }) {
    return _then(_$_BtcWallet(
      privateKey: null == privateKey
          ? _value.privateKey
          : privateKey // ignore: cast_nullable_to_non_nullable
              as String,
      publicKey: null == publicKey
          ? _value.publicKey
          : publicKey // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_BtcWallet extends _BtcWallet {
  _$_BtcWallet(
      {required this.privateKey,
      required this.publicKey,
      required this.address})
      : super._();

  factory _$_BtcWallet.fromJson(Map<String, dynamic> json) =>
      _$$_BtcWalletFromJson(json);

  @override
  final String privateKey;
  @override
  final String publicKey;
  @override
  final String address;

  @override
  String toString() {
    return 'BtcWallet(privateKey: $privateKey, publicKey: $publicKey, address: $address)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BtcWallet &&
            (identical(other.privateKey, privateKey) ||
                other.privateKey == privateKey) &&
            (identical(other.publicKey, publicKey) ||
                other.publicKey == publicKey) &&
            (identical(other.address, address) || other.address == address));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, privateKey, publicKey, address);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BtcWalletCopyWith<_$_BtcWallet> get copyWith =>
      __$$_BtcWalletCopyWithImpl<_$_BtcWallet>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BtcWalletToJson(
      this,
    );
  }
}

abstract class _BtcWallet extends BtcWallet {
  factory _BtcWallet(
      {required final String privateKey,
      required final String publicKey,
      required final String address}) = _$_BtcWallet;
  _BtcWallet._() : super._();

  factory _BtcWallet.fromJson(Map<String, dynamic> json) =
      _$_BtcWallet.fromJson;

  @override
  String get privateKey;
  @override
  String get publicKey;
  @override
  String get address;
  @override
  @JsonKey(ignore: true)
  _$$_BtcWalletCopyWith<_$_BtcWallet> get copyWith =>
      throw _privateConstructorUsedError;
}
