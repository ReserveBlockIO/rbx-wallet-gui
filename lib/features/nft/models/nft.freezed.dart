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
  @JsonKey(ignore: true)
  WebAsset? get primaryAssetWeb => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  List<WebAsset>? get additionalAssetsWeb =>
      throw _privateConstructorUsedError; // @JsonKey(ignore: true) List<WebAsset>? evolveAssetsWeb,
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
  @JsonKey(name: "IsLocked")
  bool get isLocked => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: false)
  bool get isProcessing => throw _privateConstructorUsedError;
  String? get code =>
      throw _privateConstructorUsedError; // @JsonKey(ignore: true) List<ProxiedAsset>? additionalProxiedAssets,
  @JsonKey(ignore: true)
  List<Asset> get additionalLocalAssets => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  List<EvolvePhase> get updatedEvolutionPhases =>
      throw _privateConstructorUsedError; // @JsonKey(defaultValue: false) required bool assetsAvailable,
// Map<String, dynamic>? assetUrls,
  @JsonKey(ignore: true)
  String? get thumbsPath => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  TokenDetails? get tokenStateDetails => throw _privateConstructorUsedError;

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
      @JsonKey(ignore: true)
          WebAsset? primaryAssetWeb,
      @JsonKey(ignore: true)
          List<WebAsset>? additionalAssetsWeb,
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
      @JsonKey(name: "IsLocked")
          bool isLocked,
      @JsonKey(defaultValue: false)
          bool isProcessing,
      String? code,
      @JsonKey(ignore: true)
          List<Asset> additionalLocalAssets,
      @JsonKey(ignore: true)
          List<EvolvePhase> updatedEvolutionPhases,
      @JsonKey(ignore: true)
          String? thumbsPath,
      @JsonKey(ignore: true)
          TokenDetails? tokenStateDetails});

  $AssetCopyWith<$Res> get primaryAsset;
  $TokenDetailsCopyWith<$Res>? get tokenStateDetails;
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
    Object? primaryAssetWeb = freezed,
    Object? additionalAssetsWeb = freezed,
    Object? isPublic = null,
    Object? isPublished = null,
    Object? isMinter = null,
    Object? features = null,
    Object? properties = null,
    Object? nextOwner = freezed,
    Object? isLocked = null,
    Object? isProcessing = null,
    Object? code = freezed,
    Object? additionalLocalAssets = null,
    Object? updatedEvolutionPhases = null,
    Object? thumbsPath = freezed,
    Object? tokenStateDetails = freezed,
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
      primaryAssetWeb: freezed == primaryAssetWeb
          ? _value.primaryAssetWeb
          : primaryAssetWeb // ignore: cast_nullable_to_non_nullable
              as WebAsset?,
      additionalAssetsWeb: freezed == additionalAssetsWeb
          ? _value.additionalAssetsWeb
          : additionalAssetsWeb // ignore: cast_nullable_to_non_nullable
              as List<WebAsset>?,
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
      isLocked: null == isLocked
          ? _value.isLocked
          : isLocked // ignore: cast_nullable_to_non_nullable
              as bool,
      isProcessing: null == isProcessing
          ? _value.isProcessing
          : isProcessing // ignore: cast_nullable_to_non_nullable
              as bool,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      additionalLocalAssets: null == additionalLocalAssets
          ? _value.additionalLocalAssets
          : additionalLocalAssets // ignore: cast_nullable_to_non_nullable
              as List<Asset>,
      updatedEvolutionPhases: null == updatedEvolutionPhases
          ? _value.updatedEvolutionPhases
          : updatedEvolutionPhases // ignore: cast_nullable_to_non_nullable
              as List<EvolvePhase>,
      thumbsPath: freezed == thumbsPath
          ? _value.thumbsPath
          : thumbsPath // ignore: cast_nullable_to_non_nullable
              as String?,
      tokenStateDetails: freezed == tokenStateDetails
          ? _value.tokenStateDetails
          : tokenStateDetails // ignore: cast_nullable_to_non_nullable
              as TokenDetails?,
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
  $TokenDetailsCopyWith<$Res>? get tokenStateDetails {
    if (_value.tokenStateDetails == null) {
      return null;
    }

    return $TokenDetailsCopyWith<$Res>(_value.tokenStateDetails!, (value) {
      return _then(_value.copyWith(tokenStateDetails: value) as $Val);
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
      @JsonKey(ignore: true)
          WebAsset? primaryAssetWeb,
      @JsonKey(ignore: true)
          List<WebAsset>? additionalAssetsWeb,
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
      @JsonKey(name: "IsLocked")
          bool isLocked,
      @JsonKey(defaultValue: false)
          bool isProcessing,
      String? code,
      @JsonKey(ignore: true)
          List<Asset> additionalLocalAssets,
      @JsonKey(ignore: true)
          List<EvolvePhase> updatedEvolutionPhases,
      @JsonKey(ignore: true)
          String? thumbsPath,
      @JsonKey(ignore: true)
          TokenDetails? tokenStateDetails});

  @override
  $AssetCopyWith<$Res> get primaryAsset;
  @override
  $TokenDetailsCopyWith<$Res>? get tokenStateDetails;
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
    Object? primaryAssetWeb = freezed,
    Object? additionalAssetsWeb = freezed,
    Object? isPublic = null,
    Object? isPublished = null,
    Object? isMinter = null,
    Object? features = null,
    Object? properties = null,
    Object? nextOwner = freezed,
    Object? isLocked = null,
    Object? isProcessing = null,
    Object? code = freezed,
    Object? additionalLocalAssets = null,
    Object? updatedEvolutionPhases = null,
    Object? thumbsPath = freezed,
    Object? tokenStateDetails = freezed,
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
      primaryAssetWeb: freezed == primaryAssetWeb
          ? _value.primaryAssetWeb
          : primaryAssetWeb // ignore: cast_nullable_to_non_nullable
              as WebAsset?,
      additionalAssetsWeb: freezed == additionalAssetsWeb
          ? _value._additionalAssetsWeb
          : additionalAssetsWeb // ignore: cast_nullable_to_non_nullable
              as List<WebAsset>?,
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
      isLocked: null == isLocked
          ? _value.isLocked
          : isLocked // ignore: cast_nullable_to_non_nullable
              as bool,
      isProcessing: null == isProcessing
          ? _value.isProcessing
          : isProcessing // ignore: cast_nullable_to_non_nullable
              as bool,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      additionalLocalAssets: null == additionalLocalAssets
          ? _value._additionalLocalAssets
          : additionalLocalAssets // ignore: cast_nullable_to_non_nullable
              as List<Asset>,
      updatedEvolutionPhases: null == updatedEvolutionPhases
          ? _value._updatedEvolutionPhases
          : updatedEvolutionPhases // ignore: cast_nullable_to_non_nullable
              as List<EvolvePhase>,
      thumbsPath: freezed == thumbsPath
          ? _value.thumbsPath
          : thumbsPath // ignore: cast_nullable_to_non_nullable
              as String?,
      tokenStateDetails: freezed == tokenStateDetails
          ? _value.tokenStateDetails
          : tokenStateDetails // ignore: cast_nullable_to_non_nullable
              as TokenDetails?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_Nft extends _Nft with DiagnosticableTreeMixin {
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
      @JsonKey(ignore: true)
          this.primaryAssetWeb,
      @JsonKey(ignore: true)
          final List<WebAsset>? additionalAssetsWeb,
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
      @JsonKey(name: "IsLocked")
          this.isLocked = false,
      @JsonKey(defaultValue: false)
          required this.isProcessing,
      this.code,
      @JsonKey(ignore: true)
          final List<Asset> additionalLocalAssets = const [],
      @JsonKey(ignore: true)
          final List<EvolvePhase> updatedEvolutionPhases = const [],
      @JsonKey(ignore: true)
          this.thumbsPath,
      @JsonKey(ignore: true)
          this.tokenStateDetails})
      : _additionalAssetsWeb = additionalAssetsWeb,
        _features = features,
        _properties = properties,
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
  @JsonKey(ignore: true)
  final WebAsset? primaryAssetWeb;
  final List<WebAsset>? _additionalAssetsWeb;
  @override
  @JsonKey(ignore: true)
  List<WebAsset>? get additionalAssetsWeb {
    final value = _additionalAssetsWeb;
    if (value == null) return null;
    if (_additionalAssetsWeb is EqualUnmodifiableListView)
      return _additionalAssetsWeb;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

// @JsonKey(ignore: true) List<WebAsset>? evolveAssetsWeb,
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
  @JsonKey(name: "IsLocked")
  final bool isLocked;
  @override
  @JsonKey(defaultValue: false)
  final bool isProcessing;
  @override
  final String? code;
// @JsonKey(ignore: true) List<ProxiedAsset>? additionalProxiedAssets,
  final List<Asset> _additionalLocalAssets;
// @JsonKey(ignore: true) List<ProxiedAsset>? additionalProxiedAssets,
  @override
  @JsonKey(ignore: true)
  List<Asset> get additionalLocalAssets {
    if (_additionalLocalAssets is EqualUnmodifiableListView)
      return _additionalLocalAssets;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_additionalLocalAssets);
  }

  final List<EvolvePhase> _updatedEvolutionPhases;
  @override
  @JsonKey(ignore: true)
  List<EvolvePhase> get updatedEvolutionPhases {
    if (_updatedEvolutionPhases is EqualUnmodifiableListView)
      return _updatedEvolutionPhases;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_updatedEvolutionPhases);
  }

