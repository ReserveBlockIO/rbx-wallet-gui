// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'evolve_phase.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

EvolvePhase _$EvolvePhaseFromJson(Map<String, dynamic> json) {
  return _EvolvePhase.fromJson(json);
}

/// @nodoc
mixin _$EvolvePhase {
  String get name => throw _privateConstructorUsedError;
  DateTime? get dateTime => throw _privateConstructorUsedError;
  int? get blockHeight =>
      throw _privateConstructorUsedError; // @Default("") String expectedValue,
  String get description => throw _privateConstructorUsedError;
  int get evolutionState => throw _privateConstructorUsedError;
  bool get isCurrentState => throw _privateConstructorUsedError;
  Asset? get asset => throw _privateConstructorUsedError;
  List<ScProperty> get properties => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EvolvePhaseCopyWith<EvolvePhase> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EvolvePhaseCopyWith<$Res> {
  factory $EvolvePhaseCopyWith(
          EvolvePhase value, $Res Function(EvolvePhase) then) =
      _$EvolvePhaseCopyWithImpl<$Res>;
  $Res call(
      {String name,
      DateTime? dateTime,
      int? blockHeight,
      String description,
      int evolutionState,
      bool isCurrentState,
      Asset? asset,
      List<ScProperty> properties});

  $AssetCopyWith<$Res>? get asset;
}

/// @nodoc
class _$EvolvePhaseCopyWithImpl<$Res> implements $EvolvePhaseCopyWith<$Res> {
  _$EvolvePhaseCopyWithImpl(this._value, this._then);

  final EvolvePhase _value;
  // ignore: unused_field
  final $Res Function(EvolvePhase) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? dateTime = freezed,
    Object? blockHeight = freezed,
    Object? description = freezed,
    Object? evolutionState = freezed,
    Object? isCurrentState = freezed,
    Object? asset = freezed,
    Object? properties = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      dateTime: dateTime == freezed
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      blockHeight: blockHeight == freezed
          ? _value.blockHeight
          : blockHeight // ignore: cast_nullable_to_non_nullable
              as int?,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      evolutionState: evolutionState == freezed
          ? _value.evolutionState
          : evolutionState // ignore: cast_nullable_to_non_nullable
              as int,
      isCurrentState: isCurrentState == freezed
          ? _value.isCurrentState
          : isCurrentState // ignore: cast_nullable_to_non_nullable
              as bool,
      asset: asset == freezed
          ? _value.asset
          : asset // ignore: cast_nullable_to_non_nullable
              as Asset?,
      properties: properties == freezed
          ? _value.properties
          : properties // ignore: cast_nullable_to_non_nullable
              as List<ScProperty>,
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
abstract class _$$_EvolvePhaseCopyWith<$Res>
    implements $EvolvePhaseCopyWith<$Res> {
  factory _$$_EvolvePhaseCopyWith(
          _$_EvolvePhase value, $Res Function(_$_EvolvePhase) then) =
      __$$_EvolvePhaseCopyWithImpl<$Res>;
  @override
  $Res call(
      {String name,
      DateTime? dateTime,
      int? blockHeight,
      String description,
      int evolutionState,
      bool isCurrentState,
      Asset? asset,
      List<ScProperty> properties});

  @override
  $AssetCopyWith<$Res>? get asset;
}

/// @nodoc
class __$$_EvolvePhaseCopyWithImpl<$Res> extends _$EvolvePhaseCopyWithImpl<$Res>
    implements _$$_EvolvePhaseCopyWith<$Res> {
  __$$_EvolvePhaseCopyWithImpl(
      _$_EvolvePhase _value, $Res Function(_$_EvolvePhase) _then)
      : super(_value, (v) => _then(v as _$_EvolvePhase));

  @override
  _$_EvolvePhase get _value => super._value as _$_EvolvePhase;

  @override
  $Res call({
    Object? name = freezed,
    Object? dateTime = freezed,
    Object? blockHeight = freezed,
    Object? description = freezed,
    Object? evolutionState = freezed,
    Object? isCurrentState = freezed,
    Object? asset = freezed,
    Object? properties = freezed,
  }) {
    return _then(_$_EvolvePhase(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      dateTime: dateTime == freezed
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      blockHeight: blockHeight == freezed
          ? _value.blockHeight
          : blockHeight // ignore: cast_nullable_to_non_nullable
              as int?,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      evolutionState: evolutionState == freezed
          ? _value.evolutionState
          : evolutionState // ignore: cast_nullable_to_non_nullable
              as int,
      isCurrentState: isCurrentState == freezed
          ? _value.isCurrentState
          : isCurrentState // ignore: cast_nullable_to_non_nullable
              as bool,
      asset: asset == freezed
          ? _value.asset
          : asset // ignore: cast_nullable_to_non_nullable
              as Asset?,
      properties: properties == freezed
          ? _value._properties
          : properties // ignore: cast_nullable_to_non_nullable
              as List<ScProperty>,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_EvolvePhase extends _EvolvePhase {
  const _$_EvolvePhase(
      {this.name = "",
      this.dateTime,
      this.blockHeight,
      this.description = "",
      this.evolutionState = 0,
      this.isCurrentState = false,
      this.asset,
      final List<ScProperty> properties = const []})
      : _properties = properties,
        super._();

  factory _$_EvolvePhase.fromJson(Map<String, dynamic> json) =>
      _$$_EvolvePhaseFromJson(json);

  @override
  @JsonKey()
  final String name;
  @override
  final DateTime? dateTime;
  @override
  final int? blockHeight;
// @Default("") String expectedValue,
  @override
  @JsonKey()
  final String description;
  @override
  @JsonKey()
  final int evolutionState;
  @override
  @JsonKey()
  final bool isCurrentState;
  @override
  final Asset? asset;
  final List<ScProperty> _properties;
  @override
  @JsonKey()
  List<ScProperty> get properties {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_properties);
  }

  @override
  String toString() {
    return 'EvolvePhase(name: $name, dateTime: $dateTime, blockHeight: $blockHeight, description: $description, evolutionState: $evolutionState, isCurrentState: $isCurrentState, asset: $asset, properties: $properties)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_EvolvePhase &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.dateTime, dateTime) &&
            const DeepCollectionEquality()
                .equals(other.blockHeight, blockHeight) &&
            const DeepCollectionEquality()
                .equals(other.description, description) &&
            const DeepCollectionEquality()
                .equals(other.evolutionState, evolutionState) &&
            const DeepCollectionEquality()
                .equals(other.isCurrentState, isCurrentState) &&
            const DeepCollectionEquality().equals(other.asset, asset) &&
            const DeepCollectionEquality()
                .equals(other._properties, _properties));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(dateTime),
      const DeepCollectionEquality().hash(blockHeight),
      const DeepCollectionEquality().hash(description),
      const DeepCollectionEquality().hash(evolutionState),
      const DeepCollectionEquality().hash(isCurrentState),
      const DeepCollectionEquality().hash(asset),
      const DeepCollectionEquality().hash(_properties));

  @JsonKey(ignore: true)
  @override
  _$$_EvolvePhaseCopyWith<_$_EvolvePhase> get copyWith =>
      __$$_EvolvePhaseCopyWithImpl<_$_EvolvePhase>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_EvolvePhaseToJson(this);
  }
}

abstract class _EvolvePhase extends EvolvePhase {
  const factory _EvolvePhase(
      {final String name,
      final DateTime? dateTime,
      final int? blockHeight,
      final String description,
      final int evolutionState,
      final bool isCurrentState,
      final Asset? asset,
      final List<ScProperty> properties}) = _$_EvolvePhase;
  const _EvolvePhase._() : super._();

  factory _EvolvePhase.fromJson(Map<String, dynamic> json) =
      _$_EvolvePhase.fromJson;

  @override
  String get name => throw _privateConstructorUsedError;
  @override
  DateTime? get dateTime => throw _privateConstructorUsedError;
  @override
  int? get blockHeight => throw _privateConstructorUsedError;
  @override // @Default("") String expectedValue,
  String get description => throw _privateConstructorUsedError;
  @override
  int get evolutionState => throw _privateConstructorUsedError;
  @override
  bool get isCurrentState => throw _privateConstructorUsedError;
  @override
  Asset? get asset => throw _privateConstructorUsedError;
  @override
  List<ScProperty> get properties => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_EvolvePhaseCopyWith<_$_EvolvePhase> get copyWith =>
      throw _privateConstructorUsedError;
}
