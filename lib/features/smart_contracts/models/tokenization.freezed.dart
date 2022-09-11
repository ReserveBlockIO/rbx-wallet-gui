// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

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
      _$TokenizationCopyWithImpl<$Res>;
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
class _$TokenizationCopyWithImpl<$Res> implements $TokenizationCopyWith<$Res> {
  _$TokenizationCopyWithImpl(this._value, this._then);

  final Tokenization _value;
  // ignore: unused_field
  final $Res Function(Tokenization) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? properties = freezed,
    Object? photo = freezed,
    Object? provenance = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      properties: properties == freezed
          ? _value.properties
          : properties // ignore: cast_nullable_to_non_nullable
              as List<Property>,
      photo: photo == freezed
          ? _value.photo
          : photo // ignore: cast_nullable_to_non_nullable
              as Asset?,
      provenance: provenance == freezed
          ? _value.provenance
          : provenance // ignore: cast_nullable_to_non_nullable
              as Asset?,
    ));
  }

  @override
  $AssetCopyWith<$Res>? get photo {
    if (_value.photo == null) {
      return null;
    }

    return $AssetCopyWith<$Res>(_value.photo!, (value) {
      return _then(_value.copyWith(photo: value));
    });
  }

  @override
  $AssetCopyWith<$Res>? get provenance {
    if (_value.provenance == null) {
      return null;
    }

    return $AssetCopyWith<$Res>(_value.provenance!, (value) {
      return _then(_value.copyWith(provenance: value));
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
    extends _$TokenizationCopyWithImpl<$Res>
    implements _$$_TokenizationCopyWith<$Res> {
  __$$_TokenizationCopyWithImpl(
      _$_Tokenization _value, $Res Function(_$_Tokenization) _then)
      : super(_value, (v) => _then(v as _$_Tokenization));

  @override
  _$_Tokenization get _value => super._value as _$_Tokenization;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? properties = freezed,
    Object? photo = freezed,
    Object? provenance = freezed,
  }) {
    return _then(_$_Tokenization(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      properties: properties == freezed
          ? _value._properties
          : properties // ignore: cast_nullable_to_non_nullable
              as List<Property>,
      photo: photo == freezed
          ? _value.photo
          : photo // ignore: cast_nullable_to_non_nullable
              as Asset?,
      provenance: provenance == freezed
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
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality()
                .equals(other.description, description) &&
            const DeepCollectionEquality()
                .equals(other._properties, _properties) &&
            const DeepCollectionEquality().equals(other.photo, photo) &&
            const DeepCollectionEquality()
                .equals(other.provenance, provenance));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(description),
      const DeepCollectionEquality().hash(_properties),
      const DeepCollectionEquality().hash(photo),
      const DeepCollectionEquality().hash(provenance));

  @JsonKey(ignore: true)
  @override
  _$$_TokenizationCopyWith<_$_Tokenization> get copyWith =>
      __$$_TokenizationCopyWithImpl<_$_Tokenization>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TokenizationToJson(this);
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
  String get id => throw _privateConstructorUsedError;
  @override
  String get name => throw _privateConstructorUsedError;
  @override
  String get description => throw _privateConstructorUsedError;
  @override
  List<Property> get properties => throw _privateConstructorUsedError;
  @override
  Asset? get photo => throw _privateConstructorUsedError;
  @override
  Asset? get provenance => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_TokenizationCopyWith<_$_Tokenization> get copyWith =>
      throw _privateConstructorUsedError;
}
