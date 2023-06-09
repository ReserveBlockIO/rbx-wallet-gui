// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

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
  @JsonKey(name: "balance_total")
  double get balanceTotal => throw _privateConstructorUsedError;
  @JsonKey(name: "balance_locked")
  double get balanceLocked => throw _privateConstructorUsedError;
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
      _$WebAddressCopyWithImpl<$Res, WebAddress>;
  @useResult
  $Res call(
      {String address,
      double balance,
      @JsonKey(name: "balance_total") double balanceTotal,
      @JsonKey(name: "balance_locked") double balanceLocked,
      String? adnr});
}

/// @nodoc
class _$WebAddressCopyWithImpl<$Res, $Val extends WebAddress>
    implements $WebAddressCopyWith<$Res> {
  _$WebAddressCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? address = null,
    Object? balance = null,
    Object? balanceTotal = null,
    Object? balanceLocked = null,
    Object? adnr = freezed,
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
      balanceTotal: null == balanceTotal
          ? _value.balanceTotal
          : balanceTotal // ignore: cast_nullable_to_non_nullable
              as double,
      balanceLocked: null == balanceLocked
          ? _value.balanceLocked
          : balanceLocked // ignore: cast_nullable_to_non_nullable
              as double,
      adnr: freezed == adnr
          ? _value.adnr
          : adnr // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_WebAddressCopyWith<$Res>
    implements $WebAddressCopyWith<$Res> {
  factory _$$_WebAddressCopyWith(
          _$_WebAddress value, $Res Function(_$_WebAddress) then) =
      __$$_WebAddressCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String address,
      double balance,
      @JsonKey(name: "balance_total") double balanceTotal,
      @JsonKey(name: "balance_locked") double balanceLocked,
      String? adnr});
}

/// @nodoc
class __$$_WebAddressCopyWithImpl<$Res>
    extends _$WebAddressCopyWithImpl<$Res, _$_WebAddress>
    implements _$$_WebAddressCopyWith<$Res> {
  __$$_WebAddressCopyWithImpl(
      _$_WebAddress _value, $Res Function(_$_WebAddress) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? address = null,
    Object? balance = null,
    Object? balanceTotal = null,
    Object? balanceLocked = null,
    Object? adnr = freezed,
  }) {
    return _then(_$_WebAddress(
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      balance: null == balance
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as double,
      balanceTotal: null == balanceTotal
          ? _value.balanceTotal
          : balanceTotal // ignore: cast_nullable_to_non_nullable
              as double,
      balanceLocked: null == balanceLocked
          ? _value.balanceLocked
          : balanceLocked // ignore: cast_nullable_to_non_nullable
              as double,
      adnr: freezed == adnr
          ? _value.adnr
          : adnr // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_WebAddress extends _WebAddress {
  _$_WebAddress(
      {required this.address,
      required this.balance,
      @JsonKey(name: "balance_total") this.balanceTotal = 0,
      @JsonKey(name: "balance_locked") this.balanceLocked = 0,
      this.adnr})
      : super._();

  factory _$_WebAddress.fromJson(Map<String, dynamic> json) =>
      _$$_WebAddressFromJson(json);

  @override
  final String address;
  @override
  final double balance;
  @override
  @JsonKey(name: "balance_total")
  final double balanceTotal;
  @override
  @JsonKey(name: "balance_locked")
  final double balanceLocked;
  @override
  final String? adnr;

  @override
  String toString() {
    return 'WebAddress(address: $address, balance: $balance, balanceTotal: $balanceTotal, balanceLocked: $balanceLocked, adnr: $adnr)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_WebAddress &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.balance, balance) || other.balance == balance) &&
            (identical(other.balanceTotal, balanceTotal) ||
                other.balanceTotal == balanceTotal) &&
            (identical(other.balanceLocked, balanceLocked) ||
                other.balanceLocked == balanceLocked) &&
            (identical(other.adnr, adnr) || other.adnr == adnr));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, address, balance, balanceTotal, balanceLocked, adnr);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_WebAddressCopyWith<_$_WebAddress> get copyWith =>
      __$$_WebAddressCopyWithImpl<_$_WebAddress>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_WebAddressToJson(
      this,
    );
  }
}

abstract class _WebAddress extends WebAddress {
  factory _WebAddress(
      {required final String address,
      required final double balance,
      @JsonKey(name: "balance_total") final double balanceTotal,
      @JsonKey(name: "balance_locked") final double balanceLocked,
      final String? adnr}) = _$_WebAddress;
  _WebAddress._() : super._();

  factory _WebAddress.fromJson(Map<String, dynamic> json) =
      _$_WebAddress.fromJson;

  @override
  String get address;
  @override
  double get balance;
  @override
  @JsonKey(name: "balance_total")
  double get balanceTotal;
  @override
  @JsonKey(name: "balance_locked")
  double get balanceLocked;
  @override
  String? get adnr;
  @override
  @JsonKey(ignore: true)
  _$$_WebAddressCopyWith<_$_WebAddress> get copyWith =>
      throw _privateConstructorUsedError;
}
