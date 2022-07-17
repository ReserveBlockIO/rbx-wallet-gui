// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'asset.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Asset _$AssetFromJson(Map<String, dynamic> json) {
  return _Asset.fromJson(json);
}

/// @nodoc
mixin _$Asset {
  @JsonKey(name: "AssetId")
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: "Name")
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: "AssetAuthorName")
  String? get authorName => throw _privateConstructorUsedError;
  @JsonKey(name: "Location")
  String get location => throw _privateConstructorUsedError;
  @JsonKey(name: "Extension")
  String get extension => throw _privateConstructorUsedError;
  @JsonKey(name: "FileSize")
  int get fileSize => throw _privateConstructorUsedError;
  @JsonKey(toJson: bytesToNull, fromJson: nullToNull)
  Uint8List? get bytes => throw _privateConstructorUsedError;

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
      @JsonKey(name: "Name") String? name,
      @JsonKey(name: "AssetAuthorName") String? authorName,
      @JsonKey(name: "Location") String location,
      @JsonKey(name: "Extension") String extension,
      @JsonKey(name: "FileSize") int fileSize,
      @JsonKey(toJson: bytesToNull, fromJson: nullToNull) Uint8List? bytes});
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
    Object? authorName = freezed,
    Object? location = freezed,
    Object? extension = freezed,
    Object? fileSize = freezed,
    Object? bytes = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      authorName: authorName == freezed
          ? _value.authorName
          : authorName // ignore: cast_nullable_to_non_nullable
              as String?,
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
      bytes: bytes == freezed
          ? _value.bytes
          : bytes // ignore: cast_nullable_to_non_nullable
              as Uint8List?,
    ));
  }
}

/// @nodoc
abstract class _$$_AssetCopyWith<$Res> implements $AssetCopyWith<$Res> {
  factory _$$_AssetCopyWith(_$_Asset value, $Res Function(_$_Asset) then) =
      __$$_AssetCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: "AssetId") String id,
      @JsonKey(name: "Name") String? name,
      @JsonKey(name: "AssetAuthorName") String? authorName,
      @JsonKey(name: "Location") String location,
      @JsonKey(name: "Extension") String extension,
      @JsonKey(name: "FileSize") int fileSize,
      @JsonKey(toJson: bytesToNull, fromJson: nullToNull) Uint8List? bytes});
}

/// @nodoc
class __$$_AssetCopyWithImpl<$Res> extends _$AssetCopyWithImpl<$Res>
    implements _$$_AssetCopyWith<$Res> {
  __$$_AssetCopyWithImpl(_$_Asset _value, $Res Function(_$_Asset) _then)
      : super(_value, (v) => _then(v as _$_Asset));

  @override
  _$_Asset get _value => super._value as _$_Asset;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? authorName = freezed,
    Object? location = freezed,
    Object? extension = freezed,
    Object? fileSize = freezed,
    Object? bytes = freezed,
  }) {
    return _then(_$_Asset(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      authorName: authorName == freezed
          ? _value.authorName
          : authorName // ignore: cast_nullable_to_non_nullable
              as String?,
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
      bytes: bytes == freezed
          ? _value.bytes
          : bytes // ignore: cast_nullable_to_non_nullable
              as Uint8List?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_Asset extends _Asset with DiagnosticableTreeMixin {
  _$_Asset(
      {@JsonKey(name: "AssetId") required this.id,
      @JsonKey(name: "Name") this.name,
      @JsonKey(name: "AssetAuthorName") this.authorName,
      @JsonKey(name: "Location") required this.location,
      @JsonKey(name: "Extension") required this.extension,
      @JsonKey(name: "FileSize") required this.fileSize,
      @JsonKey(toJson: bytesToNull, fromJson: nullToNull) this.bytes})
      : super._();

  factory _$_Asset.fromJson(Map<String, dynamic> json) =>
      _$$_AssetFromJson(json);

  @override
  @JsonKey(name: "AssetId")
  final String id;
  @override
  @JsonKey(name: "Name")
  final String? name;
  @override
  @JsonKey(name: "AssetAuthorName")
  final String? authorName;
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
  @JsonKey(toJson: bytesToNull, fromJson: nullToNull)
  final Uint8List? bytes;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Asset(id: $id, name: $name, authorName: $authorName, location: $location, extension: $extension, fileSize: $fileSize, bytes: $bytes)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Asset'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('authorName', authorName))
      ..add(DiagnosticsProperty('location', location))
      ..add(DiagnosticsProperty('extension', extension))
      ..add(DiagnosticsProperty('fileSize', fileSize))
      ..add(DiagnosticsProperty('bytes', bytes));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Asset &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality()
                .equals(other.authorName, authorName) &&
            const DeepCollectionEquality().equals(other.location, location) &&
            const DeepCollectionEquality().equals(other.extension, extension) &&
            const DeepCollectionEquality().equals(other.fileSize, fileSize) &&
            const DeepCollectionEquality().equals(other.bytes, bytes));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(authorName),
      const DeepCollectionEquality().hash(location),
      const DeepCollectionEquality().hash(extension),
      const DeepCollectionEquality().hash(fileSize),
      const DeepCollectionEquality().hash(bytes));

  @JsonKey(ignore: true)
  @override
  _$$_AssetCopyWith<_$_Asset> get copyWith =>
      __$$_AssetCopyWithImpl<_$_Asset>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AssetToJson(this);
  }
}

abstract class _Asset extends Asset {
  factory _Asset(
      {@JsonKey(name: "AssetId")
          required final String id,
      @JsonKey(name: "Name")
          final String? name,
      @JsonKey(name: "AssetAuthorName")
          final String? authorName,
      @JsonKey(name: "Location")
          required final String location,
      @JsonKey(name: "Extension")
          required final String extension,
      @JsonKey(name: "FileSize")
          required final int fileSize,
      @JsonKey(toJson: bytesToNull, fromJson: nullToNull)
          final Uint8List? bytes}) = _$_Asset;
  _Asset._() : super._();

  factory _Asset.fromJson(Map<String, dynamic> json) = _$_Asset.fromJson;

  @override
  @JsonKey(name: "AssetId")
  String get id => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "Name")
  String? get name => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "AssetAuthorName")
  String? get authorName => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "Location")
  String get location => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "Extension")
  String get extension => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "FileSize")
  int get fileSize => throw _privateConstructorUsedError;
  @override
  @JsonKey(toJson: bytesToNull, fromJson: nullToNull)
  Uint8List? get bytes => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_AssetCopyWith<_$_Asset> get copyWith =>
      throw _privateConstructorUsedError;
}
