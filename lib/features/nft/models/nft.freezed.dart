// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'nft.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Nft _$NftFromJson(Map<String, dynamic> json) {
  return _Nft.fromJson(json);
}

/// @nodoc
mixin _$Nft {
  @JsonKey(name: "Name")
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: "Description")
  String get description => throw _privateConstructorUsedError;
  @JsonKey(name: "CurrentOwner")
  String get currentOwner => throw _privateConstructorUsedError;
  @JsonKey(name: "MinterAddress")
  String get minterAddress => throw _privateConstructorUsedError;
  @JsonKey(name: "MinterName")
  String get minterName => throw _privateConstructorUsedError;
  @JsonKey(name: "SmartContractUID")
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: "SmartContractAsset")
  Asset get primaryAsset => throw _privateConstructorUsedError;
  @JsonKey(name: "IsPublic")
  bool get isPublic => throw _privateConstructorUsedError;
  @JsonKey(name: "IsPublished")
  bool get isPublished => throw _privateConstructorUsedError;
  @JsonKey(name: "IsMinter")
  bool get isMinter => throw _privateConstructorUsedError;
  @JsonKey(name: "Features", defaultValue: [])
  List<Map<String, dynamic>> get features => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: false)
  bool get isProcessing => throw _privateConstructorUsedError;
  String? get code => throw _privateConstructorUsedError;
  @JsonKey(toJson: nullToNull, fromJson: nullToNull)
  ProxiedAsset? get proxiedAsset => throw _privateConstructorUsedError;
  @JsonKey(toJson: nullToNull, fromJson: nullToNull)
  List<ProxiedAsset>? get additionalProxiedAssets =>
      throw _privateConstructorUsedError;
  @JsonKey(defaultValue: false)
  bool get assetsAvailable => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NftCopyWith<Nft> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NftCopyWith<$Res> {
  factory $NftCopyWith(Nft value, $Res Function(Nft) then) =
      _$NftCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: "Name")
          String name,
      @JsonKey(name: "Description")
          String description,
      @JsonKey(name: "CurrentOwner")
          String currentOwner,
      @JsonKey(name: "MinterAddress")
          String minterAddress,
      @JsonKey(name: "MinterName")
          String minterName,
      @JsonKey(name: "SmartContractUID")
          String id,
      @JsonKey(name: "SmartContractAsset")
          Asset primaryAsset,
      @JsonKey(name: "IsPublic")
          bool isPublic,
      @JsonKey(name: "IsPublished")
          bool isPublished,
      @JsonKey(name: "IsMinter")
          bool isMinter,
      @JsonKey(name: "Features", defaultValue: [])
          List<Map<String, dynamic>> features,
      @JsonKey(defaultValue: false)
          bool isProcessing,
      String? code,
      @JsonKey(toJson: nullToNull, fromJson: nullToNull)
          ProxiedAsset? proxiedAsset,
      @JsonKey(toJson: nullToNull, fromJson: nullToNull)
          List<ProxiedAsset>? additionalProxiedAssets,
      @JsonKey(defaultValue: false)
          bool assetsAvailable});

  $AssetCopyWith<$Res> get primaryAsset;
  $ProxiedAssetCopyWith<$Res>? get proxiedAsset;
}

/// @nodoc
class _$NftCopyWithImpl<$Res> implements $NftCopyWith<$Res> {
  _$NftCopyWithImpl(this._value, this._then);

