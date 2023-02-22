// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'web_address.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

WebAddress _$WebAddressFromJson(Map<String, dynamic> json) {
  return _WebAddress.fromJson(json);
}

/// @nodoc
mixin _$WebAddress {
  String get address => throw _privateConstructorUsedError;
  double get balance => throw _privateConstructorUsedError;
  String? get adnr => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WebAddressCopyWith<WebAddress> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WebAddressCopyWith<$Res> {
  factory $WebAddressCopyWith(
          WebAddress value, $Res Function(WebAddress) then) =
      _$WebAddressCopyWithImpl<$Res>;
  $Res call({String address, double balance, String? adnr});
}

/// @nodoc
class _$WebAddressCopyWithImpl<$Res> implements $WebAddressCopyWith<$Res> {
  _$WebAddressCopyWithImpl(this._value, this._then);

  final WebAddress _value;
  // ignore: unused_field
  final $Res Function(WebAddress) _then;

  @override
  $Res call({
    Object? address = freezed,
    Object? balance = freezed,
    Object? adnr = freezed,
  }) {
    return _then(_value.copyWith(
      address: address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      balance: balance == freezed
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as double,
      adnr: adnr == freezed
          ? _value.adnr
          : adnr // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_WebAddressCopyWith<$Res>
    implements $WebAddressCopyWith<$Res> {
  factory _$$_WebAddressCopyWith(
          _$_WebAddress value, $Res Function(_$_WebAddress) then) =
      __$$_WebAddressCopyWithImpl<$Res>;
  @override
  $Res call({String address, double balance, String? adnr});
}

/// @nodoc
class __$$_WebAddressCopyWithImpl<$Res> extends _$WebAddressCopyWithImpl<$Res>
    implements _$$_WebAddressCopyWith<$Res> {
  __$$_WebAddressCopyWithImpl(
      _$_WebAddress _value, $Res Function(_$_WebAddress) _then)
      : super(_value, (v) => _then(v as _$_WebAddress));

  @override
  _$_WebAddress get _value => super._value as _$_WebAddress;

  @override
  $Res call({
    Object? address = freezed,
    Object? balance = freezed,
    Object? adnr = freezed,
  }) {
    return _then(_$_WebAddress(
      address: address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      balance: balance == freezed
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as double,
      adnr: adnr == freezed
          ? _value.adnr
          : adnr // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_WebAddress extends _WebAddress {
  _$_WebAddress({required this.address, required this.balance, this.adnr})
      : super._();

  factory _$_WebAddress.fromJson(Map<String, dynamic> json) =>
      _$$_WebAddressFromJson(json);

  @override
  final String address;
  @override
  final double balance;
  @override
  final String? adnr;

  @override
  String toString() {
    return 'WebAddress(address: $address, balance: $balance, adnr: $adnr)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_WebAddress &&
            const DeepCollectionEquality().equals(other.address, address) &&
            const DeepCollectionEquality().equals(other.balance, balance) &&
            const DeepCollectionEquality().equals(other.adnr, adnr));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(address),
      const DeepCollectionEquality().hash(balance),
      const DeepCollectionEquality().hash(adnr));

  @JsonKey(ignore: true)
  @override
  _$$_WebAddressCopyWith<_$_WebAddress> get copyWith =>
      __$$_WebAddressCopyWithImpl<_$_WebAddress>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_WebAddressToJson(this);
  }
}

abstract class _WebAddress extends WebAddress {
  factory _WebAddress(
      {required final String address,
      required final double balance,
      final String? adnr}) = _$_WebAddress;
  _WebAddress._() : super._();

  factory _WebAddress.fromJson(Map<String, dynamic> json) =
      _$_WebAddress.fromJson;

  @override
  String get address => throw _privateConstructorUsedError;
  @override
  double get balance => throw _privateConstructorUsedError;
  @override
  String? get adnr => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_WebAddressCopyWith<_$_WebAddress> get copyWith =>
      throw _privateConstructorUsedError;
}
