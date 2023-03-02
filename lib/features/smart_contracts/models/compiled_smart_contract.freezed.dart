// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'compiled_smart_contract.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CompiledSmartContract _$CompiledSmartContractFromJson(
    Map<String, dynamic> json) {
  return _CompiledSmartContract.fromJson(json);
}

/// @nodoc
mixin _$CompiledSmartContract {
  @JsonKey(name: "Name")
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: "MinterName")
  String? get minterName => throw _privateConstructorUsedError;
  @JsonKey(name: "Description")
  String get description =>
      throw _privateConstructorUsedError; // @JsonKey(name: "CurrentOwner") required String CurrentOwner,
  @JsonKey(name: "SmartContractUID")
  String get id =>
      throw _privateConstructorUsedError; // @JsonKey(name: "Signature") String? signature,
  @JsonKey(name: "SmartContractAsset")
  Asset get primaryAsset => throw _privateConstructorUsedError;
  @JsonKey(name: "IsPublic")
  bool get isPublic => throw _privateConstructorUsedError;
  @JsonKey(name: "IsPublished")
  bool get isPublished => throw _privateConstructorUsedError;
  @JsonKey(name: "Features")
  List<Map<String, dynamic>> get features => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CompiledSmartContractCopyWith<CompiledSmartContract> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CompiledSmartContractCopyWith<$Res> {
  factory $CompiledSmartContractCopyWith(CompiledSmartContract value,
          $Res Function(CompiledSmartContract) then) =
      _$CompiledSmartContractCopyWithImpl<$Res, CompiledSmartContract>;
  @useResult
  $Res call(
      {@JsonKey(name: "Name") String name,
      @JsonKey(name: "MinterName") String? minterName,
      @JsonKey(name: "Description") String description,
      @JsonKey(name: "SmartContractUID") String id,
      @JsonKey(name: "SmartContractAsset") Asset primaryAsset,
      @JsonKey(name: "IsPublic") bool isPublic,
      @JsonKey(name: "IsPublished") bool isPublished,
      @JsonKey(name: "Features") List<Map<String, dynamic>> features});

  $AssetCopyWith<$Res> get primaryAsset;
}