  final Nft _value;
  // ignore: unused_field
  final $Res Function(Nft) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? description = freezed,
    Object? currentOwner = freezed,
    Object? minterAddress = freezed,
    Object? minterName = freezed,
    Object? id = freezed,
    Object? primaryAsset = freezed,
    Object? isPublic = freezed,
    Object? isPublished = freezed,
    Object? isMinter = freezed,
    Object? features = freezed,
    Object? isProcessing = freezed,
    Object? code = freezed,
    Object? proxiedAsset = freezed,
    Object? additionalProxiedAssets = freezed,
    Object? assetsAvailable = freezed,
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
      currentOwner: currentOwner == freezed
          ? _value.currentOwner
          : currentOwner // ignore: cast_nullable_to_non_nullable
              as String,
      minterAddress: minterAddress == freezed
          ? _value.minterAddress
          : minterAddress // ignore: cast_nullable_to_non_nullable
              as String,
      minterName: minterName == freezed
          ? _value.minterName
          : minterName // ignore: cast_nullable_to_non_nullable
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
      isMinter: isMinter == freezed
          ? _value.isMinter
          : isMinter // ignore: cast_nullable_to_non_nullable
              as bool,
      features: features == freezed
          ? _value.features
          : features // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
      isProcessing: isProcessing == freezed
          ? _value.isProcessing
          : isProcessing // ignore: cast_nullable_to_non_nullable
              as bool,
      code: code == freezed
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      proxiedAsset: proxiedAsset == freezed
          ? _value.proxiedAsset
          : proxiedAsset // ignore: cast_nullable_to_non_nullable
              as ProxiedAsset?,
      additionalProxiedAssets: additionalProxiedAssets == freezed
          ? _value.additionalProxiedAssets
          : additionalProxiedAssets // ignore: cast_nullable_to_non_nullable
              as List<ProxiedAsset>?,
      assetsAvailable: assetsAvailable == freezed
          ? _value.assetsAvailable
          : assetsAvailable // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  @override
  $AssetCopyWith<$Res> get primaryAsset {
    return $AssetCopyWith<$Res>(_value.primaryAsset, (value) {
      return _then(_value.copyWith(primaryAsset: value));
    });
  }

  @override
  $ProxiedAssetCopyWith<$Res>? get proxiedAsset {
    if (_value.proxiedAsset == null) {
      return null;
    }

    return $ProxiedAssetCopyWith<$Res>(_value.proxiedAsset!, (value) {
      return _then(_value.copyWith(proxiedAsset: value));
    });
  }
}

/// @nodoc
abstract class _$$_NftCopyWith<$Res> implements $NftCopyWith<$Res> {
  factory _$$_NftCopyWith(_$_Nft value, $Res Function(_$_Nft) then) =
      __$$_NftCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: "Name")
          String name,
      @JsonKey(name: "Description")
          String description,
      @JsonKey(name: "CurrentOwner")
          String currentOwner,
      @JsonKey(name: "MinterAddress")
          String minterAddress,
      @JsonKey(name: "MinterName")
          String minterName,
      @JsonKey(name: "SmartContractUID")
          String id,
      @JsonKey(name: "SmartContractAsset")
          Asset primaryAsset,
      @JsonKey(name: "IsPublic")
          bool isPublic,
      @JsonKey(name: "IsPublished")
          bool isPublished,
      @JsonKey(name: "IsMinter")
          bool isMinter,
      @JsonKey(name: "Features", defaultValue: [])
          List<Map<String, dynamic>> features,
      @JsonKey(defaultValue: false)
          bool isProcessing,
      String? code,
      @JsonKey(toJson: nullToNull, fromJson: nullToNull)
          ProxiedAsset? proxiedAsset,
      @JsonKey(toJson: nullToNull, fromJson: nullToNull)
          List<ProxiedAsset>? additionalProxiedAssets,
      @JsonKey(defaultValue: false)
          bool assetsAvailable});

  @override
  $AssetCopyWith<$Res> get primaryAsset;
  @override
  $ProxiedAssetCopyWith<$Res>? get proxiedAsset;
}

