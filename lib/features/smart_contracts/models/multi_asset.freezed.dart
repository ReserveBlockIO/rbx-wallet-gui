// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'multi_asset.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MultiAsset _$MultiAssetFromJson(Map<String, dynamic> json) {
  return _MultiAsset.fromJson(json);
}

/// @nodoc
class _$MultiAssetTearOff {
  const _$MultiAssetTearOff();

  _MultiAsset call({String id = "", List<Asset> assets = const []}) {
    return _MultiAsset(
      id: id,
      assets: assets,
    );
  }

  MultiAsset fromJson(Map<String, Object?> json) {
    return MultiAsset.fromJson(json);
  }
}

/// @nodoc
const $MultiAsset = _$MultiAssetTearOff();

/// @nodoc
mixin _$MultiAsset {
  String get id => throw _privateConstructorUsedError;
  List<Asset> get assets => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MultiAssetCopyWith<MultiAsset> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MultiAssetCopyWith<$Res> {
  factory $MultiAssetCopyWith(
          MultiAsset value, $Res Function(MultiAsset) then) =
      _$MultiAssetCopyWithImpl<$Res>;
  $Res call({String id, List<Asset> assets});
}

/// @nodoc
class _$MultiAssetCopyWithImpl<$Res> implements $MultiAssetCopyWith<$Res> {
  _$MultiAssetCopyWithImpl(this._value, this._then);

  final MultiAsset _value;
  // ignore: unused_field
  final $Res Function(MultiAsset) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? assets = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      assets: assets == freezed
          ? _value.assets
          : assets // ignore: cast_nullable_to_non_nullable
              as List<Asset>,
    ));
  }
}

/// @nodoc
abstract class _$MultiAssetCopyWith<$Res> implements $MultiAssetCopyWith<$Res> {
  factory _$MultiAssetCopyWith(
          _MultiAsset value, $Res Function(_MultiAsset) then) =
      __$MultiAssetCopyWithImpl<$Res>;
  @override
  $Res call({String id, List<Asset> assets});
}

/// @nodoc
class __$MultiAssetCopyWithImpl<$Res> extends _$MultiAssetCopyWithImpl<$Res>
    implements _$MultiAssetCopyWith<$Res> {
  __$MultiAssetCopyWithImpl(
      _MultiAsset _value, $Res Function(_MultiAsset) _then)
      : super(_value, (v) => _then(v as _MultiAsset));

  @override
  _MultiAsset get _value => super._value as _MultiAsset;

  @override
  $Res call({
    Object? id = freezed,
    Object? assets = freezed,
  }) {
    return _then(_MultiAsset(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      assets: assets == freezed
          ? _value.assets
          : assets // ignore: cast_nullable_to_non_nullable
              as List<Asset>,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_MultiAsset extends _MultiAsset {
  const _$_MultiAsset({this.id = "", this.assets = const []}) : super._();

  factory _$_MultiAsset.fromJson(Map<String, dynamic> json) =>
      _$$_MultiAssetFromJson(json);

  @JsonKey(defaultValue: "")
  @override
  final String id;
  @JsonKey(defaultValue: const [])
  @override
  final List<Asset> assets;

  @override
  String toString() {
    return 'MultiAsset(id: $id, assets: $assets)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MultiAsset &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.assets, assets));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(assets));

  @JsonKey(ignore: true)
  @override
  _$MultiAssetCopyWith<_MultiAsset> get copyWith =>
      __$MultiAssetCopyWithImpl<_MultiAsset>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MultiAssetToJson(this);
  }
}

abstract class _MultiAsset extends MultiAsset {
  const factory _MultiAsset({String id, List<Asset> assets}) = _$_MultiAsset;
  const _MultiAsset._() : super._();

  factory _MultiAsset.fromJson(Map<String, dynamic> json) =
      _$_MultiAsset.fromJson;

  @override
  String get id;
  @override
  List<Asset> get assets;
  @override
  @JsonKey(ignore: true)
  _$MultiAssetCopyWith<_MultiAsset> get copyWith =>
      throw _privateConstructorUsedError;
}