/// @nodoc
class _$CompiledSmartContractCopyWithImpl<$Res,
        $Val extends CompiledSmartContract>
    implements $CompiledSmartContractCopyWith<$Res> {
  _$CompiledSmartContractCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? minterName = freezed,
    Object? description = null,
    Object? id = null,
    Object? primaryAsset = null,
    Object? isPublic = null,
    Object? isPublished = null,
    Object? features = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      minterName: freezed == minterName
          ? _value.minterName
          : minterName // ignore: cast_nullable_to_non_nullable
              as String?,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      primaryAsset: null == primaryAsset
          ? _value.primaryAsset
          : primaryAsset // ignore: cast_nullable_to_non_nullable
              as Asset,
      isPublic: null == isPublic
          ? _value.isPublic
          : isPublic // ignore: cast_nullable_to_non_nullable
              as bool,
      isPublished: null == isPublished
          ? _value.isPublished
          : isPublished // ignore: cast_nullable_to_non_nullable
              as bool,
      features: null == features
          ? _value.features
          : features // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AssetCopyWith<$Res> get primaryAsset {
    return $AssetCopyWith<$Res>(_value.primaryAsset, (value) {
      return _then(_value.copyWith(primaryAsset: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_CompiledSmartContractCopyWith<$Res>
    implements $CompiledSmartContractCopyWith<$Res> {
  factory _$$_CompiledSmartContractCopyWith(_$_CompiledSmartContract value,
          $Res Function(_$_CompiledSmartContract) then) =
      __$$_CompiledSmartContractCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "Name") String name,
      @JsonKey(name: "MinterName") String? minterName,
      @JsonKey(name: "Description") String description,
      @JsonKey(name: "SmartContractUID") String id,
      @JsonKey(name: "SmartContractAsset") Asset primaryAsset,
      @JsonKey(name: "IsPublic") bool isPublic,
      @JsonKey(name: "IsPublished") bool isPublished,
      @JsonKey(name: "Features") List<Map<String, dynamic>> features});

  @override
  $AssetCopyWith<$Res> get primaryAsset;
}

/// @nodoc
class __$$_CompiledSmartContractCopyWithImpl<$Res>
    extends _$CompiledSmartContractCopyWithImpl<$Res, _$_CompiledSmartContract>
    implements _$$_CompiledSmartContractCopyWith<$Res> {
  __$$_CompiledSmartContractCopyWithImpl(_$_CompiledSmartContract _value,
      $Res Function(_$_CompiledSmartContract) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? minterName = freezed,
    Object? description = null,
    Object? id = null,
    Object? primaryAsset = null,
    Object? isPublic = null,
    Object? isPublished = null,
    Object? features = null,
  }) {
    return _then(_$_CompiledSmartContract(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      minterName: freezed == minterName
          ? _value.minterName
          : minterName // ignore: cast_nullable_to_non_nullable
              as String?,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      primaryAsset: null == primaryAsset
          ? _value.primaryAsset
          : primaryAsset // ignore: cast_nullable_to_non_nullable
              as Asset,
      isPublic: null == isPublic
          ? _value.isPublic
          : isPublic // ignore: cast_nullable_to_non_nullable
              as bool,
      isPublished: null == isPublished
          ? _value.isPublished
          : isPublished // ignore: cast_nullable_to_non_nullable
              as bool,
      features: null == features
          ? _value._features
          : features // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CompiledSmartContract extends _CompiledSmartContract {
  _$_CompiledSmartContract(
      {@JsonKey(name: "Name")
          required this.name,
      @JsonKey(name: "MinterName")
          this.minterName,
      @JsonKey(name: "Description")
          required this.description,
      @JsonKey(name: "SmartContractUID")
          required this.id,
      @JsonKey(name: "SmartContractAsset")
          required this.primaryAsset,
      @JsonKey(name: "IsPublic")
          required this.isPublic,
      @JsonKey(name: "IsPublished")
          required this.isPublished,
      @JsonKey(name: "Features")
          final List<Map<String, dynamic>> features = const []})
      : _features = features,
        super._();

  factory _$_CompiledSmartContract.fromJson(Map<String, dynamic> json) =>
      _$$_CompiledSmartContractFromJson(json);

  @override
  @JsonKey(name: "Name")
  final String name;
  @override
  @JsonKey(name: "MinterName")
  final String? minterName;
  @override
  @JsonKey(name: "Description")
  final String description;
// @JsonKey(name: "CurrentOwner") required String CurrentOwner,
  @override
  @JsonKey(name: "SmartContractUID")
  final String id;
// @JsonKey(name: "Signature") String? signature,
  @override
  @JsonKey(name: "SmartContractAsset")
  final Asset primaryAsset;
  @override
  @JsonKey(name: "IsPublic")
  final bool isPublic;
  @override
  @JsonKey(name: "IsPublished")
  final bool isPublished;
  final List<Map<String, dynamic>> _features;
  @override
  @JsonKey(name: "Features")
  List<Map<String, dynamic>> get features {
    if (_features is EqualUnmodifiableListView) return _features;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_features);
  }

  @override
  String toString() {
    return 'CompiledSmartContract(name: $name, minterName: $minterName, description: $description, id: $id, primaryAsset: $primaryAsset, isPublic: $isPublic, isPublished: $isPublished, features: $features)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CompiledSmartContract &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.minterName, minterName) ||
                other.minterName == minterName) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.primaryAsset, primaryAsset) ||
                other.primaryAsset == primaryAsset) &&
            (identical(other.isPublic, isPublic) ||
                other.isPublic == isPublic) &&
            (identical(other.isPublished, isPublished) ||
                other.isPublished == isPublished) &&
            const DeepCollectionEquality().equals(other._features, _features));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      name,
      minterName,
      description,
      id,
      primaryAsset,
      isPublic,
      isPublished,
      const DeepCollectionEquality().hash(_features));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CompiledSmartContractCopyWith<_$_CompiledSmartContract> get copyWith =>
      __$$_CompiledSmartContractCopyWithImpl<_$_CompiledSmartContract>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CompiledSmartContractToJson(
      this,
    );
  }
}

abstract class _CompiledSmartContract extends CompiledSmartContract {
  factory _CompiledSmartContract(
          {@JsonKey(name: "Name")
              required final String name,
          @JsonKey(name: "MinterName")
              final String? minterName,
          @JsonKey(name: "Description")
              required final String description,
          @JsonKey(name: "SmartContractUID")
              required final String id,
          @JsonKey(name: "SmartContractAsset")
              required final Asset primaryAsset,
          @JsonKey(name: "IsPublic")
              required final bool isPublic,
          @JsonKey(name: "IsPublished")
              required final bool isPublished,
          @JsonKey(name: "Features")
              final List<Map<String, dynamic>> features}) =
      _$_CompiledSmartContract;
  _CompiledSmartContract._() : super._();

  factory _CompiledSmartContract.fromJson(Map<String, dynamic> json) =
      _$_CompiledSmartContract.fromJson;

  @override
  @JsonKey(name: "Name")
  String get name;
  @override
  @JsonKey(name: "MinterName")
  String? get minterName;
  @override
  @JsonKey(name: "Description")
  String get description;
  @override // @JsonKey(name: "CurrentOwner") required String CurrentOwner,
  @JsonKey(name: "SmartContractUID")
  String get id;
  @override // @JsonKey(name: "Signature") String? signature,
  @JsonKey(name: "SmartContractAsset")
  Asset get primaryAsset;
  @override
  @JsonKey(name: "IsPublic")
  bool get isPublic;
  @override
  @JsonKey(name: "IsPublished")
  bool get isPublished;
  @override
  @JsonKey(name: "Features")
  List<Map<String, dynamic>> get features;
  @override
  @JsonKey(ignore: true)
  _$$_CompiledSmartContractCopyWith<_$_CompiledSmartContract> get copyWith =>
      throw _privateConstructorUsedError;
}
