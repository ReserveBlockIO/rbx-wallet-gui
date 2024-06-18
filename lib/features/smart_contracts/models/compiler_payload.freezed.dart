// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

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
  @JsonKey(name: "SmartContractAsset")
  Asset get asset => throw _privateConstructorUsedError;
  @JsonKey(name: "IsPublic", defaultValue: true)
  bool get isPublic => throw _privateConstructorUsedError;
  @JsonKey(name: "SmartContractUID", includeToJson: false)
  String? get uuid => throw _privateConstructorUsedError;
  @JsonKey(name: "Features")
  List<Map<String, dynamic>>? get features =>
      throw _privateConstructorUsedError;
  @JsonKey(name: "MinterAddress")
  String get minterAddress => throw _privateConstructorUsedError;
  @JsonKey(name: "IsMinter")
  bool get isMinter => throw _privateConstructorUsedError;
  @JsonKey(name: "Properties")
  Map<String, String>? get properties => throw _privateConstructorUsedError;
  @JsonKey(includeToJson: false)
  String get hash => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CompilerPayloadCopyWith<CompilerPayload> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CompilerPayloadCopyWith<$Res> {
  factory $CompilerPayloadCopyWith(
          CompilerPayload value, $Res Function(CompilerPayload) then) =
      _$CompilerPayloadCopyWithImpl<$Res, CompilerPayload>;
  @useResult
  $Res call(
      {@JsonKey(name: "Name") String name,
      @JsonKey(name: "MinterName") String minterName,
      @JsonKey(name: "Description") String description,
      @JsonKey(name: "SmartContractAsset") Asset asset,
      @JsonKey(name: "IsPublic", defaultValue: true) bool isPublic,
      @JsonKey(name: "SmartContractUID", includeToJson: false) String? uuid,
      @JsonKey(name: "Features") List<Map<String, dynamic>>? features,
      @JsonKey(name: "MinterAddress") String minterAddress,
      @JsonKey(name: "IsMinter") bool isMinter,
      @JsonKey(name: "Properties") Map<String, String>? properties,
      @JsonKey(includeToJson: false) String hash});

  $AssetCopyWith<$Res> get asset;
}

