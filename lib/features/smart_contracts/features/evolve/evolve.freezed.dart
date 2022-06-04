// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'evolve.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Evolve _$EvolveFromJson(Map<String, dynamic> json) {
  return _Evolve.fromJson(json);
}

/// @nodoc
class _$EvolveTearOff {
  const _$EvolveTearOff();

  _Evolve call(
      {String id = "",
      EvolveType type = EvolveType.manualOnly,
      List<EvolvePhase> phases = const [],
      bool isDynamic = false,
      Asset? asset}) {
    return _Evolve(
      id: id,
      type: type,
      phases: phases,
      isDynamic: isDynamic,
      asset: asset,
    );
  }

  Evolve fromJson(Map<String, Object?> json) {
    return Evolve.fromJson(json);
  }
}

/// @nodoc
const $Evolve = _$EvolveTearOff();

/// @nodoc
mixin _$Evolve {
  String get id => throw _privateConstructorUsedError;
  EvolveType get type => throw _privateConstructorUsedError;
  List<EvolvePhase> get phases => throw _privateConstructorUsedError;
  bool get isDynamic => throw _privateConstructorUsedError;
  Asset? get asset => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EvolveCopyWith<Evolve> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EvolveCopyWith<$Res> {
  factory $EvolveCopyWith(Evolve value, $Res Function(Evolve) then) =
      _$EvolveCopyWithImpl<$Res>;
  $Res call(
      {String id,
      EvolveType type,
      List<EvolvePhase> phases,
      bool isDynamic,
      Asset? asset});

  $AssetCopyWith<$Res>? get asset;
}

/// @nodoc
class _$EvolveCopyWithImpl<$Res> implements $EvolveCopyWith<$Res> {
  _$EvolveCopyWithImpl(this._value, this._then);

  final Evolve _value;
  // ignore: unused_field
  final $Res Function(Evolve) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? type = freezed,
    Object? phases = freezed,
    Object? isDynamic = freezed,
    Object? asset = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as EvolveType,
      phases: phases == freezed
          ? _value.phases
          : phases // ignore: cast_nullable_to_non_nullable
              as List<EvolvePhase>,
      isDynamic: isDynamic == freezed
          ? _value.isDynamic
          : isDynamic // ignore: cast_nullable_to_non_nullable
              as bool,
      asset: asset == freezed
          ? _value.asset
          : asset // ignore: cast_nullable_to_non_nullable
              as Asset?,
    ));
  }

  @override
  $AssetCopyWith<$Res>? get asset {
    if (_value.asset == null) {
      return null;
    }

    return $AssetCopyWith<$Res>(_value.asset!, (value) {
      return _then(_value.copyWith(asset: value));
    });
  }
}

/// @nodoc
abstract class _$EvolveCopyWith<$Res> implements $EvolveCopyWith<$Res> {
  factory _$EvolveCopyWith(_Evolve value, $Res Function(_Evolve) then) =
      __$EvolveCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      EvolveType type,
      List<EvolvePhase> phases,
      bool isDynamic,
      Asset? asset});

  @override
  $AssetCopyWith<$Res>? get asset;
}

/// @nodoc
class __$EvolveCopyWithImpl<$Res> extends _$EvolveCopyWithImpl<$Res>
    implements _$EvolveCopyWith<$Res> {
  __$EvolveCopyWithImpl(_Evolve _value, $Res Function(_Evolve) _then)
      : super(_value, (v) => _then(v as _Evolve));

  @override
  _Evolve get _value => super._value as _Evolve;

  @override
  $Res call({
    Object? id = freezed,
    Object? type = freezed,
    Object? phases = freezed,
    Object? isDynamic = freezed,
    Object? asset = freezed,
  }) {
    return _then(_Evolve(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as EvolveType,
      phases: phases == freezed
          ? _value.phases
          : phases // ignore: cast_nullable_to_non_nullable
              as List<EvolvePhase>,
      isDynamic: isDynamic == freezed
          ? _value.isDynamic
          : isDynamic // ignore: cast_nullable_to_non_nullable
              as bool,
      asset: asset == freezed
          ? _value.asset
          : asset // ignore: cast_nullable_to_non_nullable
              as Asset?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_Evolve extends _Evolve {
  const _$_Evolve(
      {this.id = "",
      this.type = EvolveType.manualOnly,
      this.phases = const [],
      this.isDynamic = false,
      this.asset})
      : super._();

  factory _$_Evolve.fromJson(Map<String, dynamic> json) =>
      _$$_EvolveFromJson(json);

  @JsonKey(defaultValue: "")
  @override
  final String id;
  @JsonKey(defaultValue: EvolveType.manualOnly)
  @override
  final EvolveType type;
  @JsonKey(defaultValue: const [])
  @override
  final List<EvolvePhase> phases;
  @JsonKey(defaultValue: false)
  @override
  final bool isDynamic;
  @override
  final Asset? asset;

  @override
  String toString() {
    return 'Evolve(id: $id, type: $type, phases: $phases, isDynamic: $isDynamic, asset: $asset)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Evolve &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.type, type) &&
            const DeepCollectionEquality().equals(other.phases, phases) &&
            const DeepCollectionEquality().equals(other.isDynamic, isDynamic) &&
            const DeepCollectionEquality().equals(other.asset, asset));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(type),
      const DeepCollectionEquality().hash(phases),
      const DeepCollectionEquality().hash(isDynamic),
      const DeepCollectionEquality().hash(asset));

  @JsonKey(ignore: true)
  @override
  _$EvolveCopyWith<_Evolve> get copyWith =>
      __$EvolveCopyWithImpl<_Evolve>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_EvolveToJson(this);
  }
}

abstract class _Evolve extends Evolve {
  const factory _Evolve(
      {String id,
      EvolveType type,
      List<EvolvePhase> phases,
      bool isDynamic,
      Asset? asset}) = _$_Evolve;
  const _Evolve._() : super._();

  factory _Evolve.fromJson(Map<String, dynamic> json) = _$_Evolve.fromJson;

  @override
  String get id;
  @override
  EvolveType get type;
  @override
  List<EvolvePhase> get phases;
  @override
  bool get isDynamic;
  @override
  Asset? get asset;
  @override
  @JsonKey(ignore: true)
  _$EvolveCopyWith<_Evolve> get copyWith => throw _privateConstructorUsedError;
}
