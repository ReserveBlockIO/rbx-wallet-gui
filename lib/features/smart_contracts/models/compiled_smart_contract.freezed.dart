// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

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
      throw _privateConstructorUsedError; // @JsonKey(name: "Address") required String address,
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
      _$CompiledSmartContractCopyWithImpl<$Res>;
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
class _$CompiledSmartContractCopyWithImpl<$Res>
    implements $CompiledSmartContractCopyWith<$Res> {
  _$CompiledSmartContractCopyWithImpl(this._value, this._then);

  final CompiledSmartContract _value;
  // ignore: unused_field
  final $Res Function(CompiledSmartContract) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? minterName = freezed,
    Object? description = freezed,
    Object? id = freezed,
    Object? primaryAsset = freezed,
    Object? isPublic = freezed,
    Object? isPublished = freezed,
    Object? features = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      minterName: minterName == freezed
          ? _value.minterName
          : minterName // ignore: cast_nullable_to_non_nullable
              as String?,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      primaryAsset: primaryAsset == freezed
          ? _value.primaryAsset
          : primaryAsset // ignore: cast_nullable_to_non_nullable
              as Asset,
      isPublic: isPublic == freezed
          ? _value.isPublic
          : isPublic // ignore: cast_nullable_to_non_nullable
              as bool,
      isPublished: isPublished == freezed
          ? _value.isPublished
          : isPublished // ignore: cast_nullable_to_non_nullable
              as bool,
      features: features == freezed
          ? _value.features
          : features // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
    ));
  }

  @override
  $AssetCopyWith<$Res> get primaryAsset {
    return $AssetCopyWith<$Res>(_value.primaryAsset, (value) {
      return _then(_value.copyWith(primaryAsset: value));
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
    extends _$CompiledSmartContractCopyWithImpl<$Res>
    implements _$$_CompiledSmartContractCopyWith<$Res> {
  __$$_CompiledSmartContractCopyWithImpl(_$_CompiledSmartContract _value,
      $Res Function(_$_CompiledSmartContract) _then)
      : super(_value, (v) => _then(v as _$_CompiledSmartContract));

  @override
  _$_CompiledSmartContract get _value =>
      super._value as _$_CompiledSmartContract;

  @override
  $Res call({
    Object? name = freezed,
    Object? minterName = freezed,
    Object? description = freezed,
    Object? id = freezed,
    Object? primaryAsset = freezed,
    Object? isPublic = freezed,
    Object? isPublished = freezed,
    Object? features = freezed,
  }) {
    return _then(_$_CompiledSmartContract(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      minterName: minterName == freezed
          ? _value.minterName
          : minterName // ignore: cast_nullable_to_non_nullable
              as String?,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      primaryAsset: primaryAsset == freezed
          ? _value.primaryAsset
          : primaryAsset // ignore: cast_nullable_to_non_nullable
              as Asset,
      isPublic: isPublic == freezed
          ? _value.isPublic
          : isPublic // ignore: cast_nullable_to_non_nullable
              as bool,
      isPublished: isPublished == freezed
          ? _value.isPublished
          : isPublished // ignore: cast_nullable_to_non_nullable
              as bool,
      features: features == freezed
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
// @JsonKey(name: "Address") required String address,
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
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality()
                .equals(other.minterName, minterName) &&
            const DeepCollectionEquality()
                .equals(other.description, description) &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality()
                .equals(other.primaryAsset, primaryAsset) &&
            const DeepCollectionEquality().equals(other.isPublic, isPublic) &&
            const DeepCollectionEquality()
                .equals(other.isPublished, isPublished) &&
            const DeepCollectionEquality().equals(other._features, _features));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(minterName),
      const DeepCollectionEquality().hash(description),
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(primaryAsset),
      const DeepCollectionEquality().hash(isPublic),
      const DeepCollectionEquality().hash(isPublished),
      const DeepCollectionEquality().hash(_features));

  @JsonKey(ignore: true)
  @override
  _$$_CompiledSmartContractCopyWith<_$_CompiledSmartContract> get copyWith =>
      __$$_CompiledSmartContractCopyWithImpl<_$_CompiledSmartContract>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CompiledSmartContractToJson(this);
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
  String get name => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "MinterName")
  String? get minterName => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "Description")
  String get description => throw _privateConstructorUsedError;
  @override // @JsonKey(name: "Address") required String address,
  @JsonKey(name: "SmartContractUID")
  String get id => throw _privateConstructorUsedError;
  @override // @JsonKey(name: "Signature") String? signature,
  @JsonKey(name: "SmartContractAsset")
  Asset get primaryAsset => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "IsPublic")
  bool get isPublic => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "IsPublished")
  bool get isPublished => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "Features")
  List<Map<String, dynamic>> get features => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_CompiledSmartContractCopyWith<_$_CompiledSmartContract> get copyWith =>
      throw _privateConstructorUsedError;
}
