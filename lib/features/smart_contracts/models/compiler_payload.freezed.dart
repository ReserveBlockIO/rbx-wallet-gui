// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'compiler_payload.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CompilerPayload _$CompilerPayloadFromJson(Map<String, dynamic> json) {
  return _CompilerPayload.fromJson(json);
}

/// @nodoc
class _$CompilerPayloadTearOff {
  const _$CompilerPayloadTearOff();

  _CompilerPayload call(
      {@JsonKey(name: "Name") required String name,
      @JsonKey(name: "Description") required String description,
      @JsonKey(name: "Address") required String address,
      @JsonKey(name: "AssetId") required String assetId,
      @JsonKey(name: "IsPublic", defaultValue: true) required bool isPublic,
      @JsonKey(name: "SmartContractUID") String? uuid,
      @JsonKey(name: "Signature") String? signature,
      @JsonKey(name: "Features") List<Map<String, dynamic>>? features}) {
    return _CompilerPayload(
      name: name,
      description: description,
      address: address,
      assetId: assetId,
      isPublic: isPublic,
      uuid: uuid,
      signature: signature,
      features: features,
    );
  }

  CompilerPayload fromJson(Map<String, Object?> json) {
    return CompilerPayload.fromJson(json);
  }
}

/// @nodoc
const $CompilerPayload = _$CompilerPayloadTearOff();

/// @nodoc
mixin _$CompilerPayload {
  @JsonKey(name: "Name")
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: "Description")
  String get description => throw _privateConstructorUsedError;
  @JsonKey(name: "Address")
  String get address => throw _privateConstructorUsedError;
  @JsonKey(name: "AssetId")
  String get assetId => throw _privateConstructorUsedError; // TODO: asset stuff
  @JsonKey(name: "IsPublic", defaultValue: true)
  bool get isPublic => throw _privateConstructorUsedError;
  @JsonKey(name: "SmartContractUID")
  String? get uuid => throw _privateConstructorUsedError;
  @JsonKey(name: "Signature")
  String? get signature => throw _privateConstructorUsedError;
  @JsonKey(name: "Features")
  List<Map<String, dynamic>>? get features =>
      throw _privateConstructorUsedError;

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
      @JsonKey(name: "Description") String description,
      @JsonKey(name: "Address") String address,
      @JsonKey(name: "AssetId") String assetId,
      @JsonKey(name: "IsPublic", defaultValue: true) bool isPublic,
      @JsonKey(name: "SmartContractUID") String? uuid,
      @JsonKey(name: "Signature") String? signature,
      @JsonKey(name: "Features") List<Map<String, dynamic>>? features});
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
    Object? description = freezed,
    Object? address = freezed,
    Object? assetId = freezed,
    Object? isPublic = freezed,
    Object? uuid = freezed,
    Object? signature = freezed,
    Object? features = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      address: address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      assetId: assetId == freezed
          ? _value.assetId
          : assetId // ignore: cast_nullable_to_non_nullable
              as String,
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
    ));
  }
}

/// @nodoc
abstract class _$CompilerPayloadCopyWith<$Res>
    implements $CompilerPayloadCopyWith<$Res> {
  factory _$CompilerPayloadCopyWith(
          _CompilerPayload value, $Res Function(_CompilerPayload) then) =
      __$CompilerPayloadCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: "Name") String name,
      @JsonKey(name: "Description") String description,
      @JsonKey(name: "Address") String address,
      @JsonKey(name: "AssetId") String assetId,
      @JsonKey(name: "IsPublic", defaultValue: true) bool isPublic,
      @JsonKey(name: "SmartContractUID") String? uuid,
      @JsonKey(name: "Signature") String? signature,
      @JsonKey(name: "Features") List<Map<String, dynamic>>? features});
}

