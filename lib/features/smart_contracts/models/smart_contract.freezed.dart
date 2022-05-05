// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'smart_contract.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$SmartContractTearOff {
  const _$SmartContractTearOff();

  _SmartContract call(
      {required Wallet owner,
      String name = "",
      String description = "",
      String thumbnail = "",
      List<Rarity> rarities = const [],
      List<Stat> stats = const [],
      List<Royalty> royalties = const [],
      List<Evolve> evolves = const []}) {
    return _SmartContract(
      owner: owner,
      name: name,
      description: description,
      thumbnail: thumbnail,
      rarities: rarities,
      stats: stats,
      royalties: royalties,
      evolves: evolves,
    );
  }
}

/// @nodoc
const $SmartContract = _$SmartContractTearOff();

/// @nodoc
mixin _$SmartContract {
  Wallet get owner => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get thumbnail => throw _privateConstructorUsedError;
  List<Rarity> get rarities =>
      throw _privateConstructorUsedError; // @Default([]) List<Feature> features,
  List<Stat> get stats => throw _privateConstructorUsedError;
  List<Royalty> get royalties => throw _privateConstructorUsedError;
  List<Evolve> get evolves => throw _privateConstructorUsedError;

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
      String name,
      String description,
      String thumbnail,
      List<Rarity> rarities,
      List<Stat> stats,
      List<Royalty> royalties,
      List<Evolve> evolves});

  $WalletCopyWith<$Res> get owner;
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
    Object? name = freezed,
    Object? description = freezed,
    Object? thumbnail = freezed,
    Object? rarities = freezed,
    Object? stats = freezed,
    Object? royalties = freezed,
    Object? evolves = freezed,
  }) {
    return _then(_value.copyWith(
      owner: owner == freezed
          ? _value.owner
          : owner // ignore: cast_nullable_to_non_nullable
              as Wallet,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      thumbnail: thumbnail == freezed
          ? _value.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as String,
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
    ));
  }

  @override
  $WalletCopyWith<$Res> get owner {
    return $WalletCopyWith<$Res>(_value.owner, (value) {
      return _then(_value.copyWith(owner: value));
    });
  }
}

/// @nodoc
abstract class _$SmartContractCopyWith<$Res>
    implements $SmartContractCopyWith<$Res> {
  factory _$SmartContractCopyWith(
          _SmartContract value, $Res Function(_SmartContract) then) =
      __$SmartContractCopyWithImpl<$Res>;
  @override
  $Res call(
      {Wallet owner,
      String name,
      String description,
      String thumbnail,
      List<Rarity> rarities,
      List<Stat> stats,
      List<Royalty> royalties,
      List<Evolve> evolves});

  @override
  $WalletCopyWith<$Res> get owner;
}

/// @nodoc
class __$SmartContractCopyWithImpl<$Res>
    extends _$SmartContractCopyWithImpl<$Res>
    implements _$SmartContractCopyWith<$Res> {
  __$SmartContractCopyWithImpl(
      _SmartContract _value, $Res Function(_SmartContract) _then)
      : super(_value, (v) => _then(v as _SmartContract));

  @override
  _SmartContract get _value => super._value as _SmartContract;

  @override
  $Res call({
    Object? owner = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? thumbnail = freezed,
    Object? rarities = freezed,
    Object? stats = freezed,
    Object? royalties = freezed,
    Object? evolves = freezed,
  }) {
    return _then(_SmartContract(
      owner: owner == freezed
          ? _value.owner
          : owner // ignore: cast_nullable_to_non_nullable
              as Wallet,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      thumbnail: thumbnail == freezed
          ? _value.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as String,
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
    ));
  }
}

/// @nodoc

class _$_SmartContract extends _SmartContract {
  _$_SmartContract(
      {required this.owner,
      this.name = "",
      this.description = "",
      this.thumbnail = "",
      this.rarities = const [],
      this.stats = const [],
      this.royalties = const [],
      this.evolves = const []})
      : super._();

  @override
  final Wallet owner;
  @JsonKey(defaultValue: "")
  @override
  final String name;
  @JsonKey(defaultValue: "")
  @override
  final String description;
  @JsonKey(defaultValue: "")
  @override
  final String thumbnail;
  @JsonKey(defaultValue: const [])
  @override
  final List<Rarity> rarities;
  @JsonKey(defaultValue: const [])
  @override // @Default([]) List<Feature> features,
  final List<Stat> stats;
  @JsonKey(defaultValue: const [])
  @override
  final List<Royalty> royalties;
  @JsonKey(defaultValue: const [])
  @override
  final List<Evolve> evolves;

  @override
  String toString() {
    return 'SmartContract(owner: $owner, name: $name, description: $description, thumbnail: $thumbnail, rarities: $rarities, stats: $stats, royalties: $royalties, evolves: $evolves)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SmartContract &&
            const DeepCollectionEquality().equals(other.owner, owner) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality()
                .equals(other.description, description) &&
            const DeepCollectionEquality().equals(other.thumbnail, thumbnail) &&
            const DeepCollectionEquality().equals(other.rarities, rarities) &&
            const DeepCollectionEquality().equals(other.stats, stats) &&
            const DeepCollectionEquality().equals(other.royalties, royalties) &&
            const DeepCollectionEquality().equals(other.evolves, evolves));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(owner),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(description),
      const DeepCollectionEquality().hash(thumbnail),
      const DeepCollectionEquality().hash(rarities),
      const DeepCollectionEquality().hash(stats),
      const DeepCollectionEquality().hash(royalties),
      const DeepCollectionEquality().hash(evolves));

  @JsonKey(ignore: true)
  @override
  _$SmartContractCopyWith<_SmartContract> get copyWith =>
      __$SmartContractCopyWithImpl<_SmartContract>(this, _$identity);
}

abstract class _SmartContract extends SmartContract {
  factory _SmartContract(
      {required Wallet owner,
      String name,
      String description,
      String thumbnail,
      List<Rarity> rarities,
      List<Stat> stats,
      List<Royalty> royalties,
      List<Evolve> evolves}) = _$_SmartContract;
  _SmartContract._() : super._();

  @override
  Wallet get owner;
  @override
  String get name;
  @override
  String get description;
  @override
  String get thumbnail;
  @override
  List<Rarity> get rarities;
  @override // @Default([]) List<Feature> features,
  List<Stat> get stats;
  @override
  List<Royalty> get royalties;
  @override
  List<Evolve> get evolves;
  @override
  @JsonKey(ignore: true)
  _$SmartContractCopyWith<_SmartContract> get copyWith =>
      throw _privateConstructorUsedError;
}
