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
      EvolveType type = EvolveType.time,
      String url = "",
      List<EvolvePhase> phases = const []}) {
    return _Evolve(
      id: id,
      type: type,
      url: url,
      phases: phases,
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
  String get url => throw _privateConstructorUsedError;
  List<EvolvePhase> get phases => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EvolveCopyWith<Evolve> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EvolveCopyWith<$Res> {
  factory $EvolveCopyWith(Evolve value, $Res Function(Evolve) then) =
      _$EvolveCopyWithImpl<$Res>;
  $Res call({String id, EvolveType type, String url, List<EvolvePhase> phases});
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
    Object? url = freezed,
    Object? phases = freezed,
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
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      phases: phases == freezed
          ? _value.phases
          : phases // ignore: cast_nullable_to_non_nullable
              as List<EvolvePhase>,
    ));
  }
}

/// @nodoc
abstract class _$EvolveCopyWith<$Res> implements $EvolveCopyWith<$Res> {
  factory _$EvolveCopyWith(_Evolve value, $Res Function(_Evolve) then) =
      __$EvolveCopyWithImpl<$Res>;
  @override
  $Res call({String id, EvolveType type, String url, List<EvolvePhase> phases});
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
    Object? url = freezed,
    Object? phases = freezed,
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
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      phases: phases == freezed
          ? _value.phases
          : phases // ignore: cast_nullable_to_non_nullable
              as List<EvolvePhase>,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_Evolve extends _Evolve {
  const _$_Evolve(
      {this.id = "",
      this.type = EvolveType.time,
      this.url = "",
      this.phases = const []})
      : super._();

  factory _$_Evolve.fromJson(Map<String, dynamic> json) =>
      _$$_EvolveFromJson(json);

  @JsonKey(defaultValue: "")
  @override
  final String id;
  @JsonKey(defaultValue: EvolveType.time)
  @override
  final EvolveType type;
  @JsonKey(defaultValue: "")
  @override
  final String url;
  @JsonKey(defaultValue: const [])
  @override
  final List<EvolvePhase> phases;

  @override
  String toString() {
    return 'Evolve(id: $id, type: $type, url: $url, phases: $phases)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Evolve &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.type, type) &&
            const DeepCollectionEquality().equals(other.url, url) &&
            const DeepCollectionEquality().equals(other.phases, phases));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(type),
      const DeepCollectionEquality().hash(url),
      const DeepCollectionEquality().hash(phases));

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
      String url,
      List<EvolvePhase> phases}) = _$_Evolve;
  const _Evolve._() : super._();

  factory _Evolve.fromJson(Map<String, dynamic> json) = _$_Evolve.fromJson;

  @override
  String get id;
  @override
  EvolveType get type;
  @override
  String get url;
  @override
  List<EvolvePhase> get phases;
  @override
  @JsonKey(ignore: true)
  _$EvolveCopyWith<_Evolve> get copyWith => throw _privateConstructorUsedError;
}
