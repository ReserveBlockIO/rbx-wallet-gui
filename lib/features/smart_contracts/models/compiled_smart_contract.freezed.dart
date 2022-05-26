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
      {@JsonKey(name: "Name")
          required String name,
      @JsonKey(name: "MinterName")
          String? minterName,
      @JsonKey(name: "Description")
          required String description,
      @JsonKey(name: "Address")
          required String address,
      @JsonKey(name: "SmartContractUID")
          required String id,
      @JsonKey(name: "Signature")
          String? signature,
      @JsonKey(name: "SmartContractAsset")
          required Asset primaryAsset,
      @JsonKey(name: "IsPublic")
          required bool isPublic,
      @JsonKey(name: "IsPublished")
          required bool isPublished,
      @JsonKey(name: "Features")
          List<Map<String, dynamic>> features = const []}) {
    return _CompiledSmartContract(
      name: name,
      minterName: minterName,
      description: description,
      address: address,
      id: id,
      signature: signature,
      primaryAsset: primaryAsset,
      isPublic: isPublic,
      isPublished: isPublished,
      features: features,
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
  @JsonKey(name: "Name")
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: "MinterName")
  String? get minterName => throw _privateConstructorUsedError;
  @JsonKey(name: "Description")
  String get description => throw _privateConstructorUsedError;
  @JsonKey(name: "Address")
  String get address => throw _privateConstructorUsedError;
  @JsonKey(name: "SmartContractUID")
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: "Signature")
  String? get signature => throw _privateConstructorUsedError;
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
      @JsonKey(name: "Address") String address,
      @JsonKey(name: "SmartContractUID") String id,
      @JsonKey(name: "Signature") String? signature,
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
    Object? address = freezed,
    Object? id = freezed,
    Object? signature = freezed,
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
      address: address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      signature: signature == freezed
          ? _value.signature
          : signature // ignore: cast_nullable_to_non_nullable
              as String?,
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
abstract class _$CompiledSmartContractCopyWith<$Res>
    implements $CompiledSmartContractCopyWith<$Res> {
  factory _$CompiledSmartContractCopyWith(_CompiledSmartContract value,
          $Res Function(_CompiledSmartContract) then) =
      __$CompiledSmartContractCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: "Name") String name,
      @JsonKey(name: "MinterName") String? minterName,
      @JsonKey(name: "Description") String description,
      @JsonKey(name: "Address") String address,
      @JsonKey(name: "SmartContractUID") String id,
      @JsonKey(name: "Signature") String? signature,
      @JsonKey(name: "SmartContractAsset") Asset primaryAsset,
      @JsonKey(name: "IsPublic") bool isPublic,
      @JsonKey(name: "IsPublished") bool isPublished,
      @JsonKey(name: "Features") List<Map<String, dynamic>> features});

  @override
  $AssetCopyWith<$Res> get primaryAsset;
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
    Object? name = freezed,
    Object? minterName = freezed,
    Object? description = freezed,
    Object? address = freezed,
    Object? id = freezed,
    Object? signature = freezed,
    Object? primaryAsset = freezed,
    Object? isPublic = freezed,
    Object? isPublished = freezed,
    Object? features = freezed,
  }) {
    return _then(_CompiledSmartContract(
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
      address: address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      signature: signature == freezed
          ? _value.signature
          : signature // ignore: cast_nullable_to_non_nullable
              as String?,
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
}

/// @nodoc
@JsonSerializable()
class _$_CompiledSmartContract extends _CompiledSmartContract {
  _$_CompiledSmartContract(
      {@JsonKey(name: "Name") required this.name,
      @JsonKey(name: "MinterName") this.minterName,
      @JsonKey(name: "Description") required this.description,
      @JsonKey(name: "Address") required this.address,
      @JsonKey(name: "SmartContractUID") required this.id,
      @JsonKey(name: "Signature") this.signature,
      @JsonKey(name: "SmartContractAsset") required this.primaryAsset,
      @JsonKey(name: "IsPublic") required this.isPublic,
      @JsonKey(name: "IsPublished") required this.isPublished,
      @JsonKey(name: "Features") this.features = const []})
      : super._();

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
  @override
  @JsonKey(name: "Address")
  final String address;
  @override
  @JsonKey(name: "SmartContractUID")
  final String id;
  @override
  @JsonKey(name: "Signature")
  final String? signature;
  @override
  @JsonKey(name: "SmartContractAsset")
  final Asset primaryAsset;
  @override
  @JsonKey(name: "IsPublic")
  final bool isPublic;
  @override
  @JsonKey(name: "IsPublished")
  final bool isPublished;
  @override
  @JsonKey(name: "Features")
  final List<Map<String, dynamic>> features;

  @override
  String toString() {
    return 'CompiledSmartContract(name: $name, minterName: $minterName, description: $description, address: $address, id: $id, signature: $signature, primaryAsset: $primaryAsset, isPublic: $isPublic, isPublished: $isPublished, features: $features)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CompiledSmartContract &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality()
                .equals(other.minterName, minterName) &&
            const DeepCollectionEquality()
                .equals(other.description, description) &&
            const DeepCollectionEquality().equals(other.address, address) &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.signature, signature) &&
            const DeepCollectionEquality()
                .equals(other.primaryAsset, primaryAsset) &&
            const DeepCollectionEquality().equals(other.isPublic, isPublic) &&
            const DeepCollectionEquality()
                .equals(other.isPublished, isPublished) &&
            const DeepCollectionEquality().equals(other.features, features));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(minterName),
      const DeepCollectionEquality().hash(description),
      const DeepCollectionEquality().hash(address),
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(signature),
      const DeepCollectionEquality().hash(primaryAsset),
      const DeepCollectionEquality().hash(isPublic),
      const DeepCollectionEquality().hash(isPublished),
      const DeepCollectionEquality().hash(features));

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
          {@JsonKey(name: "Name") required String name,
          @JsonKey(name: "MinterName") String? minterName,
          @JsonKey(name: "Description") required String description,
          @JsonKey(name: "Address") required String address,
          @JsonKey(name: "SmartContractUID") required String id,
          @JsonKey(name: "Signature") String? signature,
          @JsonKey(name: "SmartContractAsset") required Asset primaryAsset,
          @JsonKey(name: "IsPublic") required bool isPublic,
          @JsonKey(name: "IsPublished") required bool isPublished,
          @JsonKey(name: "Features") List<Map<String, dynamic>> features}) =
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
  @override
  @JsonKey(name: "Address")
  String get address;
  @override
  @JsonKey(name: "SmartContractUID")
  String get id;
  @override
  @JsonKey(name: "Signature")
  String? get signature;
  @override
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
  _$CompiledSmartContractCopyWith<_CompiledSmartContract> get copyWith =>
      throw _privateConstructorUsedError;
}
