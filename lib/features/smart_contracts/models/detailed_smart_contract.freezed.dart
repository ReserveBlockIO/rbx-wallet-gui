// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'detailed_smart_contract.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DetailedSmartContract _$DetailedSmartContractFromJson(
    Map<String, dynamic> json) {
  return _DetailedSmartContract.fromJson(json);
}

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
      _$DetailedSmartContractCopyWithImpl<$Res, DetailedSmartContract>;
  @useResult
  $Res call(
      {@JsonKey(name: "SmartContract") CompiledSmartContract smartContract,
      @JsonKey(name: "SmartContractCode", defaultValue: "") String code});

  $CompiledSmartContractCopyWith<$Res> get smartContract;
}

/// @nodoc
class _$DetailedSmartContractCopyWithImpl<$Res,
        $Val extends DetailedSmartContract>
    implements $DetailedSmartContractCopyWith<$Res> {
  _$DetailedSmartContractCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? smartContract = null,
    Object? code = null,
  }) {
    return _then(_value.copyWith(
      smartContract: null == smartContract
          ? _value.smartContract
          : smartContract // ignore: cast_nullable_to_non_nullable
              as CompiledSmartContract,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CompiledSmartContractCopyWith<$Res> get smartContract {
    return $CompiledSmartContractCopyWith<$Res>(_value.smartContract, (value) {
      return _then(_value.copyWith(smartContract: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_DetailedSmartContractCopyWith<$Res>
    implements $DetailedSmartContractCopyWith<$Res> {
  factory _$$_DetailedSmartContractCopyWith(_$_DetailedSmartContract value,
          $Res Function(_$_DetailedSmartContract) then) =
      __$$_DetailedSmartContractCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "SmartContract") CompiledSmartContract smartContract,
      @JsonKey(name: "SmartContractCode", defaultValue: "") String code});

  @override
  $CompiledSmartContractCopyWith<$Res> get smartContract;
}

/// @nodoc
class __$$_DetailedSmartContractCopyWithImpl<$Res>
    extends _$DetailedSmartContractCopyWithImpl<$Res, _$_DetailedSmartContract>
    implements _$$_DetailedSmartContractCopyWith<$Res> {
  __$$_DetailedSmartContractCopyWithImpl(_$_DetailedSmartContract _value,
      $Res Function(_$_DetailedSmartContract) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? smartContract = null,
    Object? code = null,
  }) {
    return _then(_$_DetailedSmartContract(
      smartContract: null == smartContract
          ? _value.smartContract
          : smartContract // ignore: cast_nullable_to_non_nullable
              as CompiledSmartContract,
      code: null == code
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
            other is _$_DetailedSmartContract &&
            (identical(other.smartContract, smartContract) ||
                other.smartContract == smartContract) &&
            (identical(other.code, code) || other.code == code));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, smartContract, code);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DetailedSmartContractCopyWith<_$_DetailedSmartContract> get copyWith =>
      __$$_DetailedSmartContractCopyWithImpl<_$_DetailedSmartContract>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DetailedSmartContractToJson(
      this,
    );
  }
}

abstract class _DetailedSmartContract extends DetailedSmartContract {
  factory _DetailedSmartContract(
      {@JsonKey(name: "SmartContract")
          required final CompiledSmartContract smartContract,
      @JsonKey(name: "SmartContractCode", defaultValue: "")
          required final String code}) = _$_DetailedSmartContract;
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
  _$$_DetailedSmartContractCopyWith<_$_DetailedSmartContract> get copyWith =>
      throw _privateConstructorUsedError;
}
