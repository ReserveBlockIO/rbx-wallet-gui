// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

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
  @JsonKey(name: 'PrivateKey')
  String get privateKey => throw _privateConstructorUsedError;
  @JsonKey(name: 'Address')
  String get address => throw _privateConstructorUsedError;
  String? get friendlyName => throw _privateConstructorUsedError;
  @JsonKey(name: 'Balance')
  double get balance => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsValidating')
  bool get isValidating => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WalletCopyWith<Wallet> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WalletCopyWith<$Res> {
  factory $WalletCopyWith(Wallet value, $Res Function(Wallet) then) =
      _$WalletCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'Id') int id,
      @JsonKey(name: 'PublicKey') String publicKey,
      @JsonKey(name: 'PrivateKey') String privateKey,
      @JsonKey(name: 'Address') String address,
      String? friendlyName,
      @JsonKey(name: 'Balance') double balance,
      @JsonKey(name: 'IsValidating') bool isValidating});
}

/// @nodoc
class _$WalletCopyWithImpl<$Res> implements $WalletCopyWith<$Res> {
  _$WalletCopyWithImpl(this._value, this._then);

  final Wallet _value;
  // ignore: unused_field
  final $Res Function(Wallet) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? publicKey = freezed,
    Object? privateKey = freezed,
    Object? address = freezed,
    Object? friendlyName = freezed,
    Object? balance = freezed,
    Object? isValidating = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      publicKey: publicKey == freezed
          ? _value.publicKey
          : publicKey // ignore: cast_nullable_to_non_nullable
              as String,
      privateKey: privateKey == freezed
          ? _value.privateKey
          : privateKey // ignore: cast_nullable_to_non_nullable
              as String,
      address: address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      friendlyName: friendlyName == freezed
          ? _value.friendlyName
          : friendlyName // ignore: cast_nullable_to_non_nullable
              as String?,
      balance: balance == freezed
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as double,
      isValidating: isValidating == freezed
          ? _value.isValidating
          : isValidating // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$$_WalletCopyWith<$Res> implements $WalletCopyWith<$Res> {
  factory _$$_WalletCopyWith(_$_Wallet value, $Res Function(_$_Wallet) then) =
      __$$_WalletCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'Id') int id,
      @JsonKey(name: 'PublicKey') String publicKey,
      @JsonKey(name: 'PrivateKey') String privateKey,
      @JsonKey(name: 'Address') String address,
      String? friendlyName,
      @JsonKey(name: 'Balance') double balance,
      @JsonKey(name: 'IsValidating') bool isValidating});
}

/// @nodoc
class __$$_WalletCopyWithImpl<$Res> extends _$WalletCopyWithImpl<$Res>
    implements _$$_WalletCopyWith<$Res> {
  __$$_WalletCopyWithImpl(_$_Wallet _value, $Res Function(_$_Wallet) _then)
      : super(_value, (v) => _then(v as _$_Wallet));

  @override
  _$_Wallet get _value => super._value as _$_Wallet;

  @override
  $Res call({
    Object? id = freezed,
    Object? publicKey = freezed,
    Object? privateKey = freezed,
    Object? address = freezed,
    Object? friendlyName = freezed,
    Object? balance = freezed,
    Object? isValidating = freezed,
  }) {
    return _then(_$_Wallet(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      publicKey: publicKey == freezed
          ? _value.publicKey
          : publicKey // ignore: cast_nullable_to_non_nullable
              as String,
      privateKey: privateKey == freezed
          ? _value.privateKey
          : privateKey // ignore: cast_nullable_to_non_nullable
              as String,
      address: address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      friendlyName: friendlyName == freezed
          ? _value.friendlyName
          : friendlyName // ignore: cast_nullable_to_non_nullable
              as String?,
      balance: balance == freezed
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as double,
      isValidating: isValidating == freezed
          ? _value.isValidating
          : isValidating // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Wallet extends _Wallet {
  _$_Wallet(
      {@JsonKey(name: 'Id') required this.id,
      @JsonKey(name: 'PublicKey') required this.publicKey,
      @JsonKey(name: 'PrivateKey') required this.privateKey,
      @JsonKey(name: 'Address') required this.address,
      this.friendlyName,
      @JsonKey(name: 'Balance') required this.balance,
      @JsonKey(name: 'IsValidating') required this.isValidating})
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
  @JsonKey(name: 'PrivateKey')
  final String privateKey;
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

  @override
  String toString() {
    return 'Wallet(id: $id, publicKey: $publicKey, privateKey: $privateKey, address: $address, friendlyName: $friendlyName, balance: $balance, isValidating: $isValidating)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Wallet &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.publicKey, publicKey) &&
            const DeepCollectionEquality()
                .equals(other.privateKey, privateKey) &&
            const DeepCollectionEquality().equals(other.address, address) &&
            const DeepCollectionEquality()
                .equals(other.friendlyName, friendlyName) &&
            const DeepCollectionEquality().equals(other.balance, balance) &&
            const DeepCollectionEquality()
                .equals(other.isValidating, isValidating));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(publicKey),
      const DeepCollectionEquality().hash(privateKey),
      const DeepCollectionEquality().hash(address),
      const DeepCollectionEquality().hash(friendlyName),
      const DeepCollectionEquality().hash(balance),
      const DeepCollectionEquality().hash(isValidating));

  @JsonKey(ignore: true)
  @override
  _$$_WalletCopyWith<_$_Wallet> get copyWith =>
      __$$_WalletCopyWithImpl<_$_Wallet>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_WalletToJson(this);
  }
}

abstract class _Wallet extends Wallet {
  factory _Wallet(
          {@JsonKey(name: 'Id') required final int id,
          @JsonKey(name: 'PublicKey') required final String publicKey,
          @JsonKey(name: 'PrivateKey') required final String privateKey,
          @JsonKey(name: 'Address') required final String address,
          final String? friendlyName,
          @JsonKey(name: 'Balance') required final double balance,
          @JsonKey(name: 'IsValidating') required final bool isValidating}) =
      _$_Wallet;
  _Wallet._() : super._();

  factory _Wallet.fromJson(Map<String, dynamic> json) = _$_Wallet.fromJson;

  @override
  @JsonKey(name: 'Id')
  int get id => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'PublicKey')
  String get publicKey => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'PrivateKey')
  String get privateKey => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'Address')
  String get address => throw _privateConstructorUsedError;
  @override
  String? get friendlyName => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'Balance')
  double get balance => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'IsValidating')
  bool get isValidating => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_WalletCopyWith<_$_Wallet> get copyWith =>
      throw _privateConstructorUsedError;
}
