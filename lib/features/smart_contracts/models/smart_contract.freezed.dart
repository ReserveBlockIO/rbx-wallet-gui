// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

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
  String get code => throw _privateConstructorUsedError;
  bool get isCompiled => throw _privateConstructorUsedError;
  bool get isPublished => throw _privateConstructorUsedError;
  List<ScProperty> get properties => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SmartContractCopyWith<SmartContract> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SmartContractCopyWith<$Res> {
  factory $SmartContractCopyWith(
          SmartContract value, $Res Function(SmartContract) then) =
      _$SmartContractCopyWithImpl<$Res>;
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
      String code,
      bool isCompiled,
      bool isPublished,
      List<ScProperty> properties});

  $WalletCopyWith<$Res> get owner;
  $AssetCopyWith<$Res>? get primaryAsset;
}

/// @nodoc
class _$SmartContractCopyWithImpl<$Res>
    implements $SmartContractCopyWith<$Res> {
  _$SmartContractCopyWithImpl(this._value, this._then);

  final SmartContract _value;
  // ignore: unused_field
  final $Res Function(SmartContract) _then;

  @override
  $Res call({
    Object? owner = freezed,
    Object? draftId = freezed,
    Object? id = freezed,
    Object? name = freezed,
    Object? minterName = freezed,
    Object? description = freezed,
    Object? thumbnail = freezed,
    Object? primaryAsset = freezed,
    Object? rarities = freezed,
    Object? stats = freezed,
    Object? royalties = freezed,
    Object? evolves = freezed,
    Object? tickets = freezed,
    Object? multiAssets = freezed,
    Object? tokenizations = freezed,
    Object? fractionals = freezed,
    Object? pairs = freezed,
    Object? soulBounds = freezed,
    Object? code = freezed,
    Object? isCompiled = freezed,
    Object? isPublished = freezed,
    Object? properties = freezed,
  }) {
    return _then(_value.copyWith(
      owner: owner == freezed
          ? _value.owner
          : owner // ignore: cast_nullable_to_non_nullable
              as Wallet,
      draftId: draftId == freezed
          ? _value.draftId
          : draftId // ignore: cast_nullable_to_non_nullable
              as String,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
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
      thumbnail: thumbnail == freezed
          ? _value.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as String,
      primaryAsset: primaryAsset == freezed
          ? _value.primaryAsset
          : primaryAsset // ignore: cast_nullable_to_non_nullable
              as Asset?,
      rarities: rarities == freezed
          ? _value.rarities
          : rarities // ignore: cast_nullable_to_non_nullable
              as List<Rarity>,
      stats: stats == freezed
          ? _value.stats
          : stats // ignore: cast_nullable_to_non_nullable
              as List<Stat>,
      royalties: royalties == freezed
          ? _value.royalties
          : royalties // ignore: cast_nullable_to_non_nullable
              as List<Royalty>,
      evolves: evolves == freezed
          ? _value.evolves
          : evolves // ignore: cast_nullable_to_non_nullable
              as List<Evolve>,
      tickets: tickets == freezed
          ? _value.tickets
          : tickets // ignore: cast_nullable_to_non_nullable
              as List<Ticket>,
      multiAssets: multiAssets == freezed
          ? _value.multiAssets
          : multiAssets // ignore: cast_nullable_to_non_nullable
              as List<MultiAsset>,
      tokenizations: tokenizations == freezed
          ? _value.tokenizations
          : tokenizations // ignore: cast_nullable_to_non_nullable
              as List<Tokenization>,
      fractionals: fractionals == freezed
          ? _value.fractionals
          : fractionals // ignore: cast_nullable_to_non_nullable
              as List<Fractional>,
      pairs: pairs == freezed
          ? _value.pairs
          : pairs // ignore: cast_nullable_to_non_nullable
              as List<Pair>,
      soulBounds: soulBounds == freezed
          ? _value.soulBounds
          : soulBounds // ignore: cast_nullable_to_non_nullable
              as List<SoulBound>,
      code: code == freezed
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      isCompiled: isCompiled == freezed
          ? _value.isCompiled
          : isCompiled // ignore: cast_nullable_to_non_nullable
              as bool,
      isPublished: isPublished == freezed
          ? _value.isPublished
          : isPublished // ignore: cast_nullable_to_non_nullable
              as bool,
      properties: properties == freezed
          ? _value.properties
          : properties // ignore: cast_nullable_to_non_nullable
              as List<ScProperty>,
    ));
  }

  @override
  $WalletCopyWith<$Res> get owner {
    return $WalletCopyWith<$Res>(_value.owner, (value) {
      return _then(_value.copyWith(owner: value));
    });
  }

  @override
  $AssetCopyWith<$Res>? get primaryAsset {
    if (_value.primaryAsset == null) {
      return null;
    }

    return $AssetCopyWith<$Res>(_value.primaryAsset!, (value) {
      return _then(_value.copyWith(primaryAsset: value));
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
      String code,
      bool isCompiled,
      bool isPublished,
      List<ScProperty> properties});

  @override
  $WalletCopyWith<$Res> get owner;
  @override
  $AssetCopyWith<$Res>? get primaryAsset;
}

/// @nodoc
class __$$_SmartContractCopyWithImpl<$Res>
    extends _$SmartContractCopyWithImpl<$Res>
    implements _$$_SmartContractCopyWith<$Res> {
  __$$_SmartContractCopyWithImpl(
      _$_SmartContract _value, $Res Function(_$_SmartContract) _then)
      : super(_value, (v) => _then(v as _$_SmartContract));

  @override
  _$_SmartContract get _value => super._value as _$_SmartContract;

  @override
  $Res call({
    Object? owner = freezed,
    Object? draftId = freezed,
    Object? id = freezed,
    Object? name = freezed,
    Object? minterName = freezed,
    Object? description = freezed,
    Object? thumbnail = freezed,
    Object? primaryAsset = freezed,
    Object? rarities = freezed,
    Object? stats = freezed,
    Object? royalties = freezed,
    Object? evolves = freezed,
    Object? tickets = freezed,
    Object? multiAssets = freezed,
    Object? tokenizations = freezed,
    Object? fractionals = freezed,
    Object? pairs = freezed,
    Object? soulBounds = freezed,
    Object? code = freezed,
    Object? isCompiled = freezed,
    Object? isPublished = freezed,
    Object? properties = freezed,
  }) {
    return _then(_$_SmartContract(
      owner: owner == freezed
          ? _value.owner
          : owner // ignore: cast_nullable_to_non_nullable
              as Wallet,
      draftId: draftId == freezed
          ? _value.draftId
          : draftId // ignore: cast_nullable_to_non_nullable
              as String,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
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
      thumbnail: thumbnail == freezed
          ? _value.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as String,
      primaryAsset: primaryAsset == freezed
          ? _value.primaryAsset
          : primaryAsset // ignore: cast_nullable_to_non_nullable
              as Asset?,
      rarities: rarities == freezed
          ? _value._rarities
          : rarities // ignore: cast_nullable_to_non_nullable
              as List<Rarity>,
      stats: stats == freezed
          ? _value._stats
          : stats // ignore: cast_nullable_to_non_nullable
              as List<Stat>,
      royalties: royalties == freezed
          ? _value._royalties
          : royalties // ignore: cast_nullable_to_non_nullable
              as List<Royalty>,
      evolves: evolves == freezed
          ? _value._evolves
          : evolves // ignore: cast_nullable_to_non_nullable
              as List<Evolve>,
      tickets: tickets == freezed
          ? _value._tickets
          : tickets // ignore: cast_nullable_to_non_nullable
              as List<Ticket>,
      multiAssets: multiAssets == freezed
          ? _value._multiAssets
          : multiAssets // ignore: cast_nullable_to_non_nullable
              as List<MultiAsset>,
      tokenizations: tokenizations == freezed
          ? _value._tokenizations
          : tokenizations // ignore: cast_nullable_to_non_nullable
              as List<Tokenization>,
      fractionals: fractionals == freezed
          ? _value._fractionals
          : fractionals // ignore: cast_nullable_to_non_nullable
              as List<Fractional>,
      pairs: pairs == freezed
          ? _value._pairs
          : pairs // ignore: cast_nullable_to_non_nullable
              as List<Pair>,
      soulBounds: soulBounds == freezed
          ? _value._soulBounds
          : soulBounds // ignore: cast_nullable_to_non_nullable
              as List<SoulBound>,
      code: code == freezed
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      isCompiled: isCompiled == freezed
          ? _value.isCompiled
          : isCompiled // ignore: cast_nullable_to_non_nullable
              as bool,
      isPublished: isPublished == freezed
          ? _value.isPublished
          : isPublished // ignore: cast_nullable_to_non_nullable
              as bool,
      properties: properties == freezed
          ? _value._properties
          : properties // ignore: cast_nullable_to_non_nullable
              as List<ScProperty>,
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
      this.code = "",
      this.isCompiled = false,
      this.isPublished = false,
      final List<ScProperty> properties = const []})
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
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_rarities);
  }

// @Default([]) List<Feature> features,
  final List<Stat> _stats;
// @Default([]) List<Feature> features,
  @override
  @JsonKey()
  List<Stat> get stats {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_stats);
  }

  final List<Royalty> _royalties;
  @override
  @JsonKey()
  List<Royalty> get royalties {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_royalties);
  }

  final List<Evolve> _evolves;
  @override
  @JsonKey()
  List<Evolve> get evolves {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_evolves);
  }

  final List<Ticket> _tickets;
  @override
  @JsonKey()
  List<Ticket> get tickets {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tickets);
  }

  final List<MultiAsset> _multiAssets;
  @override
  @JsonKey()
  List<MultiAsset> get multiAssets {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_multiAssets);
  }

  final List<Tokenization> _tokenizations;
  @override
  @JsonKey()
  List<Tokenization> get tokenizations {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tokenizations);
  }

  final List<Fractional> _fractionals;
  @override
  @JsonKey()
  List<Fractional> get fractionals {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_fractionals);
  }

  final List<Pair> _pairs;
  @override
  @JsonKey()
  List<Pair> get pairs {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_pairs);
  }

  final List<SoulBound> _soulBounds;
  @override
  @JsonKey()
  List<SoulBound> get soulBounds {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_soulBounds);
  }

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
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_properties);
  }

  @override
  String toString() {
    return 'SmartContract(owner: $owner, draftId: $draftId, id: $id, name: $name, minterName: $minterName, description: $description, thumbnail: $thumbnail, primaryAsset: $primaryAsset, rarities: $rarities, stats: $stats, royalties: $royalties, evolves: $evolves, tickets: $tickets, multiAssets: $multiAssets, tokenizations: $tokenizations, fractionals: $fractionals, pairs: $pairs, soulBounds: $soulBounds, code: $code, isCompiled: $isCompiled, isPublished: $isPublished, properties: $properties)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SmartContract &&
            const DeepCollectionEquality().equals(other.owner, owner) &&
            const DeepCollectionEquality().equals(other.draftId, draftId) &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality()
                .equals(other.minterName, minterName) &&
            const DeepCollectionEquality()
                .equals(other.description, description) &&
            const DeepCollectionEquality().equals(other.thumbnail, thumbnail) &&
            const DeepCollectionEquality()
                .equals(other.primaryAsset, primaryAsset) &&
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
            const DeepCollectionEquality().equals(other.code, code) &&
            const DeepCollectionEquality()
                .equals(other.isCompiled, isCompiled) &&
            const DeepCollectionEquality()
                .equals(other.isPublished, isPublished) &&
            const DeepCollectionEquality()
                .equals(other._properties, _properties));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        const DeepCollectionEquality().hash(owner),
        const DeepCollectionEquality().hash(draftId),
        const DeepCollectionEquality().hash(id),
        const DeepCollectionEquality().hash(name),
        const DeepCollectionEquality().hash(minterName),
        const DeepCollectionEquality().hash(description),
        const DeepCollectionEquality().hash(thumbnail),
        const DeepCollectionEquality().hash(primaryAsset),
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
        const DeepCollectionEquality().hash(code),
        const DeepCollectionEquality().hash(isCompiled),
        const DeepCollectionEquality().hash(isPublished),
        const DeepCollectionEquality().hash(_properties)
      ]);

  @JsonKey(ignore: true)
  @override
  _$$_SmartContractCopyWith<_$_SmartContract> get copyWith =>
      __$$_SmartContractCopyWithImpl<_$_SmartContract>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SmartContractToJson(this);
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
      final String code,
      final bool isCompiled,
      final bool isPublished,
      final List<ScProperty> properties}) = _$_SmartContract;
  _SmartContract._() : super._();

  factory _SmartContract.fromJson(Map<String, dynamic> json) =
      _$_SmartContract.fromJson;

  @override
  Wallet get owner => throw _privateConstructorUsedError;
  @override
  String get draftId => throw _privateConstructorUsedError;
  @override
  String get id => throw _privateConstructorUsedError;
  @override
  String get name => throw _privateConstructorUsedError;
  @override
  String get minterName => throw _privateConstructorUsedError;
  @override
  String get description => throw _privateConstructorUsedError;
  @override
  String get thumbnail => throw _privateConstructorUsedError;
  @override
  Asset? get primaryAsset => throw _privateConstructorUsedError;
  @override
  List<Rarity> get rarities => throw _privateConstructorUsedError;
  @override // @Default([]) List<Feature> features,
  List<Stat> get stats => throw _privateConstructorUsedError;
  @override
  List<Royalty> get royalties => throw _privateConstructorUsedError;
  @override
  List<Evolve> get evolves => throw _privateConstructorUsedError;
  @override
  List<Ticket> get tickets => throw _privateConstructorUsedError;
  @override
  List<MultiAsset> get multiAssets => throw _privateConstructorUsedError;
  @override
  List<Tokenization> get tokenizations => throw _privateConstructorUsedError;
  @override
  List<Fractional> get fractionals => throw _privateConstructorUsedError;
  @override
  List<Pair> get pairs => throw _privateConstructorUsedError;
  @override
  List<SoulBound> get soulBounds => throw _privateConstructorUsedError;
  @override
  String get code => throw _privateConstructorUsedError;
  @override
  bool get isCompiled => throw _privateConstructorUsedError;
  @override
  bool get isPublished => throw _privateConstructorUsedError;
  @override
  List<ScProperty> get properties => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_SmartContractCopyWith<_$_SmartContract> get copyWith =>
      throw _privateConstructorUsedError;
}
