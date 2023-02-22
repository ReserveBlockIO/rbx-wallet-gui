// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'sc_property.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ScProperty _$ScPropertyFromJson(Map<String, dynamic> json) {
  return _ScProperty.fromJson(json);
}

/// @nodoc
mixin _$ScProperty {
  String get name => throw _privateConstructorUsedError;
  String get value => throw _privateConstructorUsedError;
  ScPropertyType get type => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ScPropertyCopyWith<ScProperty> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScPropertyCopyWith<$Res> {
  factory $ScPropertyCopyWith(
          ScProperty value, $Res Function(ScProperty) then) =
      _$ScPropertyCopyWithImpl<$Res>;
  $Res call({String name, String value, ScPropertyType type});
}

/// @nodoc
class _$ScPropertyCopyWithImpl<$Res> implements $ScPropertyCopyWith<$Res> {
  _$ScPropertyCopyWithImpl(this._value, this._then);

  final ScProperty _value;
  // ignore: unused_field
  final $Res Function(ScProperty) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? value = freezed,
    Object? type = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ScPropertyType,
    ));
  }
}

/// @nodoc
abstract class _$$_ScPropertyCopyWith<$Res>
    implements $ScPropertyCopyWith<$Res> {
  factory _$$_ScPropertyCopyWith(
          _$_ScProperty value, $Res Function(_$_ScProperty) then) =
      __$$_ScPropertyCopyWithImpl<$Res>;
  @override
  $Res call({String name, String value, ScPropertyType type});
}

/// @nodoc
class __$$_ScPropertyCopyWithImpl<$Res> extends _$ScPropertyCopyWithImpl<$Res>
    implements _$$_ScPropertyCopyWith<$Res> {
  __$$_ScPropertyCopyWithImpl(
      _$_ScProperty _value, $Res Function(_$_ScProperty) _then)
      : super(_value, (v) => _then(v as _$_ScProperty));

  @override
  _$_ScProperty get _value => super._value as _$_ScProperty;

  @override
  $Res call({
    Object? name = freezed,
    Object? value = freezed,
    Object? type = freezed,
  }) {
    return _then(_$_ScProperty(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ScPropertyType,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ScProperty extends _ScProperty {
  const _$_ScProperty(
      {this.name = "", this.value = "", this.type = ScPropertyType.text})
      : super._();

  factory _$_ScProperty.fromJson(Map<String, dynamic> json) =>
      _$$_ScPropertyFromJson(json);

  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final String value;
  @override
  @JsonKey()
  final ScPropertyType type;

  @override
  String toString() {
    return 'ScProperty(name: $name, value: $value, type: $type)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ScProperty &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.value, value) &&
            const DeepCollectionEquality().equals(other.type, type));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(value),
      const DeepCollectionEquality().hash(type));

  @JsonKey(ignore: true)
  @override
  _$$_ScPropertyCopyWith<_$_ScProperty> get copyWith =>
      __$$_ScPropertyCopyWithImpl<_$_ScProperty>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ScPropertyToJson(this);
  }
}

abstract class _ScProperty extends ScProperty {
  const factory _ScProperty(
      {final String name,
      final String value,
      final ScPropertyType type}) = _$_ScProperty;
  const _ScProperty._() : super._();

  factory _ScProperty.fromJson(Map<String, dynamic> json) =
      _$_ScProperty.fromJson;

  @override
  String get name => throw _privateConstructorUsedError;
  @override
  String get value => throw _privateConstructorUsedError;
  @override
  ScPropertyType get type => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_ScPropertyCopyWith<_$_ScProperty> get copyWith =>
      throw _privateConstructorUsedError;
}
