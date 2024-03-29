// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'compiler_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CompilerResponse _$CompilerResponseFromJson(Map<String, dynamic> json) {
  return _CompilerResponse.fromJson(json);
}

/// @nodoc
mixin _$CompilerResponse {
  @JsonKey(name: "Success")
  bool get success => throw _privateConstructorUsedError;
  @JsonKey(name: "SmartContractCode")
  String get code => throw _privateConstructorUsedError;
  @JsonKey(name: "SmartContract")
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
      _$CompilerResponseCopyWithImpl<$Res, CompilerResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: "Success") bool success,
      @JsonKey(name: "SmartContractCode") String code,
      @JsonKey(name: "SmartContract") CompiledSmartContract smartContract});

  $CompiledSmartContractCopyWith<$Res> get smartContract;
}

/// @nodoc
class _$CompilerResponseCopyWithImpl<$Res, $Val extends CompilerResponse>
    implements $CompilerResponseCopyWith<$Res> {
  _$CompilerResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? code = null,
    Object? smartContract = null,
  }) {
    return _then(_value.copyWith(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      smartContract: null == smartContract
          ? _value.smartContract
          : smartContract // ignore: cast_nullable_to_non_nullable
              as CompiledSmartContract,
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
abstract class _$$_CompilerResponseCopyWith<$Res>
    implements $CompilerResponseCopyWith<$Res> {
  factory _$$_CompilerResponseCopyWith(
          _$_CompilerResponse value, $Res Function(_$_CompilerResponse) then) =
      __$$_CompilerResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "Success") bool success,
      @JsonKey(name: "SmartContractCode") String code,
      @JsonKey(name: "SmartContract") CompiledSmartContract smartContract});

  @override
  $CompiledSmartContractCopyWith<$Res> get smartContract;
}

/// @nodoc
class __$$_CompilerResponseCopyWithImpl<$Res>
    extends _$CompilerResponseCopyWithImpl<$Res, _$_CompilerResponse>
    implements _$$_CompilerResponseCopyWith<$Res> {
  __$$_CompilerResponseCopyWithImpl(
      _$_CompilerResponse _value, $Res Function(_$_CompilerResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? code = null,
    Object? smartContract = null,
  }) {
    return _then(_$_CompilerResponse(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      smartContract: null == smartContract
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
      @JsonKey(name: "SmartContract") required this.smartContract})
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
  @JsonKey(name: "SmartContract")
  final CompiledSmartContract smartContract;

  @override
  String toString() {
    return 'CompilerResponse(success: $success, code: $code, smartContract: $smartContract)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CompilerResponse &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.smartContract, smartContract) ||
                other.smartContract == smartContract));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, success, code, smartContract);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CompilerResponseCopyWith<_$_CompilerResponse> get copyWith =>
      __$$_CompilerResponseCopyWithImpl<_$_CompilerResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CompilerResponseToJson(
      this,
    );
  }
}

abstract class _CompilerResponse extends CompilerResponse {
  factory _CompilerResponse(
          {@JsonKey(name: "Success")
              required final bool success,
          @JsonKey(name: "SmartContractCode")
              required final String code,
          @JsonKey(name: "SmartContract")
              required final CompiledSmartContract smartContract}) =
      _$_CompilerResponse;
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
  @JsonKey(name: "SmartContract")
  CompiledSmartContract get smartContract;
  @override
  @JsonKey(ignore: true)
  _$$_CompilerResponseCopyWith<_$_CompilerResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
