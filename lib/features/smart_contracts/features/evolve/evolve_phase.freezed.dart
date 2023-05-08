// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

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
  @JsonKey(ignore: true)
  WebAsset? get webAsset => throw _privateConstructorUsedError;
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
      _$EvolvePhaseCopyWithImpl<$Res, EvolvePhase>;
  @useResult
  $Res call(
      {String name,
      DateTime? dateTime,
      int? blockHeight,
      String description,
      int evolutionState,
      bool isCurrentState,
      Asset? asset,
      @JsonKey(ignore: true) WebAsset? webAsset,
      List<ScProperty> properties});

  $AssetCopyWith<$Res>? get asset;
}

/// @nodoc
class _$EvolvePhaseCopyWithImpl<$Res, $Val extends EvolvePhase>
    implements $EvolvePhaseCopyWith<$Res> {
  _$EvolvePhaseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? dateTime = freezed,
    Object? blockHeight = freezed,
    Object? description = null,
    Object? evolutionState = null,
    Object? isCurrentState = null,
    Object? asset = freezed,
    Object? webAsset = freezed,
    Object? properties = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      dateTime: freezed == dateTime
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      blockHeight: freezed == blockHeight
          ? _value.blockHeight
          : blockHeight // ignore: cast_nullable_to_non_nullable
              as int?,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      evolutionState: null == evolutionState
          ? _value.evolutionState
          : evolutionState // ignore: cast_nullable_to_non_nullable
              as int,
      isCurrentState: null == isCurrentState
          ? _value.isCurrentState
          : isCurrentState // ignore: cast_nullable_to_non_nullable
              as bool,
      asset: freezed == asset
          ? _value.asset
          : asset // ignore: cast_nullable_to_non_nullable
              as Asset?,
      webAsset: freezed == webAsset
          ? _value.webAsset
          : webAsset // ignore: cast_nullable_to_non_nullable
              as WebAsset?,
      properties: null == properties
          ? _value.properties
          : properties // ignore: cast_nullable_to_non_nullable
              as List<ScProperty>,
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
abstract class _$$_EvolvePhaseCopyWith<$Res>
    implements $EvolvePhaseCopyWith<$Res> {
  factory _$$_EvolvePhaseCopyWith(
          _$_EvolvePhase value, $Res Function(_$_EvolvePhase) then) =
      __$$_EvolvePhaseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      DateTime? dateTime,
      int? blockHeight,
      String description,
      int evolutionState,
      bool isCurrentState,
      Asset? asset,
      @JsonKey(ignore: true) WebAsset? webAsset,
      List<ScProperty> properties});

  @override
  $AssetCopyWith<$Res>? get asset;
}

/// @nodoc
class __$$_EvolvePhaseCopyWithImpl<$Res>
    extends _$EvolvePhaseCopyWithImpl<$Res, _$_EvolvePhase>
    implements _$$_EvolvePhaseCopyWith<$Res> {
  __$$_EvolvePhaseCopyWithImpl(
      _$_EvolvePhase _value, $Res Function(_$_EvolvePhase) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? dateTime = freezed,
    Object? blockHeight = freezed,
    Object? description = null,
    Object? evolutionState = null,
    Object? isCurrentState = null,
    Object? asset = freezed,
    Object? webAsset = freezed,
    Object? properties = null,
  }) {
    return _then(_$_EvolvePhase(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      dateTime: freezed == dateTime
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      blockHeight: freezed == blockHeight
          ? _value.blockHeight
          : blockHeight // ignore: cast_nullable_to_non_nullable
              as int?,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      evolutionState: null == evolutionState
          ? _value.evolutionState
          : evolutionState // ignore: cast_nullable_to_non_nullable
              as int,
      isCurrentState: null == isCurrentState
          ? _value.isCurrentState
          : isCurrentState // ignore: cast_nullable_to_non_nullable
              as bool,
      asset: freezed == asset
          ? _value.asset
          : asset // ignore: cast_nullable_to_non_nullable
              as Asset?,
      webAsset: freezed == webAsset
          ? _value.webAsset
          : webAsset // ignore: cast_nullable_to_non_nullable
              as WebAsset?,
      properties: null == properties
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
      @JsonKey(ignore: true) this.webAsset,
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
  @override
  @JsonKey(ignore: true)
  final WebAsset? webAsset;
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
    return 'EvolvePhase(name: $name, dateTime: $dateTime, blockHeight: $blockHeight, description: $description, evolutionState: $evolutionState, isCurrentState: $isCurrentState, asset: $asset, webAsset: $webAsset, properties: $properties)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_EvolvePhase &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.dateTime, dateTime) ||
                other.dateTime == dateTime) &&
            (identical(other.blockHeight, blockHeight) ||
                other.blockHeight == blockHeight) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.evolutionState, evolutionState) ||
                other.evolutionState == evolutionState) &&
            (identical(other.isCurrentState, isCurrentState) ||
                other.isCurrentState == isCurrentState) &&
            (identical(other.asset, asset) || other.asset == asset) &&
            (identical(other.webAsset, webAsset) ||
                other.webAsset == webAsset) &&
            const DeepCollectionEquality()
                .equals(other._properties, _properties));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      name,
      dateTime,
      blockHeight,
      description,
      evolutionState,
      isCurrentState,
      asset,
      webAsset,
      const DeepCollectionEquality().hash(_properties));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_EvolvePhaseCopyWith<_$_EvolvePhase> get copyWith =>
      __$$_EvolvePhaseCopyWithImpl<_$_EvolvePhase>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_EvolvePhaseToJson(
      this,
    );
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
      @JsonKey(ignore: true) final WebAsset? webAsset,
      final List<ScProperty> properties}) = _$_EvolvePhase;
  const _EvolvePhase._() : super._();

  factory _EvolvePhase.fromJson(Map<String, dynamic> json) =
      _$_EvolvePhase.fromJson;

  @override
  String get name;
  @override
  DateTime? get dateTime;
  @override
  int? get blockHeight;
  @override // @Default("") String expectedValue,
  String get description;
  @override
  int get evolutionState;
  @override
  bool get isCurrentState;
  @override
  Asset? get asset;
  @override
  @JsonKey(ignore: true)
  WebAsset? get webAsset;
  @override
  List<ScProperty> get properties;
  @override
  @JsonKey(ignore: true)
  _$$_EvolvePhaseCopyWith<_$_EvolvePhase> get copyWith =>
      throw _privateConstructorUsedError;
}
