// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'rarity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$RarityTearOff {
  const _$RarityTearOff();

  _Rarity call({String name = "", double weight = 1, String description = ""}) {
    return _Rarity(
      name: name,
      weight: weight,
      description: description,
    );
  }
}

/// @nodoc
const $Rarity = _$RarityTearOff();

/// @nodoc
mixin _$Rarity {
  String get name => throw _privateConstructorUsedError;
  double get weight => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RarityCopyWith<Rarity> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RarityCopyWith<$Res> {
  factory $RarityCopyWith(Rarity value, $Res Function(Rarity) then) =
      _$RarityCopyWithImpl<$Res>;
  $Res call({String name, double weight, String description});
}

/// @nodoc
class _$RarityCopyWithImpl<$Res> implements $RarityCopyWith<$Res> {
  _$RarityCopyWithImpl(this._value, this._then);

  final Rarity _value;
  // ignore: unused_field
  final $Res Function(Rarity) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? weight = freezed,
    Object? description = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      weight: weight == freezed
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as double,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$RarityCopyWith<$Res> implements $RarityCopyWith<$Res> {
  factory _$RarityCopyWith(_Rarity value, $Res Function(_Rarity) then) =
      __$RarityCopyWithImpl<$Res>;
  @override
  $Res call({String name, double weight, String description});
}

/// @nodoc
class __$RarityCopyWithImpl<$Res> extends _$RarityCopyWithImpl<$Res>
    implements _$RarityCopyWith<$Res> {
  __$RarityCopyWithImpl(_Rarity _value, $Res Function(_Rarity) _then)
      : super(_value, (v) => _then(v as _Rarity));

  @override
  _Rarity get _value => super._value as _Rarity;

  @override
  $Res call({
    Object? name = freezed,
    Object? weight = freezed,
    Object? description = freezed,
  }) {
    return _then(_Rarity(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      weight: weight == freezed
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as double,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Rarity extends _Rarity {
  _$_Rarity({this.name = "", this.weight = 1, this.description = ""})
      : super._();

  @JsonKey(defaultValue: "")
  @override
  final String name;
  @JsonKey(defaultValue: 1)
  @override
  final double weight;
  @JsonKey(defaultValue: "")
  @override
  final String description;

  @override
  String toString() {
    return 'Rarity(name: $name, weight: $weight, description: $description)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Rarity &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.weight, weight) &&
            const DeepCollectionEquality()
                .equals(other.description, description));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(weight),
      const DeepCollectionEquality().hash(description));

  @JsonKey(ignore: true)
  @override
  _$RarityCopyWith<_Rarity> get copyWith =>
      __$RarityCopyWithImpl<_Rarity>(this, _$identity);
}

abstract class _Rarity extends Rarity {
  factory _Rarity({String name, double weight, String description}) = _$_Rarity;
  _Rarity._() : super._();

  @override
  String get name;
  @override
  double get weight;
  @override
  String get description;
  @override
  @JsonKey(ignore: true)
  _$RarityCopyWith<_Rarity> get copyWith => throw _privateConstructorUsedError;
}
