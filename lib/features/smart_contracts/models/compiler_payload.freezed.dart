// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'compiler_payload.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CompilerPayload _$CompilerPayloadFromJson(Map<String, dynamic> json) {
  return _CompilerPayload.fromJson(json);
}

/// @nodoc
mixin _$CompilerPayload {
  @JsonKey(name: "Name")
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: "MinterName")
  String get minterName => throw _privateConstructorUsedError;
  @JsonKey(name: "Description")
  String get description => throw _privateConstructorUsedError;
  @JsonKey(name: "Address")
  String get address => throw _privateConstructorUsedError;
  @JsonKey(name: "SmartContractAsset")
  Asset get asset => throw _privateConstructorUsedError;
  @JsonKey(name: "IsPublic", defaultValue: true)
  bool get isPublic => throw _privateConstructorUsedError;
  @JsonKey(name: "SmartContractUID")
  String? get uuid => throw _privateConstructorUsedError;
  @JsonKey(name: "Signature")
  String? get signature => throw _privateConstructorUsedError;
  @JsonKey(name: "Features")
  List<Map<String, dynamic>>? get features =>
      throw _privateConstructorUsedError;
  @JsonKey(name: "MinterAddress")
  String get minterAddress => throw _privateConstructorUsedError;
  @JsonKey(name: "IsMinter")
  bool get isMinter => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CompilerPayloadCopyWith<CompilerPayload> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CompilerPayloadCopyWith<$Res> {
  factory $CompilerPayloadCopyWith(
          CompilerPayload value, $Res Function(CompilerPayload) then) =
      _$CompilerPayloadCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: "Name") String name,
      @JsonKey(name: "MinterName") String minterName,
      @JsonKey(name: "Description") String description,
      @JsonKey(name: "Address") String address,
      @JsonKey(name: "SmartContractAsset") Asset asset,
      @JsonKey(name: "IsPublic", defaultValue: true) bool isPublic,
      @JsonKey(name: "SmartContractUID") String? uuid,
      @JsonKey(name: "Signature") String? signature,
      @JsonKey(name: "Features") List<Map<String, dynamic>>? features,
      @JsonKey(name: "MinterAddress") String minterAddress,
      @JsonKey(name: "IsMinter") bool isMinter});

  $AssetCopyWith<$Res> get asset;
}

/// @nodoc
class _$CompilerPayloadCopyWithImpl<$Res>
    implements $CompilerPayloadCopyWith<$Res> {
  _$CompilerPayloadCopyWithImpl(this._value, this._then);

  final CompilerPayload _value;
  // ignore: unused_field
  final $Res Function(CompilerPayload) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? minterName = freezed,
    Object? description = freezed,
    Object? address = freezed,
    Object? asset = freezed,
    Object? isPublic = freezed,
    Object? uuid = freezed,
    Object? signature = freezed,
    Object? features = freezed,
    Object? minterAddress = freezed,
    Object? isMinter = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      minterName: minterName == freezed
          ? _value.minterName
          : minterName // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      address: address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      asset: asset == freezed
          ? _value.asset
          : asset // ignore: cast_nullable_to_non_nullable
              as Asset,
      isPublic: isPublic == freezed
          ? _value.isPublic
          : isPublic // ignore: cast_nullable_to_non_nullable
              as bool,
      uuid: uuid == freezed
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String?,
      signature: signature == freezed
          ? _value.signature
          : signature // ignore: cast_nullable_to_non_nullable
              as String?,
      features: features == freezed
          ? _value.features
          : features // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>?,
      minterAddress: minterAddress == freezed
          ? _value.minterAddress
          : minterAddress // ignore: cast_nullable_to_non_nullable
              as String,
      isMinter: isMinter == freezed
          ? _value.isMinter
          : isMinter // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  @override
  $AssetCopyWith<$Res> get asset {
    return $AssetCopyWith<$Res>(_value.asset, (value) {
      return _then(_value.copyWith(asset: value));
    });
  }
}