// @JsonKey(defaultValue: false) required bool assetsAvailable,
// Map<String, dynamic>? assetUrls,
  @override
  @JsonKey(ignore: true)
  final String? thumbsPath;
  @override
  @JsonKey(ignore: true)
  final TokenDetails? tokenStateDetails;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Nft(name: $name, description: $description, currentOwner: $currentOwner, minterAddress: $minterAddress, minterName: $minterName, id: $id, primaryAsset: $primaryAsset, primaryAssetWeb: $primaryAssetWeb, additionalAssetsWeb: $additionalAssetsWeb, isPublic: $isPublic, isPublished: $isPublished, isMinter: $isMinter, features: $features, properties: $properties, nextOwner: $nextOwner, isLocked: $isLocked, isProcessing: $isProcessing, code: $code, additionalLocalAssets: $additionalLocalAssets, updatedEvolutionPhases: $updatedEvolutionPhases, thumbsPath: $thumbsPath, tokenStateDetails: $tokenStateDetails)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Nft'))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('description', description))
      ..add(DiagnosticsProperty('currentOwner', currentOwner))
      ..add(DiagnosticsProperty('minterAddress', minterAddress))
      ..add(DiagnosticsProperty('minterName', minterName))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('primaryAsset', primaryAsset))
      ..add(DiagnosticsProperty('primaryAssetWeb', primaryAssetWeb))
      ..add(DiagnosticsProperty('additionalAssetsWeb', additionalAssetsWeb))
      ..add(DiagnosticsProperty('isPublic', isPublic))
      ..add(DiagnosticsProperty('isPublished', isPublished))
      ..add(DiagnosticsProperty('isMinter', isMinter))
      ..add(DiagnosticsProperty('features', features))
      ..add(DiagnosticsProperty('properties', properties))
      ..add(DiagnosticsProperty('nextOwner', nextOwner))
      ..add(DiagnosticsProperty('isLocked', isLocked))
      ..add(DiagnosticsProperty('isProcessing', isProcessing))
      ..add(DiagnosticsProperty('code', code))
      ..add(DiagnosticsProperty('additionalLocalAssets', additionalLocalAssets))
      ..add(
          DiagnosticsProperty('updatedEvolutionPhases', updatedEvolutionPhases))
      ..add(DiagnosticsProperty('thumbsPath', thumbsPath))
      ..add(DiagnosticsProperty('tokenStateDetails', tokenStateDetails));
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
            (identical(other.primaryAssetWeb, primaryAssetWeb) ||
                other.primaryAssetWeb == primaryAssetWeb) &&
            const DeepCollectionEquality()
                .equals(other._additionalAssetsWeb, _additionalAssetsWeb) &&
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
            (identical(other.isLocked, isLocked) ||
                other.isLocked == isLocked) &&
            (identical(other.isProcessing, isProcessing) ||
                other.isProcessing == isProcessing) &&
            (identical(other.code, code) || other.code == code) &&
            const DeepCollectionEquality()
                .equals(other._additionalLocalAssets, _additionalLocalAssets) &&
            const DeepCollectionEquality().equals(
                other._updatedEvolutionPhases, _updatedEvolutionPhases) &&
            (identical(other.thumbsPath, thumbsPath) ||
                other.thumbsPath == thumbsPath) &&
            (identical(other.tokenStateDetails, tokenStateDetails) ||
                other.tokenStateDetails == tokenStateDetails));
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
        primaryAssetWeb,
        const DeepCollectionEquality().hash(_additionalAssetsWeb),
        isPublic,
        isPublished,
        isMinter,
        const DeepCollectionEquality().hash(_features),
        const DeepCollectionEquality().hash(_properties),
        nextOwner,
        isLocked,
        isProcessing,
        code,
        const DeepCollectionEquality().hash(_additionalLocalAssets),
        const DeepCollectionEquality().hash(_updatedEvolutionPhases),
        thumbsPath,
        tokenStateDetails
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
      @JsonKey(ignore: true)
          final WebAsset? primaryAssetWeb,
      @JsonKey(ignore: true)
          final List<WebAsset>? additionalAssetsWeb,
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
      @JsonKey(name: "IsLocked")
          final bool isLocked,
      @JsonKey(defaultValue: false)
          required final bool isProcessing,
      final String? code,
      @JsonKey(ignore: true)
          final List<Asset> additionalLocalAssets,
      @JsonKey(ignore: true)
          final List<EvolvePhase> updatedEvolutionPhases,
      @JsonKey(ignore: true)
          final String? thumbsPath,
      @JsonKey(ignore: true)
          final TokenDetails? tokenStateDetails}) = _$_Nft;
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
  @JsonKey(ignore: true)
  WebAsset? get primaryAssetWeb;
  @override
  @JsonKey(ignore: true)
  List<WebAsset>? get additionalAssetsWeb;
  @override // @JsonKey(ignore: true) List<WebAsset>? evolveAssetsWeb,
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
  @JsonKey(name: "IsLocked")
  bool get isLocked;
  @override
  @JsonKey(defaultValue: false)
  bool get isProcessing;
  @override
  String? get code;
  @override // @JsonKey(ignore: true) List<ProxiedAsset>? additionalProxiedAssets,
  @JsonKey(ignore: true)
  List<Asset> get additionalLocalAssets;
  @override
  @JsonKey(ignore: true)
  List<EvolvePhase> get updatedEvolutionPhases;
  @override // @JsonKey(defaultValue: false) required bool assetsAvailable,
// Map<String, dynamic>? assetUrls,
  @JsonKey(ignore: true)
  String? get thumbsPath;
  @override
  @JsonKey(ignore: true)
  TokenDetails? get tokenStateDetails;
  @override
  @JsonKey(ignore: true)
  _$$_NftCopyWith<_$_Nft> get copyWith => throw _privateConstructorUsedError;
}
