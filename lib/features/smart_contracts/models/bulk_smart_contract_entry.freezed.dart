// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

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
  String get primaryAssetUrl => throw _privateConstructorUsedError;
  String get creatorName => throw _privateConstructorUsedError;
  Asset? get primaryAsset => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BulkSmartContractEntryCopyWith<BulkSmartContractEntry> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BulkSmartContractEntryCopyWith<$Res> {
  factory $BulkSmartContractEntryCopyWith(BulkSmartContractEntry value,
          $Res Function(BulkSmartContractEntry) then) =
      _$BulkSmartContractEntryCopyWithImpl<$Res>;
  $Res call(
      {String name,
      String description,
      String primaryAssetUrl,
      String creatorName,
      Asset? primaryAsset,
      int quantity});

  $AssetCopyWith<$Res>? get primaryAsset;
}

/// @nodoc
class _$BulkSmartContractEntryCopyWithImpl<$Res>
    implements $BulkSmartContractEntryCopyWith<$Res> {
  _$BulkSmartContractEntryCopyWithImpl(this._value, this._then);

  final BulkSmartContractEntry _value;
  // ignore: unused_field
  final $Res Function(BulkSmartContractEntry) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? description = freezed,
    Object? primaryAssetUrl = freezed,
    Object? creatorName = freezed,
    Object? primaryAsset = freezed,
    Object? quantity = freezed,
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
      primaryAssetUrl: primaryAssetUrl == freezed
          ? _value.primaryAssetUrl
          : primaryAssetUrl // ignore: cast_nullable_to_non_nullable
              as String,
      creatorName: creatorName == freezed
          ? _value.creatorName
          : creatorName // ignore: cast_nullable_to_non_nullable
              as String,
      primaryAsset: primaryAsset == freezed
          ? _value.primaryAsset
          : primaryAsset // ignore: cast_nullable_to_non_nullable
              as Asset?,
      quantity: quantity == freezed
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
    ));
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
abstract class _$$_BulkSmartContractEntryCopyWith<$Res>
    implements $BulkSmartContractEntryCopyWith<$Res> {
  factory _$$_BulkSmartContractEntryCopyWith(_$_BulkSmartContractEntry value,
          $Res Function(_$_BulkSmartContractEntry) then) =
      __$$_BulkSmartContractEntryCopyWithImpl<$Res>;
  @override
  $Res call(
      {String name,
      String description,
      String primaryAssetUrl,
      String creatorName,
      Asset? primaryAsset,
      int quantity});

  @override
  $AssetCopyWith<$Res>? get primaryAsset;
}

/// @nodoc
class __$$_BulkSmartContractEntryCopyWithImpl<$Res>
    extends _$BulkSmartContractEntryCopyWithImpl<$Res>
    implements _$$_BulkSmartContractEntryCopyWith<$Res> {
  __$$_BulkSmartContractEntryCopyWithImpl(_$_BulkSmartContractEntry _value,
      $Res Function(_$_BulkSmartContractEntry) _then)
      : super(_value, (v) => _then(v as _$_BulkSmartContractEntry));

  @override
  _$_BulkSmartContractEntry get _value =>
      super._value as _$_BulkSmartContractEntry;

  @override
  $Res call({
    Object? name = freezed,
    Object? description = freezed,
    Object? primaryAssetUrl = freezed,
    Object? creatorName = freezed,
    Object? primaryAsset = freezed,
    Object? quantity = freezed,
  }) {
    return _then(_$_BulkSmartContractEntry(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      primaryAssetUrl: primaryAssetUrl == freezed
          ? _value.primaryAssetUrl
          : primaryAssetUrl // ignore: cast_nullable_to_non_nullable
              as String,
      creatorName: creatorName == freezed
          ? _value.creatorName
          : creatorName // ignore: cast_nullable_to_non_nullable
              as String,
      primaryAsset: primaryAsset == freezed
          ? _value.primaryAsset
          : primaryAsset // ignore: cast_nullable_to_non_nullable
              as Asset?,
      quantity: quantity == freezed
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_BulkSmartContractEntry extends _BulkSmartContractEntry {
  _$_BulkSmartContractEntry(
      {required this.name,
      required this.description,
      required this.primaryAssetUrl,
      required this.creatorName,
      this.primaryAsset,
      this.quantity = 1})
      : super._();

  @override
  final String name;
  @override
  final String description;
  @override
  final String primaryAssetUrl;
  @override
  final String creatorName;
  @override
  final Asset? primaryAsset;
  @override
  @JsonKey()
  final int quantity;

  @override
  String toString() {
    return 'BulkSmartContractEntry(name: $name, description: $description, primaryAssetUrl: $primaryAssetUrl, creatorName: $creatorName, primaryAsset: $primaryAsset, quantity: $quantity)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BulkSmartContractEntry &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality()
                .equals(other.description, description) &&
            const DeepCollectionEquality()
                .equals(other.primaryAssetUrl, primaryAssetUrl) &&
            const DeepCollectionEquality()
                .equals(other.creatorName, creatorName) &&
            const DeepCollectionEquality()
                .equals(other.primaryAsset, primaryAsset) &&
            const DeepCollectionEquality().equals(other.quantity, quantity));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(description),
      const DeepCollectionEquality().hash(primaryAssetUrl),
      const DeepCollectionEquality().hash(creatorName),
      const DeepCollectionEquality().hash(primaryAsset),
      const DeepCollectionEquality().hash(quantity));

  @JsonKey(ignore: true)
  @override
  _$$_BulkSmartContractEntryCopyWith<_$_BulkSmartContractEntry> get copyWith =>
      __$$_BulkSmartContractEntryCopyWithImpl<_$_BulkSmartContractEntry>(
          this, _$identity);
}

abstract class _BulkSmartContractEntry extends BulkSmartContractEntry {
  factory _BulkSmartContractEntry(
      {required final String name,
      required final String description,
      required final String primaryAssetUrl,
      required final String creatorName,
      final Asset? primaryAsset,
      final int quantity}) = _$_BulkSmartContractEntry;
  _BulkSmartContractEntry._() : super._();

  @override
  String get name => throw _privateConstructorUsedError;
  @override
  String get description => throw _privateConstructorUsedError;
  @override
  String get primaryAssetUrl => throw _privateConstructorUsedError;
  @override
  String get creatorName => throw _privateConstructorUsedError;
  @override
  Asset? get primaryAsset => throw _privateConstructorUsedError;
  @override
  int get quantity => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_BulkSmartContractEntryCopyWith<_$_BulkSmartContractEntry> get copyWith =>
      throw _privateConstructorUsedError;
}
