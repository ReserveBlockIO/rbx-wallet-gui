// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'compiler_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CompilerResponse _$CompilerResponseFromJson(Map<String, dynamic> json) {
  return _CompilerResponse.fromJson(json);
}

/// @nodoc
class _$CompilerResponseTearOff {
  const _$CompilerResponseTearOff();

  _CompilerResponse call(
      {@JsonKey(name: "Success")
          required bool success,
      @JsonKey(name: "SmartContractCode")
          required String code,
      @JsonKey(name: "SmartContractMain")
          required CompiledSmartContract smartContract}) {
    return _CompilerResponse(
      success: success,
      code: code,
      smartContract: smartContract,
    );
  }

  CompilerResponse fromJson(Map<String, Object?> json) {
    return CompilerResponse.fromJson(json);
  }
}

/// @nodoc
const $CompilerResponse = _$CompilerResponseTearOff();

/// @nodoc
mixin _$CompilerResponse {
  @JsonKey(name: "Success")
  bool get success => throw _privateConstructorUsedError;
  @JsonKey(name: "SmartContractCode")
  String get code => throw _privateConstructorUsedError;
  @JsonKey(name: "SmartContractMain")
  CompiledSmartContract get smartContract => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CompilerResponseCopyWith<CompilerResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CompilerResponseCopyWith<$Res> {
  factory $CompilerResponseCopyWith(
          CompilerResponse value, $Res Function(CompilerResponse) then) =
      _$CompilerResponseCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: "Success") bool success,
      @JsonKey(name: "SmartContractCode") String code,
      @JsonKey(name: "SmartContractMain") CompiledSmartContract smartContract});

  $CompiledSmartContractCopyWith<$Res> get smartContract;
}

/// @nodoc
class _$CompilerResponseCopyWithImpl<$Res>
    implements $CompilerResponseCopyWith<$Res> {
  _$CompilerResponseCopyWithImpl(this._value, this._then);

  final CompilerResponse _value;
  // ignore: unused_field
  final $Res Function(CompilerResponse) _then;

  @override
  $Res call({
    Object? success = freezed,
    Object? code = freezed,
    Object? smartContract = freezed,
  }) {
    return _then(_value.copyWith(
      success: success == freezed
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      code: code == freezed
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      smartContract: smartContract == freezed
          ? _value.smartContract
          : smartContract // ignore: cast_nullable_to_non_nullable
              as CompiledSmartContract,
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
abstract class _$CompilerResponseCopyWith<$Res>
    implements $CompilerResponseCopyWith<$Res> {
  factory _$CompilerResponseCopyWith(
          _CompilerResponse value, $Res Function(_CompilerResponse) then) =
      __$CompilerResponseCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: "Success") bool success,
      @JsonKey(name: "SmartContractCode") String code,
      @JsonKey(name: "SmartContractMain") CompiledSmartContract smartContract});

  @override
  $CompiledSmartContractCopyWith<$Res> get smartContract;
}

/// @nodoc
class __$CompilerResponseCopyWithImpl<$Res>
    extends _$CompilerResponseCopyWithImpl<$Res>
    implements _$CompilerResponseCopyWith<$Res> {
  __$CompilerResponseCopyWithImpl(
      _CompilerResponse _value, $Res Function(_CompilerResponse) _then)
      : super(_value, (v) => _then(v as _CompilerResponse));

  @override
  _CompilerResponse get _value => super._value as _CompilerResponse;

  @override
  $Res call({
    Object? success = freezed,
    Object? code = freezed,
    Object? smartContract = freezed,
  }) {
    return _then(_CompilerResponse(
      success: success == freezed
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      code: code == freezed
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      smartContract: smartContract == freezed
          ? _value.smartContract
          : smartContract // ignore: cast_nullable_to_non_nullable
              as CompiledSmartContract,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CompilerResponse extends _CompilerResponse {
  _$_CompilerResponse(
      {@JsonKey(name: "Success") required this.success,
      @JsonKey(name: "SmartContractCode") required this.code,
      @JsonKey(name: "SmartContractMain") required this.smartContract})
      : super._();

  factory _$_CompilerResponse.fromJson(Map<String, dynamic> json) =>
      _$$_CompilerResponseFromJson(json);

  @override
  @JsonKey(name: "Success")
  final bool success;
  @override
  @JsonKey(name: "SmartContractCode")
  final String code;
  @override
  @JsonKey(name: "SmartContractMain")
  final CompiledSmartContract smartContract;

  @override
  String toString() {
    return 'CompilerResponse(success: $success, code: $code, smartContract: $smartContract)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CompilerResponse &&
            const DeepCollectionEquality().equals(other.success, success) &&
            const DeepCollectionEquality().equals(other.code, code) &&
            const DeepCollectionEquality()
                .equals(other.smartContract, smartContract));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(success),
      const DeepCollectionEquality().hash(code),
      const DeepCollectionEquality().hash(smartContract));

  @JsonKey(ignore: true)
  @override
  _$CompilerResponseCopyWith<_CompilerResponse> get copyWith =>
      __$CompilerResponseCopyWithImpl<_CompilerResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CompilerResponseToJson(this);
  }
}

abstract class _CompilerResponse extends CompilerResponse {
  factory _CompilerResponse(
      {@JsonKey(name: "Success")
          required bool success,
      @JsonKey(name: "SmartContractCode")
          required String code,
      @JsonKey(name: "SmartContractMain")
          required CompiledSmartContract smartContract}) = _$_CompilerResponse;
  _CompilerResponse._() : super._();

  factory _CompilerResponse.fromJson(Map<String, dynamic> json) =
      _$_CompilerResponse.fromJson;

  @override
  @JsonKey(name: "Success")
  bool get success;
  @override
  @JsonKey(name: "SmartContractCode")
  String get code;
  @override
  @JsonKey(name: "SmartContractMain")
  CompiledSmartContract get smartContract;
  @override
  @JsonKey(ignore: true)
  _$CompilerResponseCopyWith<_CompilerResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
