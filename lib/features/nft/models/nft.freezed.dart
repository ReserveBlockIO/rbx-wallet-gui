// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

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
  @JsonKey(name: "Properties", fromJson: propertiesFromJson)
  List<ScProperty> get properties => throw _privateConstructorUsedError;
  @JsonKey(name: "NextOwner")
  String? get nextOwner => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: false)
  bool get isProcessing => throw _privateConstructorUsedError;
  String? get code => throw _privateConstructorUsedError;
  @JsonKey(toJson: nullToNull, fromJson: nullToNull)
  ProxiedAsset? get proxiedAsset => throw _privateConstructorUsedError;
  @JsonKey(toJson: nullToNull, fromJson: nullToNull)
  List<ProxiedAsset>? get additionalProxiedAssets =>
      throw _privateConstructorUsedError;
  @JsonKey(toJson: nullToNull, fromJson: nullToNull)
  List<Asset> get additionalLocalAssets => throw _privateConstructorUsedError;
  @JsonKey(toJson: nullToNull, fromJson: nullToNull)
  List<EvolvePhase> get updatedEvolutionPhases =>
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
      _$NftCopyWithImpl<$Res, Nft>;
  @useResult
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
      @JsonKey(name: "Properties", fromJson: propertiesFromJson)
          List<ScProperty> properties,
      @JsonKey(name: "NextOwner")
          String? nextOwner,
      @JsonKey(defaultValue: false)
          bool isProcessing,
      String? code,
      @JsonKey(toJson: nullToNull, fromJson: nullToNull)
          ProxiedAsset? proxiedAsset,
      @JsonKey(toJson: nullToNull, fromJson: nullToNull)
          List<ProxiedAsset>? additionalProxiedAssets,
      @JsonKey(toJson: nullToNull, fromJson: nullToNull)
          List<Asset> additionalLocalAssets,
      @JsonKey(toJson: nullToNull, fromJson: nullToNull)
          List<EvolvePhase> updatedEvolutionPhases,
      @JsonKey(defaultValue: false)
          bool assetsAvailable});

  $AssetCopyWith<$Res> get primaryAsset;
  $ProxiedAssetCopyWith<$Res>? get proxiedAsset;
}

