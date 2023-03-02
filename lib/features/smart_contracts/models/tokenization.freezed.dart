// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tokenization.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Tokenization _$TokenizationFromJson(Map<String, dynamic> json) {
  return _Tokenization.fromJson(json);
}

/// @nodoc
mixin _$Tokenization {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  List<Property> get properties => throw _privateConstructorUsedError;
  Asset? get photo => throw _privateConstructorUsedError;
  Asset? get provenance => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TokenizationCopyWith<Tokenization> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TokenizationCopyWith<$Res> {
  factory $TokenizationCopyWith(
          Tokenization value, $Res Function(Tokenization) then) =
      _$TokenizationCopyWithImpl<$Res, Tokenization>;
  @useResult
  $Res call(
      {String id,
      String name,
      String description,
      List<Property> properties,
      Asset? photo,
      Asset? provenance});

  $AssetCopyWith<$Res>? get photo;
  $AssetCopyWith<$Res>? get provenance;
}

/// @nodoc
class _$TokenizationCopyWithImpl<$Res, $Val extends Tokenization>
    implements $TokenizationCopyWith<$Res> {
  _$TokenizationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? properties = null,
    Object? photo = freezed,
    Object? provenance = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      properties: null == properties
          ? _value.properties
          : properties // ignore: cast_nullable_to_non_nullable
              as List<Property>,
      photo: freezed == photo
          ? _value.photo
          : photo // ignore: cast_nullable_to_non_nullable
              as Asset?,
      provenance: freezed == provenance
          ? _value.provenance
          : provenance // ignore: cast_nullable_to_non_nullable
              as Asset?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AssetCopyWith<$Res>? get photo {
    if (_value.photo == null) {
      return null;
    }

    return $AssetCopyWith<$Res>(_value.photo!, (value) {
      return _then(_value.copyWith(photo: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $AssetCopyWith<$Res>? get provenance {
    if (_value.provenance == null) {
      return null;
    }

    return $AssetCopyWith<$Res>(_value.provenance!, (value) {
      return _then(_value.copyWith(provenance: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_TokenizationCopyWith<$Res>
    implements $TokenizationCopyWith<$Res> {
  factory _$$_TokenizationCopyWith(
          _$_Tokenization value, $Res Function(_$_Tokenization) then) =
      __$$_TokenizationCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String description,
      List<Property> properties,
      Asset? photo,
      Asset? provenance});

  @override
  $AssetCopyWith<$Res>? get photo;
  @override
  $AssetCopyWith<$Res>? get provenance;
}

/// @nodoc
class __$$_TokenizationCopyWithImpl<$Res>
    extends _$TokenizationCopyWithImpl<$Res, _$_Tokenization>
    implements _$$_TokenizationCopyWith<$Res> {
  __$$_TokenizationCopyWithImpl(
      _$_Tokenization _value, $Res Function(_$_Tokenization) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? properties = null,
    Object? photo = freezed,
    Object? provenance = freezed,
  }) {
    return _then(_$_Tokenization(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      properties: null == properties
          ? _value._properties
          : properties // ignore: cast_nullable_to_non_nullable
              as List<Property>,
      photo: freezed == photo
          ? _value.photo
          : photo // ignore: cast_nullable_to_non_nullable
              as Asset?,
      provenance: freezed == provenance
          ? _value.provenance
          : provenance // ignore: cast_nullable_to_non_nullable
              as Asset?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_Tokenization extends _Tokenization {
  const _$_Tokenization(
      {this.id = "",
      this.name = "",
      this.description = "",
      final List<Property> properties = const [],
      this.photo,
      this.provenance})
      : _properties = properties,
        super._();

  factory _$_Tokenization.fromJson(Map<String, dynamic> json) =>
      _$$_TokenizationFromJson(json);

  @override
  @JsonKey()
  final String id;
  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final String description;
  final List<Property> _properties;
  @override
  @JsonKey()
  List<Property> get properties {
    if (_properties is EqualUnmodifiableListView) return _properties;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_properties);
  }

  @override
  final Asset? photo;
  @override
  final Asset? provenance;

  @override
  String toString() {
    return 'Tokenization(id: $id, name: $name, description: $description, properties: $properties, photo: $photo, provenance: $provenance)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Tokenization &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality()
                .equals(other._properties, _properties) &&
            (identical(other.photo, photo) || other.photo == photo) &&
            (identical(other.provenance, provenance) ||
                other.provenance == provenance));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, description,
      const DeepCollectionEquality().hash(_properties), photo, provenance);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TokenizationCopyWith<_$_Tokenization> get copyWith =>
      __$$_TokenizationCopyWithImpl<_$_Tokenization>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TokenizationToJson(
      this,
    );
  }
}

abstract class _Tokenization extends Tokenization {
  const factory _Tokenization(
      {final String id,
      final String name,
      final String description,
      final List<Property> properties,
      final Asset? photo,
      final Asset? provenance}) = _$_Tokenization;
  const _Tokenization._() : super._();

  factory _Tokenization.fromJson(Map<String, dynamic> json) =
      _$_Tokenization.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get description;
  @override
  List<Property> get properties;
  @override
  Asset? get photo;
  @override
  Asset? get provenance;
  @override
  @JsonKey(ignore: true)
  _$$_TokenizationCopyWith<_$_Tokenization> get copyWith =>
      throw _privateConstructorUsedError;
}