/// @nodoc
class __$CompilerPayloadCopyWithImpl<$Res>
    extends _$CompilerPayloadCopyWithImpl<$Res>
    implements _$CompilerPayloadCopyWith<$Res> {
  __$CompilerPayloadCopyWithImpl(
      _CompilerPayload _value, $Res Function(_CompilerPayload) _then)
      : super(_value, (v) => _then(v as _CompilerPayload));

  @override
  _CompilerPayload get _value => super._value as _CompilerPayload;

  @override
  $Res call({
    Object? name = freezed,
    Object? description = freezed,
    Object? address = freezed,
    Object? assetId = freezed,
    Object? isPublic = freezed,
    Object? uuid = freezed,
    Object? signature = freezed,
    Object? features = freezed,
  }) {
    return _then(_CompilerPayload(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      address: address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      assetId: assetId == freezed
          ? _value.assetId
          : assetId // ignore: cast_nullable_to_non_nullable
              as String,
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CompilerPayload extends _CompilerPayload {
  _$_CompilerPayload(
      {@JsonKey(name: "Name") required this.name,
      @JsonKey(name: "Description") required this.description,
      @JsonKey(name: "Address") required this.address,
      @JsonKey(name: "AssetId") required this.assetId,
      @JsonKey(name: "IsPublic", defaultValue: true) required this.isPublic,
      @JsonKey(name: "SmartContractUID") this.uuid,
      @JsonKey(name: "Signature") this.signature,
      @JsonKey(name: "Features") this.features})
      : super._();

  factory _$_CompilerPayload.fromJson(Map<String, dynamic> json) =>
      _$$_CompilerPayloadFromJson(json);

  @override
  @JsonKey(name: "Name")
  final String name;
  @override
  @JsonKey(name: "Description")
  final String description;
  @override
  @JsonKey(name: "Address")
  final String address;
  @override
  @JsonKey(name: "AssetId")
  final String assetId;
  @override // TODO: asset stuff
  @JsonKey(name: "IsPublic", defaultValue: true)
  final bool isPublic;
  @override
  @JsonKey(name: "SmartContractUID")
  final String? uuid;
  @override
  @JsonKey(name: "Signature")
  final String? signature;
  @override
  @JsonKey(name: "Features")
  final List<Map<String, dynamic>>? features;

  @override
  String toString() {
    return 'CompilerPayload(name: $name, description: $description, address: $address, assetId: $assetId, isPublic: $isPublic, uuid: $uuid, signature: $signature, features: $features)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CompilerPayload &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality()
                .equals(other.description, description) &&
            const DeepCollectionEquality().equals(other.address, address) &&
            const DeepCollectionEquality().equals(other.assetId, assetId) &&
            const DeepCollectionEquality().equals(other.isPublic, isPublic) &&
            const DeepCollectionEquality().equals(other.uuid, uuid) &&
            const DeepCollectionEquality().equals(other.signature, signature) &&
            const DeepCollectionEquality().equals(other.features, features));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(description),
      const DeepCollectionEquality().hash(address),
      const DeepCollectionEquality().hash(assetId),
      const DeepCollectionEquality().hash(isPublic),
      const DeepCollectionEquality().hash(uuid),
      const DeepCollectionEquality().hash(signature),
      const DeepCollectionEquality().hash(features));

  @JsonKey(ignore: true)
  @override
  _$CompilerPayloadCopyWith<_CompilerPayload> get copyWith =>
      __$CompilerPayloadCopyWithImpl<_CompilerPayload>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CompilerPayloadToJson(this);
  }
}

abstract class _CompilerPayload extends CompilerPayload {
  factory _CompilerPayload(
          {@JsonKey(name: "Name") required String name,
          @JsonKey(name: "Description") required String description,
          @JsonKey(name: "Address") required String address,
          @JsonKey(name: "AssetId") required String assetId,
          @JsonKey(name: "IsPublic", defaultValue: true) required bool isPublic,
          @JsonKey(name: "SmartContractUID") String? uuid,
          @JsonKey(name: "Signature") String? signature,
          @JsonKey(name: "Features") List<Map<String, dynamic>>? features}) =
      _$_CompilerPayload;
  _CompilerPayload._() : super._();

  factory _CompilerPayload.fromJson(Map<String, dynamic> json) =
      _$_CompilerPayload.fromJson;

  @override
  @JsonKey(name: "Name")
  String get name;
  @override
  @JsonKey(name: "Description")
  String get description;
  @override
  @JsonKey(name: "Address")
  String get address;
  @override
  @JsonKey(name: "AssetId")
  String get assetId;
  @override // TODO: asset stuff
  @JsonKey(name: "IsPublic", defaultValue: true)
  bool get isPublic;
  @override
  @JsonKey(name: "SmartContractUID")
  String? get uuid;
  @override
  @JsonKey(name: "Signature")
  String? get signature;
  @override
  @JsonKey(name: "Features")
  List<Map<String, dynamic>>? get features;
  @override
  @JsonKey(ignore: true)
  _$CompilerPayloadCopyWith<_CompilerPayload> get copyWith =>
      throw _privateConstructorUsedError;
}
