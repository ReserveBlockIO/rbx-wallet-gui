// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'stat.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Stat _$StatFromJson(Map<String, dynamic> json) {
  return _Stat.fromJson(json);
}

/// @nodoc
mixin _$Stat {
  String get label => throw _privateConstructorUsedError;
  String get value => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  StatType get type => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StatCopyWith<Stat> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StatCopyWith<$Res> {
  factory $StatCopyWith(Stat value, $Res Function(Stat) then) =
      _$StatCopyWithImpl<$Res>;
  $Res call({String label, String value, String description, StatType type});
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
    Object? description = freezed,
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
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as StatType,
    ));
  }
}

/// @nodoc
abstract class _$$_StatCopyWith<$Res> implements $StatCopyWith<$Res> {
  factory _$$_StatCopyWith(_$_Stat value, $Res Function(_$_Stat) then) =
      __$$_StatCopyWithImpl<$Res>;
  @override
  $Res call({String label, String value, String description, StatType type});
}

/// @nodoc
class __$$_StatCopyWithImpl<$Res> extends _$StatCopyWithImpl<$Res>
    implements _$$_StatCopyWith<$Res> {
  __$$_StatCopyWithImpl(_$_Stat _value, $Res Function(_$_Stat) _then)
      : super(_value, (v) => _then(v as _$_Stat));

  @override
  _$_Stat get _value => super._value as _$_Stat;

  @override
  $Res call({
    Object? label = freezed,
    Object? value = freezed,
    Object? description = freezed,
    Object? type = freezed,
  }) {
    return _then(_$_Stat(
      label: label == freezed
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as StatType,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Stat extends _Stat {
  const _$_Stat(
      {this.label = "",
      this.value = "",
      this.description = "",
      this.type = StatType.string})
      : super._();

  factory _$_Stat.fromJson(Map<String, dynamic> json) => _$$_StatFromJson(json);

  @override
  @JsonKey()
  final String label;
  @override
  @JsonKey()
  final String value;
  @override
  @JsonKey()
  final String description;
  @override
  @JsonKey()
  final StatType type;

  @override
  String toString() {
    return 'Stat(label: $label, value: $value, description: $description, type: $type)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Stat &&
            const DeepCollectionEquality().equals(other.label, label) &&
            const DeepCollectionEquality().equals(other.value, value) &&
            const DeepCollectionEquality()
                .equals(other.description, description) &&
            const DeepCollectionEquality().equals(other.type, type));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(label),
      const DeepCollectionEquality().hash(value),
      const DeepCollectionEquality().hash(description),
      const DeepCollectionEquality().hash(type));

  @JsonKey(ignore: true)
  @override
  _$$_StatCopyWith<_$_Stat> get copyWith =>
      __$$_StatCopyWithImpl<_$_Stat>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_StatToJson(this);
  }
}

abstract class _Stat extends Stat {
  const factory _Stat(
      {final String label,
      final String value,
      final String description,
      final StatType type}) = _$_Stat;
  const _Stat._() : super._();

  factory _Stat.fromJson(Map<String, dynamic> json) = _$_Stat.fromJson;

  @override
  String get label => throw _privateConstructorUsedError;
  @override
  String get value => throw _privateConstructorUsedError;
  @override
  String get description => throw _privateConstructorUsedError;
  @override
  StatType get type => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_StatCopyWith<_$_Stat> get copyWith => throw _privateConstructorUsedError;
}