/// @nodoc
abstract class _$$_CompilerPayloadCopyWith<$Res>
    implements $CompilerPayloadCopyWith<$Res> {
  factory _$$_CompilerPayloadCopyWith(
          _$_CompilerPayload value, $Res Function(_$_CompilerPayload) then) =
      __$$_CompilerPayloadCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: "Name") String name,
      @JsonKey(name: "MinterName") String minterName,
      @JsonKey(name: "Description") String description,
      @JsonKey(name: "Address") String address,
      @JsonKey(name: "SmartContractAsset") Asset asset,
      @JsonKey(name: "IsPublic", defaultValue: true) bool isPublic,
      @JsonKey(name: "SmartContractUID") String? uuid,
      @JsonKey(name: "Signature") String? signature,
      @JsonKey(name: "Features") List<Map<String, dynamic>>? features,
      @JsonKey(name: "MinterAddress") String minterAddress,
      @JsonKey(name: "IsMinter") bool isMinter});

  @override
  $AssetCopyWith<$Res> get asset;
}

/// @nodoc
class __$$_CompilerPayloadCopyWithImpl<$Res>
    extends _$CompilerPayloadCopyWithImpl<$Res>
    implements _$$_CompilerPayloadCopyWith<$Res> {
  __$$_CompilerPayloadCopyWithImpl(
      _$_CompilerPayload _value, $Res Function(_$_CompilerPayload) _then)
      : super(_value, (v) => _then(v as _$_CompilerPayload));

  @override
  _$_CompilerPayload get _value => super._value as _$_CompilerPayload;

  @override
  $Res call({
    Object? name = freezed,
    Object? minterName = freezed,
    Object? description = freezed,
    Object? address = freezed,
    Object? asset = freezed,
    Object? isPublic = freezed,
    Object? uuid = freezed,
    Object? signature = freezed,
    Object? features = freezed,
    Object? minterAddress = freezed,
    Object? isMinter = freezed,
  }) {
    return _then(_$_CompilerPayload(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      minterName: minterName == freezed
          ? _value.minterName
          : minterName // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      address: address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      asset: asset == freezed
          ? _value.asset
          : asset // ignore: cast_nullable_to_non_nullable
              as Asset,
      isPublic: isPublic == freezed
          ? _value.isPublic
          : isPublic // ignore: cast_nullable_to_non_nullable
              as bool,
      uuid: uuid == freezed
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String?,
      signature: signature == freezed
          ? _value.signature
          : signature // ignore: cast_nullable_to_non_nullable
              as String?,
      features: features == freezed
          ? _value._features
          : features // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>?,
      minterAddress: minterAddress == freezed
          ? _value.minterAddress
          : minterAddress // ignore: cast_nullable_to_non_nullable
              as String,
      isMinter: isMinter == freezed
          ? _value.isMinter
          : isMinter // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_CompilerPayload extends _CompilerPayload {
  _$_CompilerPayload(
      {@JsonKey(name: "Name") required this.name,
      @JsonKey(name: "MinterName") required this.minterName,
      @JsonKey(name: "Description") required this.description,
      @JsonKey(name: "Address") required this.address,
      @JsonKey(name: "SmartContractAsset") required this.asset,
      @JsonKey(name: "IsPublic", defaultValue: true) required this.isPublic,
      @JsonKey(name: "SmartContractUID") this.uuid,
      @JsonKey(name: "Signature") this.signature,
      @JsonKey(name: "Features") final List<Map<String, dynamic>>? features,
      @JsonKey(name: "MinterAddress") required this.minterAddress,
      @JsonKey(name: "IsMinter") required this.isMinter})
      : _features = features,
        super._();

  factory _$_CompilerPayload.fromJson(Map<String, dynamic> json) =>
      _$$_CompilerPayloadFromJson(json);

  @override
  @JsonKey(name: "Name")
  final String name;
  @override
  @JsonKey(name: "MinterName")
  final String minterName;
  @override
  @JsonKey(name: "Description")
  final String description;
  @override
  @JsonKey(name: "Address")
  final String address;
  @override
  @JsonKey(name: "SmartContractAsset")
  final Asset asset;
  @override
  @JsonKey(name: "IsPublic", defaultValue: true)
  final bool isPublic;
  @override
  @JsonKey(name: "SmartContractUID")
  final String? uuid;
  @override
  @JsonKey(name: "Signature")
  final String? signature;
  final List<Map<String, dynamic>>? _features;
  @override
  @JsonKey(name: "Features")
  List<Map<String, dynamic>>? get features {
    final value = _features;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: "MinterAddress")
  final String minterAddress;
  @override
  @JsonKey(name: "IsMinter")
  final bool isMinter;

  @override
  String toString() {
    return 'CompilerPayload(name: $name, minterName: $minterName, description: $description, address: $address, asset: $asset, isPublic: $isPublic, uuid: $uuid, signature: $signature, features: $features, minterAddress: $minterAddress, isMinter: $isMinter)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CompilerPayload &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality()
                .equals(other.minterName, minterName) &&
            const DeepCollectionEquality()
                .equals(other.description, description) &&
            const DeepCollectionEquality().equals(other.address, address) &&
            const DeepCollectionEquality().equals(other.asset, asset) &&
            const DeepCollectionEquality().equals(other.isPublic, isPublic) &&
            const DeepCollectionEquality().equals(other.uuid, uuid) &&
            const DeepCollectionEquality().equals(other.signature, signature) &&
            const DeepCollectionEquality().equals(other._features, _features) &&
            const DeepCollectionEquality()
                .equals(other.minterAddress, minterAddress) &&
            const DeepCollectionEquality().equals(other.isMinter, isMinter));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(minterName),
      const DeepCollectionEquality().hash(description),
      const DeepCollectionEquality().hash(address),
      const DeepCollectionEquality().hash(asset),
      const DeepCollectionEquality().hash(isPublic),
      const DeepCollectionEquality().hash(uuid),
      const DeepCollectionEquality().hash(signature),
      const DeepCollectionEquality().hash(_features),
      const DeepCollectionEquality().hash(minterAddress),
      const DeepCollectionEquality().hash(isMinter));

  @JsonKey(ignore: true)
  @override
  _$$_CompilerPayloadCopyWith<_$_CompilerPayload> get copyWith =>
      __$$_CompilerPayloadCopyWithImpl<_$_CompilerPayload>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CompilerPayloadToJson(this);
  }
}

abstract class _CompilerPayload extends CompilerPayload {
  factory _CompilerPayload(
      {@JsonKey(name: "Name")
          required final String name,
      @JsonKey(name: "MinterName")
          required final String minterName,
      @JsonKey(name: "Description")
          required final String description,
      @JsonKey(name: "Address")
          required final String address,
      @JsonKey(name: "SmartContractAsset")
          required final Asset asset,
      @JsonKey(name: "IsPublic", defaultValue: true)
          required final bool isPublic,
      @JsonKey(name: "SmartContractUID")
          final String? uuid,
      @JsonKey(name: "Signature")
          final String? signature,
      @JsonKey(name: "Features")
          final List<Map<String, dynamic>>? features,
      @JsonKey(name: "MinterAddress")
          required final String minterAddress,
      @JsonKey(name: "IsMinter")
          required final bool isMinter}) = _$_CompilerPayload;
  _CompilerPayload._() : super._();

  factory _CompilerPayload.fromJson(Map<String, dynamic> json) =
      _$_CompilerPayload.fromJson;

  @override
  @JsonKey(name: "Name")
  String get name => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "MinterName")
  String get minterName => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "Description")
  String get description => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "Address")
  String get address => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "SmartContractAsset")
  Asset get asset => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "IsPublic", defaultValue: true)
  bool get isPublic => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "SmartContractUID")
  String? get uuid => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "Signature")
  String? get signature => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "Features")
  List<Map<String, dynamic>>? get features =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "MinterAddress")
  String get minterAddress => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "IsMinter")
  bool get isMinter => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_CompilerPayloadCopyWith<_$_CompilerPayload> get copyWith =>
      throw _privateConstructorUsedError;
}
