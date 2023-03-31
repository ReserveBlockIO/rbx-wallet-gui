// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bulk_smart_contract_entry.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$BulkSmartContractEntry {
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get creatorName => throw _privateConstructorUsedError;
  Asset? get primaryAsset => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;
  Royalty? get royalty => throw _privateConstructorUsedError;
  List<Asset> get additionalAssets => throw _privateConstructorUsedError;
  Evolve get evolve => throw _privateConstructorUsedError;
  List<ScProperty> get properties => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BulkSmartContractEntryCopyWith<BulkSmartContractEntry> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BulkSmartContractEntryCopyWith<$Res> {
  factory $BulkSmartContractEntryCopyWith(BulkSmartContractEntry value,
          $Res Function(BulkSmartContractEntry) then) =
      _$BulkSmartContractEntryCopyWithImpl<$Res, BulkSmartContractEntry>;
  @useResult
  $Res call(
      {String name,
      String description,
      String creatorName,
      Asset? primaryAsset,
      int quantity,
      Royalty? royalty,
      List<Asset> additionalAssets,
      Evolve evolve,
      List<ScProperty> properties});

  $AssetCopyWith<$Res>? get primaryAsset;
  $RoyaltyCopyWith<$Res>? get royalty;
  $EvolveCopyWith<$Res> get evolve;
}