/// @nodoc
class __$$_NftCopyWithImpl<$Res> extends _$NftCopyWithImpl<$Res>
    implements _$$_NftCopyWith<$Res> {
  __$$_NftCopyWithImpl(_$_Nft _value, $Res Function(_$_Nft) _then)
      : super(_value, (v) => _then(v as _$_Nft));

  @override
  _$_Nft get _value => super._value as _$_Nft;

  @override
  $Res call({
    Object? name = freezed,
    Object? description = freezed,
    Object? currentOwner = freezed,
    Object? minterAddress = freezed,
    Object? minterName = freezed,
    Object? id = freezed,
    Object? primaryAsset = freezed,
    Object? isPublic = freezed,
    Object? isPublished = freezed,
    Object? isMinter = freezed,
    Object? features = freezed,
    Object? isProcessing = freezed,
    Object? code = freezed,
    Object? proxiedAsset = freezed,
    Object? additionalProxiedAssets = freezed,
    Object? assetsAvailable = freezed,
  }) {
    return _then(_$_Nft(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      currentOwner: currentOwner == freezed
          ? _value.currentOwner
          : currentOwner // ignore: cast_nullable_to_non_nullable
              as String,
      minterAddress: minterAddress == freezed
          ? _value.minterAddress
          : minterAddress // ignore: cast_nullable_to_non_nullable
              as String,
      minterName: minterName == freezed
          ? _value.minterName
          : minterName // ignore: cast_nullable_to_non_nullable
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
      isMinter: isMinter == freezed
          ? _value.isMinter
          : isMinter // ignore: cast_nullable_to_non_nullable
              as bool,
      features: features == freezed
          ? _value._features
          : features // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
      isProcessing: isProcessing == freezed
          ? _value.isProcessing
          : isProcessing // ignore: cast_nullable_to_non_nullable
              as bool,
      code: code == freezed
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      proxiedAsset: proxiedAsset == freezed
          ? _value.proxiedAsset
          : proxiedAsset // ignore: cast_nullable_to_non_nullable
              as ProxiedAsset?,
      additionalProxiedAssets: additionalProxiedAssets == freezed
          ? _value._additionalProxiedAssets
          : additionalProxiedAssets // ignore: cast_nullable_to_non_nullable
              as List<ProxiedAsset>?,
      assetsAvailable: assetsAvailable == freezed
          ? _value.assetsAvailable
          : assetsAvailable // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Nft extends _Nft {
  _$_Nft(
      {@JsonKey(name: "Name")
          required this.name,
      @JsonKey(name: "Description")
          required this.description,
      @JsonKey(name: "CurrentOwner")
          this.currentOwner = "",
      @JsonKey(name: "MinterAddress")
          this.minterAddress = "",
      @JsonKey(name: "MinterName")
          this.minterName = "",
      @JsonKey(name: "SmartContractUID")
          required this.id,
      @JsonKey(name: "SmartContractAsset")
          required this.primaryAsset,
      @JsonKey(name: "IsPublic")
          required this.isPublic,
      @JsonKey(name: "IsPublished")
          required this.isPublished,
      @JsonKey(name: "IsMinter")
          required this.isMinter,
      @JsonKey(name: "Features", defaultValue: [])
          required final List<Map<String, dynamic>> features,
      @JsonKey(defaultValue: false)
          required this.isProcessing,
      this.code,
      @JsonKey(toJson: nullToNull, fromJson: nullToNull)
          this.proxiedAsset,
      @JsonKey(toJson: nullToNull, fromJson: nullToNull)
          final List<ProxiedAsset>? additionalProxiedAssets,
      @JsonKey(defaultValue: false)
          required this.assetsAvailable})
      : _features = features,
        _additionalProxiedAssets = additionalProxiedAssets,
        super._();

  factory _$_Nft.fromJson(Map<String, dynamic> json) => _$$_NftFromJson(json);

  @override
  @JsonKey(name: "Name")
  final String name;
  @override
  @JsonKey(name: "Description")
  final String description;
  @override
  @JsonKey(name: "CurrentOwner")
  final String currentOwner;
  @override
  @JsonKey(name: "MinterAddress")
  final String minterAddress;
  @override
  @JsonKey(name: "MinterName")
  final String minterName;
  @override
  @JsonKey(name: "SmartContractUID")
  final String id;
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
  @JsonKey(name: "IsMinter")
  final bool isMinter;
  final List<Map<String, dynamic>> _features;
  @override
  @JsonKey(name: "Features", defaultValue: [])
  List<Map<String, dynamic>> get features {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_features);
  }

  @override
  @JsonKey(defaultValue: false)
  final bool isProcessing;
  @override
  final String? code;
  @override
  @JsonKey(toJson: nullToNull, fromJson: nullToNull)
  final ProxiedAsset? proxiedAsset;
  final List<ProxiedAsset>? _additionalProxiedAssets;
  @override
  @JsonKey(toJson: nullToNull, fromJson: nullToNull)
  List<ProxiedAsset>? get additionalProxiedAssets {
    final value = _additionalProxiedAssets;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(defaultValue: false)
  final bool assetsAvailable;

  @override
  String toString() {
    return 'Nft(name: $name, description: $description, currentOwner: $currentOwner, minterAddress: $minterAddress, minterName: $minterName, id: $id, primaryAsset: $primaryAsset, isPublic: $isPublic, isPublished: $isPublished, isMinter: $isMinter, features: $features, isProcessing: $isProcessing, code: $code, proxiedAsset: $proxiedAsset, additionalProxiedAssets: $additionalProxiedAssets, assetsAvailable: $assetsAvailable)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Nft &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality()
                .equals(other.description, description) &&
            const DeepCollectionEquality()
                .equals(other.currentOwner, currentOwner) &&
            const DeepCollectionEquality()
                .equals(other.minterAddress, minterAddress) &&
            const DeepCollectionEquality()
                .equals(other.minterName, minterName) &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality()
                .equals(other.primaryAsset, primaryAsset) &&
            const DeepCollectionEquality().equals(other.isPublic, isPublic) &&
            const DeepCollectionEquality()
                .equals(other.isPublished, isPublished) &&
            const DeepCollectionEquality().equals(other.isMinter, isMinter) &&
            const DeepCollectionEquality().equals(other._features, _features) &&
            const DeepCollectionEquality()
                .equals(other.isProcessing, isProcessing) &&
            const DeepCollectionEquality().equals(other.code, code) &&
            const DeepCollectionEquality()
                .equals(other.proxiedAsset, proxiedAsset) &&
            const DeepCollectionEquality().equals(
                other._additionalProxiedAssets, _additionalProxiedAssets) &&
            const DeepCollectionEquality()
                .equals(other.assetsAvailable, assetsAvailable));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(description),
      const DeepCollectionEquality().hash(currentOwner),
      const DeepCollectionEquality().hash(minterAddress),
      const DeepCollectionEquality().hash(minterName),
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(primaryAsset),
      const DeepCollectionEquality().hash(isPublic),
      const DeepCollectionEquality().hash(isPublished),
      const DeepCollectionEquality().hash(isMinter),
      const DeepCollectionEquality().hash(_features),
      const DeepCollectionEquality().hash(isProcessing),
      const DeepCollectionEquality().hash(code),
      const DeepCollectionEquality().hash(proxiedAsset),
      const DeepCollectionEquality().hash(_additionalProxiedAssets),
      const DeepCollectionEquality().hash(assetsAvailable));

  @JsonKey(ignore: true)
  @override
  _$$_NftCopyWith<_$_Nft> get copyWith =>
      __$$_NftCopyWithImpl<_$_Nft>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_NftToJson(this);
  }
}

abstract class _Nft extends Nft {
  factory _Nft(
      {@JsonKey(name: "Name")
          required final String name,
      @JsonKey(name: "Description")
          required final String description,
      @JsonKey(name: "CurrentOwner")
          final String currentOwner,
      @JsonKey(name: "MinterAddress")
          final String minterAddress,
      @JsonKey(name: "MinterName")
          final String minterName,
      @JsonKey(name: "SmartContractUID")
          required final String id,
      @JsonKey(name: "SmartContractAsset")
          required final Asset primaryAsset,
      @JsonKey(name: "IsPublic")
          required final bool isPublic,
      @JsonKey(name: "IsPublished")
          required final bool isPublished,
      @JsonKey(name: "IsMinter")
          required final bool isMinter,
      @JsonKey(name: "Features", defaultValue: [])
          required final List<Map<String, dynamic>> features,
      @JsonKey(defaultValue: false)
          required final bool isProcessing,
      final String? code,
      @JsonKey(toJson: nullToNull, fromJson: nullToNull)
          final ProxiedAsset? proxiedAsset,
      @JsonKey(toJson: nullToNull, fromJson: nullToNull)
          final List<ProxiedAsset>? additionalProxiedAssets,
      @JsonKey(defaultValue: false)
          required final bool assetsAvailable}) = _$_Nft;
  _Nft._() : super._();

  factory _Nft.fromJson(Map<String, dynamic> json) = _$_Nft.fromJson;

  @override
  @JsonKey(name: "Name")
  String get name => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "Description")
  String get description => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "CurrentOwner")
  String get currentOwner => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "MinterAddress")
  String get minterAddress => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "MinterName")
  String get minterName => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "SmartContractUID")
  String get id => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "SmartContractAsset")
  Asset get primaryAsset => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "IsPublic")
  bool get isPublic => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "IsPublished")
  bool get isPublished => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "IsMinter")
  bool get isMinter => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "Features", defaultValue: [])
  List<Map<String, dynamic>> get features => throw _privateConstructorUsedError;
  @override
  @JsonKey(defaultValue: false)
  bool get isProcessing => throw _privateConstructorUsedError;
  @override
  String? get code => throw _privateConstructorUsedError;
  @override
  @JsonKey(toJson: nullToNull, fromJson: nullToNull)
  ProxiedAsset? get proxiedAsset => throw _privateConstructorUsedError;
  @override
  @JsonKey(toJson: nullToNull, fromJson: nullToNull)
  List<ProxiedAsset>? get additionalProxiedAssets =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(defaultValue: false)
  bool get assetsAvailable => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_NftCopyWith<_$_Nft> get copyWith => throw _privateConstructorUsedError;
}
