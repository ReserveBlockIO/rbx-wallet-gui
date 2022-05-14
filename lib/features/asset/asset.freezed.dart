// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'asset.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Asset _$AssetFromJson(Map<String, dynamic> json) {
  return _Asset.fromJson(json);
}

/// @nodoc
class _$AssetTearOff {
  const _$AssetTearOff();

  _Asset call(
      {@JsonKey(name: "AssetId") required String id,
      @JsonKey(name: "Name") required String name,
      @JsonKey(name: "Location") required String location,
      @JsonKey(name: "Extension") required String extension,
      @JsonKey(name: "FileSize") required int fileSize}) {
    return _Asset(
      id: id,
      name: name,
      location: location,
      extension: extension,
      fileSize: fileSize,
    );
  }

  Asset fromJson(Map<String, Object?> json) {
    return Asset.fromJson(json);
  }
}

/// @nodoc
const $Asset = _$AssetTearOff();

/// @nodoc
mixin _$Asset {
  @JsonKey(name: "AssetId")
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: "Name")
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: "Location")
  String get location => throw _privateConstructorUsedError;
  @JsonKey(name: "Extension")
  String get extension => throw _privateConstructorUsedError;
  @JsonKey(name: "FileSize")
  int get fileSize => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AssetCopyWith<Asset> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AssetCopyWith<$Res> {
  factory $AssetCopyWith(Asset value, $Res Function(Asset) then) =
      _$AssetCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: "AssetId") String id,
      @JsonKey(name: "Name") String name,
      @JsonKey(name: "Location") String location,
      @JsonKey(name: "Extension") String extension,
      @JsonKey(name: "FileSize") int fileSize});
}

/// @nodoc
class _$AssetCopyWithImpl<$Res> implements $AssetCopyWith<$Res> {
  _$AssetCopyWithImpl(this._value, this._then);

  final Asset _value;
  // ignore: unused_field
  final $Res Function(Asset) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? location = freezed,
    Object? extension = freezed,
    Object? fileSize = freezed,
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
      location: location == freezed
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      extension: extension == freezed
          ? _value.extension
          : extension // ignore: cast_nullable_to_non_nullable
              as String,
      fileSize: fileSize == freezed
          ? _value.fileSize
          : fileSize // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$AssetCopyWith<$Res> implements $AssetCopyWith<$Res> {
  factory _$AssetCopyWith(_Asset value, $Res Function(_Asset) then) =
      __$AssetCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: "AssetId") String id,
      @JsonKey(name: "Name") String name,
      @JsonKey(name: "Location") String location,
      @JsonKey(name: "Extension") String extension,
      @JsonKey(name: "FileSize") int fileSize});
}

/// @nodoc
class __$AssetCopyWithImpl<$Res> extends _$AssetCopyWithImpl<$Res>
    implements _$AssetCopyWith<$Res> {
  __$AssetCopyWithImpl(_Asset _value, $Res Function(_Asset) _then)
      : super(_value, (v) => _then(v as _Asset));

  @override
  _Asset get _value => super._value as _Asset;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? location = freezed,
    Object? extension = freezed,
    Object? fileSize = freezed,
  }) {
    return _then(_Asset(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      location: location == freezed
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      extension: extension == freezed
          ? _value.extension
          : extension // ignore: cast_nullable_to_non_nullable
              as String,
      fileSize: fileSize == freezed
          ? _value.fileSize
          : fileSize // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_Asset extends _Asset {
  _$_Asset(
      {@JsonKey(name: "AssetId") required this.id,
      @JsonKey(name: "Name") required this.name,
      @JsonKey(name: "Location") required this.location,
      @JsonKey(name: "Extension") required this.extension,
      @JsonKey(name: "FileSize") required this.fileSize})
      : super._();

  factory _$_Asset.fromJson(Map<String, dynamic> json) =>
      _$$_AssetFromJson(json);

  @override
  @JsonKey(name: "AssetId")
  final String id;
  @override
  @JsonKey(name: "Name")
  final String name;
  @override
  @JsonKey(name: "Location")
  final String location;
  @override
  @JsonKey(name: "Extension")
  final String extension;
  @override
  @JsonKey(name: "FileSize")
  final int fileSize;

  @override
  String toString() {
    return 'Asset(id: $id, name: $name, location: $location, extension: $extension, fileSize: $fileSize)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Asset &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.location, location) &&
            const DeepCollectionEquality().equals(other.extension, extension) &&
            const DeepCollectionEquality().equals(other.fileSize, fileSize));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(location),
      const DeepCollectionEquality().hash(extension),
      const DeepCollectionEquality().hash(fileSize));

  @JsonKey(ignore: true)
  @override
  _$AssetCopyWith<_Asset> get copyWith =>
      __$AssetCopyWithImpl<_Asset>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AssetToJson(this);
  }
}

abstract class _Asset extends Asset {
  factory _Asset(
      {@JsonKey(name: "AssetId") required String id,
      @JsonKey(name: "Name") required String name,
      @JsonKey(name: "Location") required String location,
      @JsonKey(name: "Extension") required String extension,
      @JsonKey(name: "FileSize") required int fileSize}) = _$_Asset;
  _Asset._() : super._();

  factory _Asset.fromJson(Map<String, dynamic> json) = _$_Asset.fromJson;

  @override
  @JsonKey(name: "AssetId")
  String get id;
  @override
  @JsonKey(name: "Name")
  String get name;
  @override
  @JsonKey(name: "Location")
  String get location;
  @override
  @JsonKey(name: "Extension")
  String get extension;
  @override
  @JsonKey(name: "FileSize")
  int get fileSize;
  @override
  @JsonKey(ignore: true)
  _$AssetCopyWith<_Asset> get copyWith => throw _privateConstructorUsedError;
}
