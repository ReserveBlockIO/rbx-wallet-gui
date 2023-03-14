// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'new_reserve_account.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

NewReserveAccount _$NewReserveAccountFromJson(Map<String, dynamic> json) {
  return _NewReserveAccount.fromJson(json);
}

/// @nodoc
mixin _$NewReserveAccount {
  @JsonKey(name: "PrivateKey")
  String get privateKey => throw _privateConstructorUsedError;
  @JsonKey(name: "Address")
  String get address => throw _privateConstructorUsedError;
  @JsonKey(name: "RecoveryAddress")
  String get recoveryAddress => throw _privateConstructorUsedError;
  @JsonKey(name: "RecoveryPrivateKey")
  String get recoveryPrivateKey => throw _privateConstructorUsedError;
  @JsonKey(name: "RestoreCode")
  String get restoreCode => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NewReserveAccountCopyWith<NewReserveAccount> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewReserveAccountCopyWith<$Res> {
  factory $NewReserveAccountCopyWith(
          NewReserveAccount value, $Res Function(NewReserveAccount) then) =
      _$NewReserveAccountCopyWithImpl<$Res, NewReserveAccount>;
  @useResult
  $Res call(
      {@JsonKey(name: "PrivateKey") String privateKey,
      @JsonKey(name: "Address") String address,
      @JsonKey(name: "RecoveryAddress") String recoveryAddress,
      @JsonKey(name: "RecoveryPrivateKey") String recoveryPrivateKey,
      @JsonKey(name: "RestoreCode") String restoreCode});
}

/// @nodoc
class _$NewReserveAccountCopyWithImpl<$Res, $Val extends NewReserveAccount>
    implements $NewReserveAccountCopyWith<$Res> {
  _$NewReserveAccountCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? privateKey = null,
    Object? address = null,
    Object? recoveryAddress = null,
    Object? recoveryPrivateKey = null,
    Object? restoreCode = null,
  }) {
    return _then(_value.copyWith(
      privateKey: null == privateKey
          ? _value.privateKey
          : privateKey // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      recoveryAddress: null == recoveryAddress
          ? _value.recoveryAddress
          : recoveryAddress // ignore: cast_nullable_to_non_nullable
              as String,
      recoveryPrivateKey: null == recoveryPrivateKey
          ? _value.recoveryPrivateKey
          : recoveryPrivateKey // ignore: cast_nullable_to_non_nullable
              as String,
      restoreCode: null == restoreCode
          ? _value.restoreCode
          : restoreCode // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_NewReserveAccountCopyWith<$Res>
    implements $NewReserveAccountCopyWith<$Res> {
  factory _$$_NewReserveAccountCopyWith(_$_NewReserveAccount value,
          $Res Function(_$_NewReserveAccount) then) =
      __$$_NewReserveAccountCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "PrivateKey") String privateKey,
      @JsonKey(name: "Address") String address,
      @JsonKey(name: "RecoveryAddress") String recoveryAddress,
      @JsonKey(name: "RecoveryPrivateKey") String recoveryPrivateKey,
      @JsonKey(name: "RestoreCode") String restoreCode});
}

/// @nodoc
class __$$_NewReserveAccountCopyWithImpl<$Res>
    extends _$NewReserveAccountCopyWithImpl<$Res, _$_NewReserveAccount>
    implements _$$_NewReserveAccountCopyWith<$Res> {
  __$$_NewReserveAccountCopyWithImpl(
      _$_NewReserveAccount _value, $Res Function(_$_NewReserveAccount) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? privateKey = null,
    Object? address = null,
    Object? recoveryAddress = null,
    Object? recoveryPrivateKey = null,
    Object? restoreCode = null,
  }) {
    return _then(_$_NewReserveAccount(
      privateKey: null == privateKey
          ? _value.privateKey
          : privateKey // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      recoveryAddress: null == recoveryAddress
          ? _value.recoveryAddress
          : recoveryAddress // ignore: cast_nullable_to_non_nullable
              as String,
      recoveryPrivateKey: null == recoveryPrivateKey
          ? _value.recoveryPrivateKey
          : recoveryPrivateKey // ignore: cast_nullable_to_non_nullable
              as String,
      restoreCode: null == restoreCode
          ? _value.restoreCode
          : restoreCode // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_NewReserveAccount extends _NewReserveAccount {
  _$_NewReserveAccount(
      {@JsonKey(name: "PrivateKey") required this.privateKey,
      @JsonKey(name: "Address") required this.address,
      @JsonKey(name: "RecoveryAddress") required this.recoveryAddress,
      @JsonKey(name: "RecoveryPrivateKey") required this.recoveryPrivateKey,
      @JsonKey(name: "RestoreCode") required this.restoreCode})
      : super._();

  factory _$_NewReserveAccount.fromJson(Map<String, dynamic> json) =>
      _$$_NewReserveAccountFromJson(json);

  @override
  @JsonKey(name: "PrivateKey")
  final String privateKey;
  @override
  @JsonKey(name: "Address")
  final String address;
  @override
  @JsonKey(name: "RecoveryAddress")
  final String recoveryAddress;
  @override
  @JsonKey(name: "RecoveryPrivateKey")
  final String recoveryPrivateKey;
  @override
  @JsonKey(name: "RestoreCode")
  final String restoreCode;

  @override
  String toString() {
    return 'NewReserveAccount(privateKey: $privateKey, address: $address, recoveryAddress: $recoveryAddress, recoveryPrivateKey: $recoveryPrivateKey, restoreCode: $restoreCode)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NewReserveAccount &&
            (identical(other.privateKey, privateKey) ||
                other.privateKey == privateKey) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.recoveryAddress, recoveryAddress) ||
                other.recoveryAddress == recoveryAddress) &&
            (identical(other.recoveryPrivateKey, recoveryPrivateKey) ||
                other.recoveryPrivateKey == recoveryPrivateKey) &&
            (identical(other.restoreCode, restoreCode) ||
                other.restoreCode == restoreCode));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, privateKey, address,
      recoveryAddress, recoveryPrivateKey, restoreCode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NewReserveAccountCopyWith<_$_NewReserveAccount> get copyWith =>
      __$$_NewReserveAccountCopyWithImpl<_$_NewReserveAccount>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_NewReserveAccountToJson(
      this,
    );
  }
}

abstract class _NewReserveAccount extends NewReserveAccount {
  factory _NewReserveAccount(
      {@JsonKey(name: "PrivateKey")
          required final String privateKey,
      @JsonKey(name: "Address")
          required final String address,
      @JsonKey(name: "RecoveryAddress")
          required final String recoveryAddress,
      @JsonKey(name: "RecoveryPrivateKey")
          required final String recoveryPrivateKey,
      @JsonKey(name: "RestoreCode")
          required final String restoreCode}) = _$_NewReserveAccount;
  _NewReserveAccount._() : super._();

  factory _NewReserveAccount.fromJson(Map<String, dynamic> json) =
      _$_NewReserveAccount.fromJson;

  @override
  @JsonKey(name: "PrivateKey")
  String get privateKey;
  @override
  @JsonKey(name: "Address")
  String get address;
  @override
  @JsonKey(name: "RecoveryAddress")
  String get recoveryAddress;
  @override
  @JsonKey(name: "RecoveryPrivateKey")
  String get recoveryPrivateKey;
  @override
  @JsonKey(name: "RestoreCode")
  String get restoreCode;
  @override
  @JsonKey(ignore: true)
  _$$_NewReserveAccountCopyWith<_$_NewReserveAccount> get copyWith =>
      throw _privateConstructorUsedError;
}