/// @nodoc
class _$CompilerPayloadCopyWithImpl<$Res, $Val extends CompilerPayload>
    implements $CompilerPayloadCopyWith<$Res> {
  _$CompilerPayloadCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? minterName = null,
    Object? description = null,
    Object? asset = null,
    Object? isPublic = null,
    Object? uuid = freezed,
    Object? features = freezed,
    Object? minterAddress = null,
    Object? isMinter = null,
    Object? properties = freezed,
    Object? hash = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      minterName: null == minterName
          ? _value.minterName
          : minterName // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      asset: null == asset
          ? _value.asset
          : asset // ignore: cast_nullable_to_non_nullable
              as Asset,
      isPublic: null == isPublic
          ? _value.isPublic
          : isPublic // ignore: cast_nullable_to_non_nullable
              as bool,
      uuid: freezed == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String?,
      features: freezed == features
          ? _value.features
          : features // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>?,
      minterAddress: null == minterAddress
          ? _value.minterAddress
          : minterAddress // ignore: cast_nullable_to_non_nullable
              as String,
      isMinter: null == isMinter
          ? _value.isMinter
          : isMinter // ignore: cast_nullable_to_non_nullable
              as bool,
      properties: freezed == properties
          ? _value.properties
          : properties // ignore: cast_nullable_to_non_nullable
              as Map<String, String>?,
      hash: null == hash
          ? _value.hash
          : hash // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AssetCopyWith<$Res> get asset {
    return $AssetCopyWith<$Res>(_value.asset, (value) {
      return _then(_value.copyWith(asset: value) as $Val);
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
  @useResult
  $Res call(
      {@JsonKey(name: "Name") String name,
      @JsonKey(name: "MinterName") String minterName,
      @JsonKey(name: "Description") String description,
      @JsonKey(name: "SmartContractAsset") Asset asset,
      @JsonKey(name: "IsPublic", defaultValue: true) bool isPublic,
      @JsonKey(name: "SmartContractUID", includeToJson: false) String? uuid,
      @JsonKey(name: "Features") List<Map<String, dynamic>>? features,
      @JsonKey(name: "MinterAddress") String minterAddress,
      @JsonKey(name: "IsMinter") bool isMinter,
      @JsonKey(name: "Properties") Map<String, String>? properties,
      @JsonKey(includeToJson: false) String hash});

  @override
  $AssetCopyWith<$Res> get asset;
}

/// @nodoc
class __$$_CompilerPayloadCopyWithImpl<$Res>
    extends _$CompilerPayloadCopyWithImpl<$Res, _$_CompilerPayload>
    implements _$$_CompilerPayloadCopyWith<$Res> {
  __$$_CompilerPayloadCopyWithImpl(
      _$_CompilerPayload _value, $Res Function(_$_CompilerPayload) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? minterName = null,
    Object? description = null,
    Object? asset = null,
    Object? isPublic = null,
    Object? uuid = freezed,
    Object? features = freezed,
    Object? minterAddress = null,
    Object? isMinter = null,
    Object? properties = freezed,
    Object? hash = null,
  }) {
    return _then(_$_CompilerPayload(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      minterName: null == minterName
          ? _value.minterName
          : minterName // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      asset: null == asset
          ? _value.asset
          : asset // ignore: cast_nullable_to_non_nullable
              as Asset,
      isPublic: null == isPublic
          ? _value.isPublic
          : isPublic // ignore: cast_nullable_to_non_nullable
              as bool,
      uuid: freezed == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String?,
      features: freezed == features
          ? _value._features
          : features // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>?,
      minterAddress: null == minterAddress
          ? _value.minterAddress
          : minterAddress // ignore: cast_nullable_to_non_nullable
              as String,
      isMinter: null == isMinter
          ? _value.isMinter
          : isMinter // ignore: cast_nullable_to_non_nullable
              as bool,
      properties: freezed == properties
          ? _value._properties
          : properties // ignore: cast_nullable_to_non_nullable
              as Map<String, String>?,
      hash: null == hash
          ? _value.hash
          : hash // ignore: cast_nullable_to_non_nullable
              as String,
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
      @JsonKey(name: "SmartContractAsset") required this.asset,
      @JsonKey(name: "IsPublic", defaultValue: true) required this.isPublic,
      @JsonKey(name: "SmartContractUID", includeToJson: false) this.uuid,
      @JsonKey(name: "Features") final List<Map<String, dynamic>>? features,
      @JsonKey(name: "MinterAddress") required this.minterAddress,
      @JsonKey(name: "IsMinter") required this.isMinter,
      @JsonKey(name: "Properties") final Map<String, String>? properties,
      @JsonKey(includeToJson: false) required this.hash})
      : _features = features,
        _properties = properties,
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
  @JsonKey(name: "SmartContractAsset")
  final Asset asset;
  @override
  @JsonKey(name: "IsPublic", defaultValue: true)
  final bool isPublic;
  @override
  @JsonKey(name: "SmartContractUID", includeToJson: false)
  final String? uuid;
  final List<Map<String, dynamic>>? _features;
  @override
  @JsonKey(name: "Features")
  List<Map<String, dynamic>>? get features {
    final value = _features;
    if (value == null) return null;
    if (_features is EqualUnmodifiableListView) return _features;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: "MinterAddress")
  final String minterAddress;
  @override
  @JsonKey(name: "IsMinter")
  final bool isMinter;
  final Map<String, String>? _properties;
  @override
  @JsonKey(name: "Properties")
  Map<String, String>? get properties {
    final value = _properties;
    if (value == null) return null;
    if (_properties is EqualUnmodifiableMapView) return _properties;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  @JsonKey(includeToJson: false)
  final String hash;

  @override
  String toString() {
    return 'CompilerPayload(name: $name, minterName: $minterName, description: $description, asset: $asset, isPublic: $isPublic, uuid: $uuid, features: $features, minterAddress: $minterAddress, isMinter: $isMinter, properties: $properties, hash: $hash)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CompilerPayload &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.minterName, minterName) ||
                other.minterName == minterName) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.asset, asset) || other.asset == asset) &&
            (identical(other.isPublic, isPublic) ||
                other.isPublic == isPublic) &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            const DeepCollectionEquality().equals(other._features, _features) &&
            (identical(other.minterAddress, minterAddress) ||
                other.minterAddress == minterAddress) &&
            (identical(other.isMinter, isMinter) ||
                other.isMinter == isMinter) &&
            const DeepCollectionEquality()
                .equals(other._properties, _properties) &&
            (identical(other.hash, hash) || other.hash == hash));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      name,
      minterName,
      description,
      asset,
      isPublic,
      uuid,
      const DeepCollectionEquality().hash(_features),
      minterAddress,
      isMinter,
      const DeepCollectionEquality().hash(_properties),
      hash);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CompilerPayloadCopyWith<_$_CompilerPayload> get copyWith =>
      __$$_CompilerPayloadCopyWithImpl<_$_CompilerPayload>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CompilerPayloadToJson(
      this,
    );
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
      @JsonKey(name: "SmartContractAsset")
          required final Asset asset,
      @JsonKey(name: "IsPublic", defaultValue: true)
          required final bool isPublic,
      @JsonKey(name: "SmartContractUID", includeToJson: false)
          final String? uuid,
      @JsonKey(name: "Features")
          final List<Map<String, dynamic>>? features,
      @JsonKey(name: "MinterAddress")
          required final String minterAddress,
      @JsonKey(name: "IsMinter")
          required final bool isMinter,
      @JsonKey(name: "Properties")
          final Map<String, String>? properties,
      @JsonKey(includeToJson: false)
          required final String hash}) = _$_CompilerPayload;
  _CompilerPayload._() : super._();

  factory _CompilerPayload.fromJson(Map<String, dynamic> json) =
      _$_CompilerPayload.fromJson;

  @override
  @JsonKey(name: "Name")
  String get name;
  @override
  @JsonKey(name: "MinterName")
  String get minterName;
  @override
  @JsonKey(name: "Description")
  String get description;
  @override
  @JsonKey(name: "SmartContractAsset")
  Asset get asset;
  @override
  @JsonKey(name: "IsPublic", defaultValue: true)
  bool get isPublic;
  @override
  @JsonKey(name: "SmartContractUID", includeToJson: false)
  String? get uuid;
  @override
  @JsonKey(name: "Features")
  List<Map<String, dynamic>>? get features;
  @override
  @JsonKey(name: "MinterAddress")
  String get minterAddress;
  @override
  @JsonKey(name: "IsMinter")
  bool get isMinter;
  @override
  @JsonKey(name: "Properties")
  Map<String, String>? get properties;
  @override
  @JsonKey(includeToJson: false)
  String get hash;
  @override
  @JsonKey(ignore: true)
  _$$_CompilerPayloadCopyWith<_$_CompilerPayload> get copyWith =>
      throw _privateConstructorUsedError;
}
