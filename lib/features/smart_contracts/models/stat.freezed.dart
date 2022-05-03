// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'stat.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$StatTearOff {
  const _$StatTearOff();

  _Stat call({String label = "", String value = "", required StatType type}) {
    return _Stat(
      label: label,
      value: value,
      type: type,
    );
  }
}

/// @nodoc
const $Stat = _$StatTearOff();

/// @nodoc
mixin _$Stat {
  String get label => throw _privateConstructorUsedError;
  String get value => throw _privateConstructorUsedError;
  StatType get type => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $StatCopyWith<Stat> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StatCopyWith<$Res> {
  factory $StatCopyWith(Stat value, $Res Function(Stat) then) =
      _$StatCopyWithImpl<$Res>;
  $Res call({String label, String value, StatType type});
}

/// @nodoc
class _$StatCopyWithImpl<$Res> implements $StatCopyWith<$Res> {
  _$StatCopyWithImpl(this._value, this._then);

  final Stat _value;
  // ignore: unused_field
  final $Res Function(Stat) _then;

  @override
  $Res call({
    Object? label = freezed,
    Object? value = freezed,
    Object? type = freezed,
  }) {
    return _then(_value.copyWith(
      label: label == freezed
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as StatType,
    ));
  }
}

/// @nodoc
abstract class _$StatCopyWith<$Res> implements $StatCopyWith<$Res> {
  factory _$StatCopyWith(_Stat value, $Res Function(_Stat) then) =
      __$StatCopyWithImpl<$Res>;
  @override
  $Res call({String label, String value, StatType type});
}

/// @nodoc
class __$StatCopyWithImpl<$Res> extends _$StatCopyWithImpl<$Res>
    implements _$StatCopyWith<$Res> {
  __$StatCopyWithImpl(_Stat _value, $Res Function(_Stat) _then)
      : super(_value, (v) => _then(v as _Stat));

  @override
  _Stat get _value => super._value as _Stat;

  @override
  $Res call({
    Object? label = freezed,
    Object? value = freezed,
    Object? type = freezed,
  }) {
    return _then(_Stat(
      label: label == freezed
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as StatType,
    ));
  }
}

/// @nodoc

class _$_Stat extends _Stat {
  _$_Stat({this.label = "", this.value = "", required this.type}) : super._();

  @JsonKey(defaultValue: "")
  @override
  final String label;
  @JsonKey(defaultValue: "")
  @override
  final String value;
  @override
  final StatType type;

  @override
  String toString() {
    return 'Stat(label: $label, value: $value, type: $type)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Stat &&
            const DeepCollectionEquality().equals(other.label, label) &&
            const DeepCollectionEquality().equals(other.value, value) &&
            const DeepCollectionEquality().equals(other.type, type));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(label),
      const DeepCollectionEquality().hash(value),
      const DeepCollectionEquality().hash(type));

  @JsonKey(ignore: true)
  @override
  _$StatCopyWith<_Stat> get copyWith =>
      __$StatCopyWithImpl<_Stat>(this, _$identity);
}

abstract class _Stat extends Stat {
  factory _Stat({String label, String value, required StatType type}) = _$_Stat;
  _Stat._() : super._();

  @override
  String get label;
  @override
  String get value;
  @override
  StatType get type;
  @override
  @JsonKey(ignore: true)
  _$StatCopyWith<_Stat> get copyWith => throw _privateConstructorUsedError;
}
