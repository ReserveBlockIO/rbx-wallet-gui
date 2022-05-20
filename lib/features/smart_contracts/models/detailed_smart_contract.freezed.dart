// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'detailed_smart_contract.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DetailedSmartContract _$DetailedSmartContractFromJson(
    Map<String, dynamic> json) {
  return _DetailedSmartContract.fromJson(json);
}

/// @nodoc
class _$DetailedSmartContractTearOff {
  const _$DetailedSmartContractTearOff();

  _DetailedSmartContract call(
      {@JsonKey(name: "SmartContract")
          required CompiledSmartContract smartContract,
      @JsonKey(name: "SmartContractCode", defaultValue: "")
          required String code}) {
    return _DetailedSmartContract(
      smartContract: smartContract,
      code: code,
    );
  }

  DetailedSmartContract fromJson(Map<String, Object?> json) {
    return DetailedSmartContract.fromJson(json);
  }
}

/// @nodoc
const $DetailedSmartContract = _$DetailedSmartContractTearOff();

/// @nodoc
mixin _$DetailedSmartContract {
  @JsonKey(name: "SmartContract")
  CompiledSmartContract get smartContract => throw _privateConstructorUsedError;
  @JsonKey(name: "SmartContractCode", defaultValue: "")
  String get code => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DetailedSmartContractCopyWith<DetailedSmartContract> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DetailedSmartContractCopyWith<$Res> {
  factory $DetailedSmartContractCopyWith(DetailedSmartContract value,
          $Res Function(DetailedSmartContract) then) =
      _$DetailedSmartContractCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: "SmartContract") CompiledSmartContract smartContract,
      @JsonKey(name: "SmartContractCode", defaultValue: "") String code});

  $CompiledSmartContractCopyWith<$Res> get smartContract;
}

/// @nodoc
class _$DetailedSmartContractCopyWithImpl<$Res>
    implements $DetailedSmartContractCopyWith<$Res> {
  _$DetailedSmartContractCopyWithImpl(this._value, this._then);

  final DetailedSmartContract _value;
  // ignore: unused_field
  final $Res Function(DetailedSmartContract) _then;

  @override
  $Res call({
    Object? smartContract = freezed,
    Object? code = freezed,
  }) {
    return _then(_value.copyWith(
      smartContract: smartContract == freezed
          ? _value.smartContract
          : smartContract // ignore: cast_nullable_to_non_nullable
              as CompiledSmartContract,
      code: code == freezed
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }

  @override
  $CompiledSmartContractCopyWith<$Res> get smartContract {
    return $CompiledSmartContractCopyWith<$Res>(_value.smartContract, (value) {
      return _then(_value.copyWith(smartContract: value));
    });
  }
}

/// @nodoc
abstract class _$DetailedSmartContractCopyWith<$Res>
    implements $DetailedSmartContractCopyWith<$Res> {
  factory _$DetailedSmartContractCopyWith(_DetailedSmartContract value,
          $Res Function(_DetailedSmartContract) then) =
      __$DetailedSmartContractCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: "SmartContract") CompiledSmartContract smartContract,
      @JsonKey(name: "SmartContractCode", defaultValue: "") String code});

  @override
  $CompiledSmartContractCopyWith<$Res> get smartContract;
}

/// @nodoc
class __$DetailedSmartContractCopyWithImpl<$Res>
    extends _$DetailedSmartContractCopyWithImpl<$Res>
    implements _$DetailedSmartContractCopyWith<$Res> {
  __$DetailedSmartContractCopyWithImpl(_DetailedSmartContract _value,
      $Res Function(_DetailedSmartContract) _then)
      : super(_value, (v) => _then(v as _DetailedSmartContract));

  @override
  _DetailedSmartContract get _value => super._value as _DetailedSmartContract;

  @override
  $Res call({
    Object? smartContract = freezed,
    Object? code = freezed,
  }) {
    return _then(_DetailedSmartContract(
      smartContract: smartContract == freezed
          ? _value.smartContract
          : smartContract // ignore: cast_nullable_to_non_nullable
              as CompiledSmartContract,
      code: code == freezed
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DetailedSmartContract extends _DetailedSmartContract {
  _$_DetailedSmartContract(
      {@JsonKey(name: "SmartContract") required this.smartContract,
      @JsonKey(name: "SmartContractCode", defaultValue: "") required this.code})
      : super._();

  factory _$_DetailedSmartContract.fromJson(Map<String, dynamic> json) =>
      _$$_DetailedSmartContractFromJson(json);

  @override
  @JsonKey(name: "SmartContract")
  final CompiledSmartContract smartContract;
  @override
  @JsonKey(name: "SmartContractCode", defaultValue: "")
  final String code;

  @override
  String toString() {
    return 'DetailedSmartContract(smartContract: $smartContract, code: $code)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DetailedSmartContract &&
            const DeepCollectionEquality()
                .equals(other.smartContract, smartContract) &&
            const DeepCollectionEquality().equals(other.code, code));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(smartContract),
      const DeepCollectionEquality().hash(code));

  @JsonKey(ignore: true)
  @override
  _$DetailedSmartContractCopyWith<_DetailedSmartContract> get copyWith =>
      __$DetailedSmartContractCopyWithImpl<_DetailedSmartContract>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DetailedSmartContractToJson(this);
  }
}

abstract class _DetailedSmartContract extends DetailedSmartContract {
  factory _DetailedSmartContract(
      {@JsonKey(name: "SmartContract")
          required CompiledSmartContract smartContract,
      @JsonKey(name: "SmartContractCode", defaultValue: "")
          required String code}) = _$_DetailedSmartContract;
  _DetailedSmartContract._() : super._();

  factory _DetailedSmartContract.fromJson(Map<String, dynamic> json) =
      _$_DetailedSmartContract.fromJson;

  @override
  @JsonKey(name: "SmartContract")
  CompiledSmartContract get smartContract;
  @override
  @JsonKey(name: "SmartContractCode", defaultValue: "")
  String get code;
  @override
  @JsonKey(ignore: true)
  _$DetailedSmartContractCopyWith<_DetailedSmartContract> get copyWith =>
      throw _privateConstructorUsedError;
}
