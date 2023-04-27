// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'evolve.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Evolve _$EvolveFromJson(Map<String, dynamic> json) {
  return _Evolve.fromJson(json);
}

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
      _$EvolveCopyWithImpl<$Res, Evolve>;
  @useResult
  $Res call(
      {String id,
      EvolveType type,
      List<EvolvePhase> phases,
      bool isDynamic,
      Asset? asset});

  $AssetCopyWith<$Res>? get asset;
}

/// @nodoc
class _$EvolveCopyWithImpl<$Res, $Val extends Evolve>
    implements $EvolveCopyWith<$Res> {
  _$EvolveCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? phases = null,
    Object? isDynamic = null,
    Object? asset = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as EvolveType,
      phases: null == phases
          ? _value.phases
          : phases // ignore: cast_nullable_to_non_nullable
              as List<EvolvePhase>,
      isDynamic: null == isDynamic
          ? _value.isDynamic
          : isDynamic // ignore: cast_nullable_to_non_nullable
              as bool,
      asset: freezed == asset
          ? _value.asset
          : asset // ignore: cast_nullable_to_non_nullable
              as Asset?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AssetCopyWith<$Res>? get asset {
    if (_value.asset == null) {
      return null;
    }

    return $AssetCopyWith<$Res>(_value.asset!, (value) {
      return _then(_value.copyWith(asset: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_EvolveCopyWith<$Res> implements $EvolveCopyWith<$Res> {
  factory _$$_EvolveCopyWith(_$_Evolve value, $Res Function(_$_Evolve) then) =
      __$$_EvolveCopyWithImpl<$Res>;
  @override
  @useResult
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
class __$$_EvolveCopyWithImpl<$Res>
    extends _$EvolveCopyWithImpl<$Res, _$_Evolve>
    implements _$$_EvolveCopyWith<$Res> {
  __$$_EvolveCopyWithImpl(_$_Evolve _value, $Res Function(_$_Evolve) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? phases = null,
    Object? isDynamic = null,
    Object? asset = freezed,
  }) {
    return _then(_$_Evolve(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as EvolveType,
      phases: null == phases
          ? _value._phases
          : phases // ignore: cast_nullable_to_non_nullable
              as List<EvolvePhase>,
      isDynamic: null == isDynamic
          ? _value.isDynamic
          : isDynamic // ignore: cast_nullable_to_non_nullable
              as bool,
      asset: freezed == asset
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
      final List<EvolvePhase> phases = const [],
      this.isDynamic = false,
      this.asset})
      : _phases = phases,
        super._();

  factory _$_Evolve.fromJson(Map<String, dynamic> json) =>
      _$$_EvolveFromJson(json);

  @override
  @JsonKey()
  final String id;
  @override
  @JsonKey()
  final EvolveType type;
  final List<EvolvePhase> _phases;
  @override
  @JsonKey()
  List<EvolvePhase> get phases {
    if (_phases is EqualUnmodifiableListView) return _phases;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_phases);
  }

  @override
  @JsonKey()
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
            other is _$_Evolve &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality().equals(other._phases, _phases) &&
            (identical(other.isDynamic, isDynamic) ||
                other.isDynamic == isDynamic) &&
            (identical(other.asset, asset) || other.asset == asset));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, type,
      const DeepCollectionEquality().hash(_phases), isDynamic, asset);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_EvolveCopyWith<_$_Evolve> get copyWith =>
      __$$_EvolveCopyWithImpl<_$_Evolve>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_EvolveToJson(
      this,
    );
  }
}

abstract class _Evolve extends Evolve {
  const factory _Evolve(
      {final String id,
      final EvolveType type,
      final List<EvolvePhase> phases,
      final bool isDynamic,
      final Asset? asset}) = _$_Evolve;
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
  _$$_EvolveCopyWith<_$_Evolve> get copyWith =>
      throw _privateConstructorUsedError;
}
