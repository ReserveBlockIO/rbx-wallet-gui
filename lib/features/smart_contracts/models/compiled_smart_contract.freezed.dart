// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'compiled_smart_contract.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CompiledSmartContract _$CompiledSmartContractFromJson(
    Map<String, dynamic> json) {
  return _CompiledSmartContract.fromJson(json);
}

/// @nodoc
class _$CompiledSmartContractTearOff {
  const _$CompiledSmartContractTearOff();

  _CompiledSmartContract call(
      {@JsonKey(name: "Success") required bool success}) {
    return _CompiledSmartContract(
      success: success,
    );
  }

  CompiledSmartContract fromJson(Map<String, Object?> json) {
    return CompiledSmartContract.fromJson(json);
  }
}

/// @nodoc
const $CompiledSmartContract = _$CompiledSmartContractTearOff();

/// @nodoc
mixin _$CompiledSmartContract {
// @JsonKey(name: "SmartContractCode") required String code,
  @JsonKey(name: "Success")
  bool get success => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CompiledSmartContractCopyWith<CompiledSmartContract> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CompiledSmartContractCopyWith<$Res> {
  factory $CompiledSmartContractCopyWith(CompiledSmartContract value,
          $Res Function(CompiledSmartContract) then) =
      _$CompiledSmartContractCopyWithImpl<$Res>;
  $Res call({@JsonKey(name: "Success") bool success});
}

/// @nodoc
class _$CompiledSmartContractCopyWithImpl<$Res>
    implements $CompiledSmartContractCopyWith<$Res> {
  _$CompiledSmartContractCopyWithImpl(this._value, this._then);

  final CompiledSmartContract _value;
  // ignore: unused_field
  final $Res Function(CompiledSmartContract) _then;

  @override
  $Res call({
    Object? success = freezed,
  }) {
    return _then(_value.copyWith(
      success: success == freezed
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$CompiledSmartContractCopyWith<$Res>
    implements $CompiledSmartContractCopyWith<$Res> {
  factory _$CompiledSmartContractCopyWith(_CompiledSmartContract value,
          $Res Function(_CompiledSmartContract) then) =
      __$CompiledSmartContractCopyWithImpl<$Res>;
  @override
  $Res call({@JsonKey(name: "Success") bool success});
}

/// @nodoc
class __$CompiledSmartContractCopyWithImpl<$Res>
    extends _$CompiledSmartContractCopyWithImpl<$Res>
    implements _$CompiledSmartContractCopyWith<$Res> {
  __$CompiledSmartContractCopyWithImpl(_CompiledSmartContract _value,
      $Res Function(_CompiledSmartContract) _then)
      : super(_value, (v) => _then(v as _CompiledSmartContract));

  @override
  _CompiledSmartContract get _value => super._value as _CompiledSmartContract;

  @override
  $Res call({
    Object? success = freezed,
  }) {
    return _then(_CompiledSmartContract(
      success: success == freezed
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CompiledSmartContract extends _CompiledSmartContract {
  _$_CompiledSmartContract({@JsonKey(name: "Success") required this.success})
      : super._();

  factory _$_CompiledSmartContract.fromJson(Map<String, dynamic> json) =>
      _$$_CompiledSmartContractFromJson(json);

  @override // @JsonKey(name: "SmartContractCode") required String code,
  @JsonKey(name: "Success")
  final bool success;

  @override
  String toString() {
    return 'CompiledSmartContract(success: $success)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CompiledSmartContract &&
            const DeepCollectionEquality().equals(other.success, success));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(success));

  @JsonKey(ignore: true)
  @override
  _$CompiledSmartContractCopyWith<_CompiledSmartContract> get copyWith =>
      __$CompiledSmartContractCopyWithImpl<_CompiledSmartContract>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CompiledSmartContractToJson(this);
  }
}

abstract class _CompiledSmartContract extends CompiledSmartContract {
  factory _CompiledSmartContract(
          {@JsonKey(name: "Success") required bool success}) =
      _$_CompiledSmartContract;
  _CompiledSmartContract._() : super._();

  factory _CompiledSmartContract.fromJson(Map<String, dynamic> json) =
      _$_CompiledSmartContract.fromJson;

  @override // @JsonKey(name: "SmartContractCode") required String code,
  @JsonKey(name: "Success")
  bool get success;
  @override
  @JsonKey(ignore: true)
  _$CompiledSmartContractCopyWith<_CompiledSmartContract> get copyWith =>
      throw _privateConstructorUsedError;
}