/// @nodoc
class _$BulkSmartContractEntryCopyWithImpl<$Res,
        $Val extends BulkSmartContractEntry>
    implements $BulkSmartContractEntryCopyWith<$Res> {
  _$BulkSmartContractEntryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? description = null,
    Object? creatorName = null,
    Object? primaryAsset = freezed,
    Object? quantity = null,
    Object? royalty = freezed,
    Object? additionalAssets = null,
    Object? evolve = null,
    Object? properties = null,
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
      creatorName: null == creatorName
          ? _value.creatorName
          : creatorName // ignore: cast_nullable_to_non_nullable
              as String,
      primaryAsset: freezed == primaryAsset
          ? _value.primaryAsset
          : primaryAsset // ignore: cast_nullable_to_non_nullable
              as Asset?,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      royalty: freezed == royalty
          ? _value.royalty
          : royalty // ignore: cast_nullable_to_non_nullable
              as Royalty?,
      additionalAssets: null == additionalAssets
          ? _value.additionalAssets
          : additionalAssets // ignore: cast_nullable_to_non_nullable
              as List<Asset>,
      evolve: null == evolve
          ? _value.evolve
          : evolve // ignore: cast_nullable_to_non_nullable
              as Evolve,
      properties: null == properties
          ? _value.properties
          : properties // ignore: cast_nullable_to_non_nullable
              as List<ScProperty>,
    ) as $Val);
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
  $RoyaltyCopyWith<$Res>? get royalty {
    if (_value.royalty == null) {
      return null;
    }

    return $RoyaltyCopyWith<$Res>(_value.royalty!, (value) {
      return _then(_value.copyWith(royalty: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $EvolveCopyWith<$Res> get evolve {
    return $EvolveCopyWith<$Res>(_value.evolve, (value) {
      return _then(_value.copyWith(evolve: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_BulkSmartContractEntryCopyWith<$Res>
    implements $BulkSmartContractEntryCopyWith<$Res> {
  factory _$$_BulkSmartContractEntryCopyWith(_$_BulkSmartContractEntry value,
          $Res Function(_$_BulkSmartContractEntry) then) =
      __$$_BulkSmartContractEntryCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      String description,
      String creatorName,
      Asset? primaryAsset,
      int quantity,
      Royalty? royalty,
      List<Asset> additionalAssets,
      Evolve evolve,
      List<ScProperty> properties});

  @override
  $AssetCopyWith<$Res>? get primaryAsset;
  @override
  $RoyaltyCopyWith<$Res>? get royalty;
  @override
  $EvolveCopyWith<$Res> get evolve;
}

/// @nodoc
class __$$_BulkSmartContractEntryCopyWithImpl<$Res>
    extends _$BulkSmartContractEntryCopyWithImpl<$Res,
        _$_BulkSmartContractEntry>
    implements _$$_BulkSmartContractEntryCopyWith<$Res> {
  __$$_BulkSmartContractEntryCopyWithImpl(_$_BulkSmartContractEntry _value,
      $Res Function(_$_BulkSmartContractEntry) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? description = null,
    Object? creatorName = null,
    Object? primaryAsset = freezed,
    Object? quantity = null,
    Object? royalty = freezed,
    Object? additionalAssets = null,
    Object? evolve = null,
    Object? properties = null,
  }) {
    return _then(_$_BulkSmartContractEntry(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      creatorName: null == creatorName
          ? _value.creatorName
          : creatorName // ignore: cast_nullable_to_non_nullable
              as String,
      primaryAsset: freezed == primaryAsset
          ? _value.primaryAsset
          : primaryAsset // ignore: cast_nullable_to_non_nullable
              as Asset?,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      royalty: freezed == royalty
          ? _value.royalty
          : royalty // ignore: cast_nullable_to_non_nullable
              as Royalty?,
      additionalAssets: null == additionalAssets
          ? _value._additionalAssets
          : additionalAssets // ignore: cast_nullable_to_non_nullable
              as List<Asset>,
      evolve: null == evolve
          ? _value.evolve
          : evolve // ignore: cast_nullable_to_non_nullable
              as Evolve,
      properties: null == properties
          ? _value._properties
          : properties // ignore: cast_nullable_to_non_nullable
              as List<ScProperty>,
    ));
  }
}

/// @nodoc

class _$_BulkSmartContractEntry extends _BulkSmartContractEntry {
  _$_BulkSmartContractEntry(
      {required this.name,
      required this.description,
      required this.creatorName,
      this.primaryAsset,
      this.quantity = 1,
      this.royalty,
      final List<Asset> additionalAssets = const [],
      this.evolve = const Evolve(),
      final List<ScProperty> properties = const []})
      : _additionalAssets = additionalAssets,
        _properties = properties,
        super._();

  @override
  final String name;
  @override
  final String description;
  @override
  final String creatorName;
  @override
  final Asset? primaryAsset;
  @override
  @JsonKey()
  final int quantity;
  @override
  final Royalty? royalty;
  final List<Asset> _additionalAssets;
  @override
  @JsonKey()
  List<Asset> get additionalAssets {
    if (_additionalAssets is EqualUnmodifiableListView)
      return _additionalAssets;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_additionalAssets);
  }

  @override
  @JsonKey()
  final Evolve evolve;
  final List<ScProperty> _properties;
  @override
  @JsonKey()
  List<ScProperty> get properties {
    if (_properties is EqualUnmodifiableListView) return _properties;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_properties);
  }

  @override
  String toString() {
    return 'BulkSmartContractEntry(name: $name, description: $description, creatorName: $creatorName, primaryAsset: $primaryAsset, quantity: $quantity, royalty: $royalty, additionalAssets: $additionalAssets, evolve: $evolve, properties: $properties)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BulkSmartContractEntry &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.creatorName, creatorName) ||
                other.creatorName == creatorName) &&
            (identical(other.primaryAsset, primaryAsset) ||
                other.primaryAsset == primaryAsset) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.royalty, royalty) || other.royalty == royalty) &&
            const DeepCollectionEquality()
                .equals(other._additionalAssets, _additionalAssets) &&
            (identical(other.evolve, evolve) || other.evolve == evolve) &&
            const DeepCollectionEquality()
                .equals(other._properties, _properties));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      name,
      description,
      creatorName,
      primaryAsset,
      quantity,
      royalty,
      const DeepCollectionEquality().hash(_additionalAssets),
      evolve,
      const DeepCollectionEquality().hash(_properties));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BulkSmartContractEntryCopyWith<_$_BulkSmartContractEntry> get copyWith =>
      __$$_BulkSmartContractEntryCopyWithImpl<_$_BulkSmartContractEntry>(
          this, _$identity);
}

abstract class _BulkSmartContractEntry extends BulkSmartContractEntry {
  factory _BulkSmartContractEntry(
      {required final String name,
      required final String description,
      required final String creatorName,
      final Asset? primaryAsset,
      final int quantity,
      final Royalty? royalty,
      final List<Asset> additionalAssets,
      final Evolve evolve,
      final List<ScProperty> properties}) = _$_BulkSmartContractEntry;
  _BulkSmartContractEntry._() : super._();

  @override
  String get name;
  @override
  String get description;
  @override
  String get creatorName;
  @override
  Asset? get primaryAsset;
  @override
  int get quantity;
  @override
  Royalty? get royalty;
  @override
  List<Asset> get additionalAssets;
  @override
  Evolve get evolve;
  @override
  List<ScProperty> get properties;
  @override
  @JsonKey(ignore: true)
  _$$_BulkSmartContractEntryCopyWith<_$_BulkSmartContractEntry> get copyWith =>
      throw _privateConstructorUsedError;
}
