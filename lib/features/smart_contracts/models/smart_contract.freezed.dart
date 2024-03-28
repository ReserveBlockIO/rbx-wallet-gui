// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'smart_contract.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SmartContract _$SmartContractFromJson(Map<String, dynamic> json) {
  return _SmartContract.fromJson(json);
}

/// @nodoc
mixin _$SmartContract {
  Wallet get owner => throw _privateConstructorUsedError;
  String get draftId => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get minterName => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get thumbnail => throw _privateConstructorUsedError;
  Asset? get primaryAsset => throw _privateConstructorUsedError;
  List<Rarity> get rarities =>
      throw _privateConstructorUsedError; // @Default([]) List<Feature> features,
  List<Stat> get stats => throw _privateConstructorUsedError;
  List<Royalty> get royalties => throw _privateConstructorUsedError;
  List<Evolve> get evolves => throw _privateConstructorUsedError;
  List<Ticket> get tickets => throw _privateConstructorUsedError;
  List<MultiAsset> get multiAssets => throw _privateConstructorUsedError;
  List<Tokenization> get tokenizations => throw _privateConstructorUsedError;
  List<Fractional> get fractionals => throw _privateConstructorUsedError;
  List<Pair> get pairs => throw _privateConstructorUsedError;
  List<SoulBound> get soulBounds => throw _privateConstructorUsedError;
  dynamic get includesBtcTokenization => throw _privateConstructorUsedError;
  String get code => throw _privateConstructorUsedError;
  bool get isCompiled => throw _privateConstructorUsedError;
  bool get isPublished => throw _privateConstructorUsedError;
  List<ScProperty> get properties => throw _privateConstructorUsedError;
  TokenScFeature? get token => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SmartContractCopyWith<SmartContract> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SmartContractCopyWith<$Res> {
  factory $SmartContractCopyWith(
          SmartContract value, $Res Function(SmartContract) then) =
      _$SmartContractCopyWithImpl<$Res, SmartContract>;
  @useResult
  $Res call(
      {Wallet owner,
      String draftId,
      String id,
      String name,
      String minterName,
      String description,
      String thumbnail,
      Asset? primaryAsset,
      List<Rarity> rarities,
      List<Stat> stats,
      List<Royalty> royalties,
      List<Evolve> evolves,
      List<Ticket> tickets,
      List<MultiAsset> multiAssets,
      List<Tokenization> tokenizations,
      List<Fractional> fractionals,
      List<Pair> pairs,
      List<SoulBound> soulBounds,
      dynamic includesBtcTokenization,
      String code,
      bool isCompiled,
      bool isPublished,
      List<ScProperty> properties,
      TokenScFeature? token});

  $WalletCopyWith<$Res> get owner;
  $AssetCopyWith<$Res>? get primaryAsset;
  $TokenScFeatureCopyWith<$Res>? get token;
}

/// @nodoc
class _$SmartContractCopyWithImpl<$Res, $Val extends SmartContract>
    implements $SmartContractCopyWith<$Res> {
  _$SmartContractCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? owner = null,
    Object? draftId = null,
    Object? id = null,
    Object? name = null,
    Object? minterName = null,
    Object? description = null,
    Object? thumbnail = null,
    Object? primaryAsset = freezed,
    Object? rarities = null,
    Object? stats = null,
    Object? royalties = null,
    Object? evolves = null,
    Object? tickets = null,
    Object? multiAssets = null,
    Object? tokenizations = null,
    Object? fractionals = null,
    Object? pairs = null,
    Object? soulBounds = null,
    Object? includesBtcTokenization = freezed,
    Object? code = null,
    Object? isCompiled = null,
    Object? isPublished = null,
    Object? properties = null,
    Object? token = freezed,
  }) {
    return _then(_value.copyWith(
      owner: null == owner
          ? _value.owner
          : owner // ignore: cast_nullable_to_non_nullable
              as Wallet,
      draftId: null == draftId
          ? _value.draftId
          : draftId // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
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
      thumbnail: null == thumbnail
          ? _value.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as String,
      primaryAsset: freezed == primaryAsset
          ? _value.primaryAsset
          : primaryAsset // ignore: cast_nullable_to_non_nullable
              as Asset?,
      rarities: null == rarities
          ? _value.rarities
          : rarities // ignore: cast_nullable_to_non_nullable
              as List<Rarity>,
      stats: null == stats
          ? _value.stats
          : stats // ignore: cast_nullable_to_non_nullable
              as List<Stat>,
      royalties: null == royalties
          ? _value.royalties
          : royalties // ignore: cast_nullable_to_non_nullable
              as List<Royalty>,
      evolves: null == evolves
          ? _value.evolves
          : evolves // ignore: cast_nullable_to_non_nullable
              as List<Evolve>,
      tickets: null == tickets
          ? _value.tickets
          : tickets // ignore: cast_nullable_to_non_nullable
              as List<Ticket>,
      multiAssets: null == multiAssets
          ? _value.multiAssets
          : multiAssets // ignore: cast_nullable_to_non_nullable
              as List<MultiAsset>,
      tokenizations: null == tokenizations
          ? _value.tokenizations
          : tokenizations // ignore: cast_nullable_to_non_nullable
              as List<Tokenization>,
      fractionals: null == fractionals
          ? _value.fractionals
          : fractionals // ignore: cast_nullable_to_non_nullable
              as List<Fractional>,
      pairs: null == pairs
          ? _value.pairs
          : pairs // ignore: cast_nullable_to_non_nullable
              as List<Pair>,
      soulBounds: null == soulBounds
          ? _value.soulBounds
          : soulBounds // ignore: cast_nullable_to_non_nullable
              as List<SoulBound>,
      includesBtcTokenization: freezed == includesBtcTokenization
          ? _value.includesBtcTokenization
          : includesBtcTokenization // ignore: cast_nullable_to_non_nullable
              as dynamic,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      isCompiled: null == isCompiled
          ? _value.isCompiled
          : isCompiled // ignore: cast_nullable_to_non_nullable
              as bool,
      isPublished: null == isPublished
          ? _value.isPublished
          : isPublished // ignore: cast_nullable_to_non_nullable
              as bool,
      properties: null == properties
          ? _value.properties
          : properties // ignore: cast_nullable_to_non_nullable
              as List<ScProperty>,
      token: freezed == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as TokenScFeature?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $WalletCopyWith<$Res> get owner {
    return $WalletCopyWith<$Res>(_value.owner, (value) {
      return _then(_value.copyWith(owner: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $AssetCopyWith<$Res>? get primaryAsset {
    if (_value.primaryAsset == null) {
      return null;
    }

    return $AssetCopyWith<$Res>(_value.primaryAsset!, (value) {
      return _then(_value.copyWith(primaryAsset: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $TokenScFeatureCopyWith<$Res>? get token {
    if (_value.token == null) {
      return null;
    }

    return $TokenScFeatureCopyWith<$Res>(_value.token!, (value) {
      return _then(_value.copyWith(token: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_SmartContractCopyWith<$Res>
    implements $SmartContractCopyWith<$Res> {
  factory _$$_SmartContractCopyWith(
          _$_SmartContract value, $Res Function(_$_SmartContract) then) =
      __$$_SmartContractCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Wallet owner,
      String draftId,
      String id,
      String name,
      String minterName,
      String description,
      String thumbnail,
      Asset? primaryAsset,
      List<Rarity> rarities,
      List<Stat> stats,
      List<Royalty> royalties,
      List<Evolve> evolves,
      List<Ticket> tickets,
      List<MultiAsset> multiAssets,
      List<Tokenization> tokenizations,
      List<Fractional> fractionals,
      List<Pair> pairs,
      List<SoulBound> soulBounds,
      dynamic includesBtcTokenization,
      String code,
      bool isCompiled,
      bool isPublished,
      List<ScProperty> properties,
      TokenScFeature? token});

  @override
  $WalletCopyWith<$Res> get owner;
  @override
  $AssetCopyWith<$Res>? get primaryAsset;
  @override
  $TokenScFeatureCopyWith<$Res>? get token;
}

/// @nodoc
class __$$_SmartContractCopyWithImpl<$Res>
    extends _$SmartContractCopyWithImpl<$Res, _$_SmartContract>
    implements _$$_SmartContractCopyWith<$Res> {
  __$$_SmartContractCopyWithImpl(
      _$_SmartContract _value, $Res Function(_$_SmartContract) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? owner = null,
    Object? draftId = null,
    Object? id = null,
    Object? name = null,
    Object? minterName = null,
    Object? description = null,
    Object? thumbnail = null,
    Object? primaryAsset = freezed,
    Object? rarities = null,
    Object? stats = null,
    Object? royalties = null,
    Object? evolves = null,
    Object? tickets = null,
    Object? multiAssets = null,
    Object? tokenizations = null,
    Object? fractionals = null,
    Object? pairs = null,
    Object? soulBounds = null,
    Object? includesBtcTokenization = freezed,
    Object? code = null,
    Object? isCompiled = null,
    Object? isPublished = null,
    Object? properties = null,
    Object? token = freezed,
  }) {
    return _then(_$_SmartContract(
      owner: null == owner
          ? _value.owner
          : owner // ignore: cast_nullable_to_non_nullable
              as Wallet,
      draftId: null == draftId
          ? _value.draftId
          : draftId // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
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
      thumbnail: null == thumbnail
          ? _value.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as String,
      primaryAsset: freezed == primaryAsset
          ? _value.primaryAsset
          : primaryAsset // ignore: cast_nullable_to_non_nullable
              as Asset?,
      rarities: null == rarities
          ? _value._rarities
          : rarities // ignore: cast_nullable_to_non_nullable
              as List<Rarity>,
      stats: null == stats
          ? _value._stats
          : stats // ignore: cast_nullable_to_non_nullable
              as List<Stat>,
      royalties: null == royalties
          ? _value._royalties
          : royalties // ignore: cast_nullable_to_non_nullable
              as List<Royalty>,
      evolves: null == evolves
          ? _value._evolves
          : evolves // ignore: cast_nullable_to_non_nullable
              as List<Evolve>,
      tickets: null == tickets
          ? _value._tickets
          : tickets // ignore: cast_nullable_to_non_nullable
              as List<Ticket>,
      multiAssets: null == multiAssets
          ? _value._multiAssets
          : multiAssets // ignore: cast_nullable_to_non_nullable
              as List<MultiAsset>,
      tokenizations: null == tokenizations
          ? _value._tokenizations
          : tokenizations // ignore: cast_nullable_to_non_nullable
              as List<Tokenization>,
      fractionals: null == fractionals
          ? _value._fractionals
          : fractionals // ignore: cast_nullable_to_non_nullable
              as List<Fractional>,
      pairs: null == pairs
          ? _value._pairs
          : pairs // ignore: cast_nullable_to_non_nullable
              as List<Pair>,
      soulBounds: null == soulBounds
          ? _value._soulBounds
          : soulBounds // ignore: cast_nullable_to_non_nullable
              as List<SoulBound>,
      includesBtcTokenization: freezed == includesBtcTokenization
          ? _value.includesBtcTokenization!
          : includesBtcTokenization,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      isCompiled: null == isCompiled
          ? _value.isCompiled
          : isCompiled // ignore: cast_nullable_to_non_nullable
              as bool,
      isPublished: null == isPublished
          ? _value.isPublished
          : isPublished // ignore: cast_nullable_to_non_nullable
              as bool,
      properties: null == properties
          ? _value._properties
          : properties // ignore: cast_nullable_to_non_nullable
              as List<ScProperty>,
      token: freezed == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as TokenScFeature?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SmartContract extends _SmartContract {
  _$_SmartContract(
      {required this.owner,
      this.draftId = "",
      this.id = "",
      this.name = "",
      this.minterName = "",
      this.description = "",
      this.thumbnail = "",
      this.primaryAsset,
      final List<Rarity> rarities = const [],
      final List<Stat> stats = const [],
      final List<Royalty> royalties = const [],
      final List<Evolve> evolves = const [],
      final List<Ticket> tickets = const [],
      final List<MultiAsset> multiAssets = const [],
      final List<Tokenization> tokenizations = const [],
      final List<Fractional> fractionals = const [],
      final List<Pair> pairs = const [],
      final List<SoulBound> soulBounds = const [],
      this.includesBtcTokenization = false,
      this.code = "",
      this.isCompiled = false,
      this.isPublished = false,
      final List<ScProperty> properties = const [],
      this.token})
      : _rarities = rarities,
        _stats = stats,
        _royalties = royalties,
        _evolves = evolves,
        _tickets = tickets,
        _multiAssets = multiAssets,
        _tokenizations = tokenizations,
        _fractionals = fractionals,
        _pairs = pairs,
        _soulBounds = soulBounds,
        _properties = properties,
        super._();

  factory _$_SmartContract.fromJson(Map<String, dynamic> json) =>
      _$$_SmartContractFromJson(json);

  @override
  final Wallet owner;
  @override
  @JsonKey()
  final String draftId;
  @override
  @JsonKey()
  final String id;
  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final String minterName;
  @override
  @JsonKey()
  final String description;
  @override
  @JsonKey()
  final String thumbnail;
  @override
  final Asset? primaryAsset;
  final List<Rarity> _rarities;
  @override
  @JsonKey()
  List<Rarity> get rarities {
    if (_rarities is EqualUnmodifiableListView) return _rarities;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_rarities);
  }

// @Default([]) List<Feature> features,
  final List<Stat> _stats;
// @Default([]) List<Feature> features,
  @override
  @JsonKey()
  List<Stat> get stats {
    if (_stats is EqualUnmodifiableListView) return _stats;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_stats);
  }

  final List<Royalty> _royalties;
  @override
  @JsonKey()
  List<Royalty> get royalties {
    if (_royalties is EqualUnmodifiableListView) return _royalties;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_royalties);
  }

  final List<Evolve> _evolves;
  @override
  @JsonKey()
  List<Evolve> get evolves {
    if (_evolves is EqualUnmodifiableListView) return _evolves;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_evolves);
  }

  final List<Ticket> _tickets;
  @override
  @JsonKey()
  List<Ticket> get tickets {
    if (_tickets is EqualUnmodifiableListView) return _tickets;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tickets);
  }

  final List<MultiAsset> _multiAssets;
  @override
  @JsonKey()
  List<MultiAsset> get multiAssets {
    if (_multiAssets is EqualUnmodifiableListView) return _multiAssets;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_multiAssets);
  }

  final List<Tokenization> _tokenizations;
  @override
  @JsonKey()
  List<Tokenization> get tokenizations {
    if (_tokenizations is EqualUnmodifiableListView) return _tokenizations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tokenizations);
  }

  final List<Fractional> _fractionals;
  @override
  @JsonKey()
  List<Fractional> get fractionals {
    if (_fractionals is EqualUnmodifiableListView) return _fractionals;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_fractionals);
  }

  final List<Pair> _pairs;
  @override
  @JsonKey()
  List<Pair> get pairs {
    if (_pairs is EqualUnmodifiableListView) return _pairs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_pairs);
  }

  final List<SoulBound> _soulBounds;
  @override
  @JsonKey()
  List<SoulBound> get soulBounds {
    if (_soulBounds is EqualUnmodifiableListView) return _soulBounds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_soulBounds);
  }

  @override
  @JsonKey()
  final dynamic includesBtcTokenization;
  @override
  @JsonKey()
  final String code;
  @override
  @JsonKey()
  final bool isCompiled;
  @override
  @JsonKey()
  final bool isPublished;
  final List<ScProperty> _properties;
  @override
  @JsonKey()
  List<ScProperty> get properties {
    if (_properties is EqualUnmodifiableListView) return _properties;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_properties);
  }

  @override
  final TokenScFeature? token;

  @override
  String toString() {
    return 'SmartContract(owner: $owner, draftId: $draftId, id: $id, name: $name, minterName: $minterName, description: $description, thumbnail: $thumbnail, primaryAsset: $primaryAsset, rarities: $rarities, stats: $stats, royalties: $royalties, evolves: $evolves, tickets: $tickets, multiAssets: $multiAssets, tokenizations: $tokenizations, fractionals: $fractionals, pairs: $pairs, soulBounds: $soulBounds, includesBtcTokenization: $includesBtcTokenization, code: $code, isCompiled: $isCompiled, isPublished: $isPublished, properties: $properties, token: $token)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SmartContract &&
            (identical(other.owner, owner) || other.owner == owner) &&
            (identical(other.draftId, draftId) || other.draftId == draftId) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.minterName, minterName) ||
                other.minterName == minterName) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.thumbnail, thumbnail) ||
                other.thumbnail == thumbnail) &&
            (identical(other.primaryAsset, primaryAsset) ||
                other.primaryAsset == primaryAsset) &&
            const DeepCollectionEquality().equals(other._rarities, _rarities) &&
            const DeepCollectionEquality().equals(other._stats, _stats) &&
            const DeepCollectionEquality()
                .equals(other._royalties, _royalties) &&
            const DeepCollectionEquality().equals(other._evolves, _evolves) &&
            const DeepCollectionEquality().equals(other._tickets, _tickets) &&
            const DeepCollectionEquality()
                .equals(other._multiAssets, _multiAssets) &&
            const DeepCollectionEquality()
                .equals(other._tokenizations, _tokenizations) &&
            const DeepCollectionEquality()
                .equals(other._fractionals, _fractionals) &&
            const DeepCollectionEquality().equals(other._pairs, _pairs) &&
            const DeepCollectionEquality()
                .equals(other._soulBounds, _soulBounds) &&
            const DeepCollectionEquality().equals(
                other.includesBtcTokenization, includesBtcTokenization) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.isCompiled, isCompiled) ||
                other.isCompiled == isCompiled) &&
            (identical(other.isPublished, isPublished) ||
                other.isPublished == isPublished) &&
            const DeepCollectionEquality()
                .equals(other._properties, _properties) &&
            (identical(other.token, token) || other.token == token));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        owner,
        draftId,
        id,
        name,
        minterName,
        description,
        thumbnail,
        primaryAsset,
        const DeepCollectionEquality().hash(_rarities),
        const DeepCollectionEquality().hash(_stats),
        const DeepCollectionEquality().hash(_royalties),
        const DeepCollectionEquality().hash(_evolves),
        const DeepCollectionEquality().hash(_tickets),
        const DeepCollectionEquality().hash(_multiAssets),
        const DeepCollectionEquality().hash(_tokenizations),
        const DeepCollectionEquality().hash(_fractionals),
        const DeepCollectionEquality().hash(_pairs),
        const DeepCollectionEquality().hash(_soulBounds),
        const DeepCollectionEquality().hash(includesBtcTokenization),
        code,
        isCompiled,
        isPublished,
        const DeepCollectionEquality().hash(_properties),
        token
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SmartContractCopyWith<_$_SmartContract> get copyWith =>
      __$$_SmartContractCopyWithImpl<_$_SmartContract>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SmartContractToJson(
      this,
    );
  }
}

abstract class _SmartContract extends SmartContract {
  factory _SmartContract(
      {required final Wallet owner,
      final String draftId,
      final String id,
      final String name,
      final String minterName,
      final String description,
      final String thumbnail,
      final Asset? primaryAsset,
      final List<Rarity> rarities,
      final List<Stat> stats,
      final List<Royalty> royalties,
      final List<Evolve> evolves,
      final List<Ticket> tickets,
      final List<MultiAsset> multiAssets,
      final List<Tokenization> tokenizations,
      final List<Fractional> fractionals,
      final List<Pair> pairs,
      final List<SoulBound> soulBounds,
      final dynamic includesBtcTokenization,
      final String code,
      final bool isCompiled,
      final bool isPublished,
      final List<ScProperty> properties,
      final TokenScFeature? token}) = _$_SmartContract;
  _SmartContract._() : super._();

  factory _SmartContract.fromJson(Map<String, dynamic> json) =
      _$_SmartContract.fromJson;

  @override
  Wallet get owner;
  @override
  String get draftId;
  @override
  String get id;
  @override
  String get name;
  @override
  String get minterName;
  @override
  String get description;
  @override
  String get thumbnail;
  @override
  Asset? get primaryAsset;
  @override
  List<Rarity> get rarities;
  @override // @Default([]) List<Feature> features,
  List<Stat> get stats;
  @override
  List<Royalty> get royalties;
  @override
  List<Evolve> get evolves;
  @override
  List<Ticket> get tickets;
  @override
  List<MultiAsset> get multiAssets;
  @override
  List<Tokenization> get tokenizations;
  @override
  List<Fractional> get fractionals;
  @override
  List<Pair> get pairs;
  @override
  List<SoulBound> get soulBounds;
  @override
  dynamic get includesBtcTokenization;
  @override
  String get code;
  @override
  bool get isCompiled;
  @override
  bool get isPublished;
  @override
  List<ScProperty> get properties;
  @override
  TokenScFeature? get token;
  @override
  @JsonKey(ignore: true)
  _$$_SmartContractCopyWith<_$_SmartContract> get copyWith =>
      throw _privateConstructorUsedError;
}