/// @nodoc
class _$NftCopyWithImpl<$Res, $Val extends Nft> implements $NftCopyWith<$Res> {
  _$NftCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? description = null,
    Object? currentOwner = null,
    Object? minterAddress = null,
    Object? minterName = null,
    Object? id = null,
    Object? primaryAsset = null,
    Object? isPublic = null,
    Object? isPublished = null,
    Object? isMinter = null,
    Object? features = null,
    Object? properties = null,
    Object? nextOwner = freezed,
    Object? isProcessing = null,
    Object? code = freezed,
    Object? proxiedAsset = freezed,
    Object? additionalProxiedAssets = freezed,
    Object? additionalLocalAssets = null,
    Object? updatedEvolutionPhases = null,
    Object? assetsAvailable = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      currentOwner: null == currentOwner
          ? _value.currentOwner
          : currentOwner // ignore: cast_nullable_to_non_nullable
              as String,
      minterAddress: null == minterAddress
          ? _value.minterAddress
          : minterAddress // ignore: cast_nullable_to_non_nullable
              as String,
      minterName: null == minterName
          ? _value.minterName
          : minterName // ignore: cast_nullable_to_non_nullable
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
      isMinter: null == isMinter
          ? _value.isMinter
          : isMinter // ignore: cast_nullable_to_non_nullable
              as bool,
      features: null == features
          ? _value.features
          : features // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
      properties: null == properties
          ? _value.properties
          : properties // ignore: cast_nullable_to_non_nullable
              as List<ScProperty>,
      nextOwner: freezed == nextOwner
          ? _value.nextOwner
          : nextOwner // ignore: cast_nullable_to_non_nullable
              as String?,
      isProcessing: null == isProcessing
          ? _value.isProcessing
          : isProcessing // ignore: cast_nullable_to_non_nullable
              as bool,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      proxiedAsset: freezed == proxiedAsset
          ? _value.proxiedAsset
          : proxiedAsset // ignore: cast_nullable_to_non_nullable
              as ProxiedAsset?,
      additionalProxiedAssets: freezed == additionalProxiedAssets
          ? _value.additionalProxiedAssets
          : additionalProxiedAssets // ignore: cast_nullable_to_non_nullable
              as List<ProxiedAsset>?,
      additionalLocalAssets: null == additionalLocalAssets
          ? _value.additionalLocalAssets
          : additionalLocalAssets // ignore: cast_nullable_to_non_nullable
              as List<Asset>,
      updatedEvolutionPhases: null == updatedEvolutionPhases
          ? _value.updatedEvolutionPhases
          : updatedEvolutionPhases // ignore: cast_nullable_to_non_nullable
              as List<EvolvePhase>,
      assetsAvailable: null == assetsAvailable
          ? _value.assetsAvailable
          : assetsAvailable // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AssetCopyWith<$Res> get primaryAsset {
    return $AssetCopyWith<$Res>(_value.primaryAsset, (value) {
      return _then(_value.copyWith(primaryAsset: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ProxiedAssetCopyWith<$Res>? get proxiedAsset {
    if (_value.proxiedAsset == null) {
      return null;
    }

    return $ProxiedAssetCopyWith<$Res>(_value.proxiedAsset!, (value) {
      return _then(_value.copyWith(proxiedAsset: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_NftCopyWith<$Res> implements $NftCopyWith<$Res> {
  factory _$$_NftCopyWith(_$_Nft value, $Res Function(_$_Nft) then) =
      __$$_NftCopyWithImpl<$Res>;
  @override
  @useResult
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
      @JsonKey(name: "Properties", fromJson: propertiesFromJson)
          List<ScProperty> properties,
      @JsonKey(name: "NextOwner")
          String? nextOwner,
      @JsonKey(defaultValue: false)
          bool isProcessing,
      String? code,
      @JsonKey(toJson: nullToNull, fromJson: nullToNull)
          ProxiedAsset? proxiedAsset,
      @JsonKey(toJson: nullToNull, fromJson: nullToNull)
          List<ProxiedAsset>? additionalProxiedAssets,
      @JsonKey(toJson: nullToNull, fromJson: nullToNull)
          List<Asset> additionalLocalAssets,
      @JsonKey(toJson: nullToNull, fromJson: nullToNull)
          List<EvolvePhase> updatedEvolutionPhases,
      @JsonKey(defaultValue: false)
          bool assetsAvailable});

  @override
  $AssetCopyWith<$Res> get primaryAsset;
  @override
  $ProxiedAssetCopyWith<$Res>? get proxiedAsset;
}

/// @nodoc
class __$$_NftCopyWithImpl<$Res> extends _$NftCopyWithImpl<$Res, _$_Nft>
    implements _$$_NftCopyWith<$Res> {
  __$$_NftCopyWithImpl(_$_Nft _value, $Res Function(_$_Nft) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? description = null,
    Object? currentOwner = null,
    Object? minterAddress = null,
    Object? minterName = null,
    Object? id = null,
    Object? primaryAsset = null,
    Object? isPublic = null,
    Object? isPublished = null,
    Object? isMinter = null,
    Object? features = null,
    Object? properties = null,
    Object? nextOwner = freezed,
    Object? isProcessing = null,
    Object? code = freezed,
    Object? proxiedAsset = freezed,
    Object? additionalProxiedAssets = freezed,
    Object? additionalLocalAssets = null,
    Object? updatedEvolutionPhases = null,
    Object? assetsAvailable = null,
  }) {
    return _then(_$_Nft(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      currentOwner: null == currentOwner
          ? _value.currentOwner
          : currentOwner // ignore: cast_nullable_to_non_nullable
              as String,
      minterAddress: null == minterAddress
          ? _value.minterAddress
          : minterAddress // ignore: cast_nullable_to_non_nullable
              as String,
      minterName: null == minterName
          ? _value.minterName
          : minterName // ignore: cast_nullable_to_non_nullable
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
      isMinter: null == isMinter
          ? _value.isMinter
          : isMinter // ignore: cast_nullable_to_non_nullable
              as bool,
      features: null == features
          ? _value._features
          : features // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
      properties: null == properties
          ? _value._properties
          : properties // ignore: cast_nullable_to_non_nullable
              as List<ScProperty>,
      nextOwner: freezed == nextOwner
          ? _value.nextOwner
          : nextOwner // ignore: cast_nullable_to_non_nullable
              as String?,
      isProcessing: null == isProcessing
          ? _value.isProcessing
          : isProcessing // ignore: cast_nullable_to_non_nullable
              as bool,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      proxiedAsset: freezed == proxiedAsset
          ? _value.proxiedAsset
          : proxiedAsset // ignore: cast_nullable_to_non_nullable
              as ProxiedAsset?,
      additionalProxiedAssets: freezed == additionalProxiedAssets
          ? _value._additionalProxiedAssets
          : additionalProxiedAssets // ignore: cast_nullable_to_non_nullable
              as List<ProxiedAsset>?,
      additionalLocalAssets: null == additionalLocalAssets
          ? _value._additionalLocalAssets
          : additionalLocalAssets // ignore: cast_nullable_to_non_nullable
              as List<Asset>,
      updatedEvolutionPhases: null == updatedEvolutionPhases
          ? _value._updatedEvolutionPhases
          : updatedEvolutionPhases // ignore: cast_nullable_to_non_nullable
              as List<EvolvePhase>,
      assetsAvailable: null == assetsAvailable
          ? _value.assetsAvailable
          : assetsAvailable // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
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
      @JsonKey(name: "Properties", fromJson: propertiesFromJson)
          final List<ScProperty> properties = const [],
      @JsonKey(name: "NextOwner")
          this.nextOwner,
      @JsonKey(defaultValue: false)
          required this.isProcessing,
      this.code,
      @JsonKey(toJson: nullToNull, fromJson: nullToNull)
          this.proxiedAsset,
      @JsonKey(toJson: nullToNull, fromJson: nullToNull)
          final List<ProxiedAsset>? additionalProxiedAssets,
      @JsonKey(toJson: nullToNull, fromJson: nullToNull)
          final List<Asset> additionalLocalAssets = const [],
      @JsonKey(toJson: nullToNull, fromJson: nullToNull)
          final List<EvolvePhase> updatedEvolutionPhases = const [],
      @JsonKey(defaultValue: false)
          required this.assetsAvailable})
      : _features = features,
        _properties = properties,
        _additionalProxiedAssets = additionalProxiedAssets,
        _additionalLocalAssets = additionalLocalAssets,
        _updatedEvolutionPhases = updatedEvolutionPhases,
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
    if (_features is EqualUnmodifiableListView) return _features;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_features);
  }

  final List<ScProperty> _properties;
  @override
  @JsonKey(name: "Properties", fromJson: propertiesFromJson)
  List<ScProperty> get properties {
    if (_properties is EqualUnmodifiableListView) return _properties;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_properties);
  }

  @override
  @JsonKey(name: "NextOwner")
  final String? nextOwner;
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
    if (_additionalProxiedAssets is EqualUnmodifiableListView)
      return _additionalProxiedAssets;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<Asset> _additionalLocalAssets;
  @override
  @JsonKey(toJson: nullToNull, fromJson: nullToNull)
  List<Asset> get additionalLocalAssets {
    if (_additionalLocalAssets is EqualUnmodifiableListView)
      return _additionalLocalAssets;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_additionalLocalAssets);
  }

  final List<EvolvePhase> _updatedEvolutionPhases;
  @override
  @JsonKey(toJson: nullToNull, fromJson: nullToNull)
  List<EvolvePhase> get updatedEvolutionPhases {
    if (_updatedEvolutionPhases is EqualUnmodifiableListView)
      return _updatedEvolutionPhases;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_updatedEvolutionPhases);
  }

  @override
  @JsonKey(defaultValue: false)
  final bool assetsAvailable;

  @override
  String toString() {
    return 'Nft(name: $name, description: $description, currentOwner: $currentOwner, minterAddress: $minterAddress, minterName: $minterName, id: $id, primaryAsset: $primaryAsset, isPublic: $isPublic, isPublished: $isPublished, isMinter: $isMinter, features: $features, properties: $properties, nextOwner: $nextOwner, isProcessing: $isProcessing, code: $code, proxiedAsset: $proxiedAsset, additionalProxiedAssets: $additionalProxiedAssets, additionalLocalAssets: $additionalLocalAssets, updatedEvolutionPhases: $updatedEvolutionPhases, assetsAvailable: $assetsAvailable)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Nft &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.currentOwner, currentOwner) ||
                other.currentOwner == currentOwner) &&
            (identical(other.minterAddress, minterAddress) ||
                other.minterAddress == minterAddress) &&
            (identical(other.minterName, minterName) ||
                other.minterName == minterName) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.primaryAsset, primaryAsset) ||
                other.primaryAsset == primaryAsset) &&
            (identical(other.isPublic, isPublic) ||
                other.isPublic == isPublic) &&
            (identical(other.isPublished, isPublished) ||
                other.isPublished == isPublished) &&
            (identical(other.isMinter, isMinter) ||
                other.isMinter == isMinter) &&
            const DeepCollectionEquality().equals(other._features, _features) &&
            const DeepCollectionEquality()
                .equals(other._properties, _properties) &&
            (identical(other.nextOwner, nextOwner) ||
                other.nextOwner == nextOwner) &&
            (identical(other.isProcessing, isProcessing) ||
                other.isProcessing == isProcessing) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.proxiedAsset, proxiedAsset) ||
                other.proxiedAsset == proxiedAsset) &&
            const DeepCollectionEquality().equals(
                other._additionalProxiedAssets, _additionalProxiedAssets) &&
            const DeepCollectionEquality()
                .equals(other._additionalLocalAssets, _additionalLocalAssets) &&
            const DeepCollectionEquality().equals(
                other._updatedEvolutionPhases, _updatedEvolutionPhases) &&
            (identical(other.assetsAvailable, assetsAvailable) ||
                other.assetsAvailable == assetsAvailable));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        name,
        description,
        currentOwner,
        minterAddress,
        minterName,
        id,
        primaryAsset,
        isPublic,
        isPublished,
        isMinter,
        const DeepCollectionEquality().hash(_features),
        const DeepCollectionEquality().hash(_properties),
        nextOwner,
        isProcessing,
        code,
        proxiedAsset,
        const DeepCollectionEquality().hash(_additionalProxiedAssets),
        const DeepCollectionEquality().hash(_additionalLocalAssets),
        const DeepCollectionEquality().hash(_updatedEvolutionPhases),
        assetsAvailable
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NftCopyWith<_$_Nft> get copyWith =>
      __$$_NftCopyWithImpl<_$_Nft>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_NftToJson(
      this,
    );
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
      @JsonKey(name: "Properties", fromJson: propertiesFromJson)
          final List<ScProperty> properties,
      @JsonKey(name: "NextOwner")
          final String? nextOwner,
      @JsonKey(defaultValue: false)
          required final bool isProcessing,
      final String? code,
      @JsonKey(toJson: nullToNull, fromJson: nullToNull)
          final ProxiedAsset? proxiedAsset,
      @JsonKey(toJson: nullToNull, fromJson: nullToNull)
          final List<ProxiedAsset>? additionalProxiedAssets,
      @JsonKey(toJson: nullToNull, fromJson: nullToNull)
          final List<Asset> additionalLocalAssets,
      @JsonKey(toJson: nullToNull, fromJson: nullToNull)
          final List<EvolvePhase> updatedEvolutionPhases,
      @JsonKey(defaultValue: false)
          required final bool assetsAvailable}) = _$_Nft;
  _Nft._() : super._();

  factory _Nft.fromJson(Map<String, dynamic> json) = _$_Nft.fromJson;

  @override
  @JsonKey(name: "Name")
  String get name;
  @override
  @JsonKey(name: "Description")
  String get description;
  @override
  @JsonKey(name: "CurrentOwner")
  String get currentOwner;
  @override
  @JsonKey(name: "MinterAddress")
  String get minterAddress;
  @override
  @JsonKey(name: "MinterName")
  String get minterName;
  @override
  @JsonKey(name: "SmartContractUID")
  String get id;
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
  @JsonKey(name: "IsMinter")
  bool get isMinter;
  @override
  @JsonKey(name: "Features", defaultValue: [])
  List<Map<String, dynamic>> get features;
  @override
  @JsonKey(name: "Properties", fromJson: propertiesFromJson)
  List<ScProperty> get properties;
  @override
  @JsonKey(name: "NextOwner")
  String? get nextOwner;
  @override
  @JsonKey(defaultValue: false)
  bool get isProcessing;
  @override
  String? get code;
  @override
  @JsonKey(toJson: nullToNull, fromJson: nullToNull)
  ProxiedAsset? get proxiedAsset;
  @override
  @JsonKey(toJson: nullToNull, fromJson: nullToNull)
  List<ProxiedAsset>? get additionalProxiedAssets;
  @override
  @JsonKey(toJson: nullToNull, fromJson: nullToNull)
  List<Asset> get additionalLocalAssets;
  @override
  @JsonKey(toJson: nullToNull, fromJson: nullToNull)
  List<EvolvePhase> get updatedEvolutionPhases;
  @override
  @JsonKey(defaultValue: false)
  bool get assetsAvailable;
  @override
  @JsonKey(ignore: true)
  _$$_NftCopyWith<_$_Nft> get copyWith => throw _privateConstructorUsedError;
}
