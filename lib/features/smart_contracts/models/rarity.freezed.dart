// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rarity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Rarity _$RarityFromJson(Map<String, dynamic> json) {
  return _Rarity.fromJson(json);
}

/// @nodoc
mixin _$Rarity {
  String get name => throw _privateConstructorUsedError;
  double get weight => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RarityCopyWith<Rarity> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RarityCopyWith<$Res> {
  factory $RarityCopyWith(Rarity value, $Res Function(Rarity) then) =
      _$RarityCopyWithImpl<$Res, Rarity>;
  @useResult
  $Res call({String name, double weight, String description});
}

/// @nodoc
class _$RarityCopyWithImpl<$Res, $Val extends Rarity>
    implements $RarityCopyWith<$Res> {
  _$RarityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? weight = null,
    Object? description = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      weight: null == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as double,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RarityCopyWith<$Res> implements $RarityCopyWith<$Res> {
  factory _$$_RarityCopyWith(_$_Rarity value, $Res Function(_$_Rarity) then) =
      __$$_RarityCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, double weight, String description});
}

/// @nodoc
class __$$_RarityCopyWithImpl<$Res>
    extends _$RarityCopyWithImpl<$Res, _$_Rarity>
    implements _$$_RarityCopyWith<$Res> {
  __$$_RarityCopyWithImpl(_$_Rarity _value, $Res Function(_$_Rarity) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? weight = null,
    Object? description = null,
  }) {
    return _then(_$_Rarity(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      weight: null == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as double,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Rarity extends _Rarity {
  _$_Rarity({this.name = "", this.weight = 1, this.description = ""})
      : super._();

  factory _$_Rarity.fromJson(Map<String, dynamic> json) =>
      _$$_RarityFromJson(json);

  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final double weight;
  @override
  @JsonKey()
  final String description;

  @override
  String toString() {
    return 'Rarity(name: $name, weight: $weight, description: $description)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Rarity &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.weight, weight) || other.weight == weight) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, weight, description);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RarityCopyWith<_$_Rarity> get copyWith =>
      __$$_RarityCopyWithImpl<_$_Rarity>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RarityToJson(
      this,
    );
  }
}

abstract class _Rarity extends Rarity {
  factory _Rarity(
      {final String name,
      final double weight,
      final String description}) = _$_Rarity;
  _Rarity._() : super._();

  factory _Rarity.fromJson(Map<String, dynamic> json) = _$_Rarity.fromJson;

  @override
  String get name;
  @override
  double get weight;
  @override
  String get description;
  @override
  @JsonKey(ignore: true)
  _$$_RarityCopyWith<_$_Rarity> get copyWith =>
      throw _privateConstructorUsedError;
}
