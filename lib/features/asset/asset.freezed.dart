// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

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
  String? get location => throw _privateConstructorUsedError;
  @JsonKey(name: "Extension")
  String? get extension => throw _privateConstructorUsedError;
  @JsonKey(name: "FileSize")
  int get fileSize => throw _privateConstructorUsedError;
  @JsonKey(toJson: bytesToNull, fromJson: nullToNull, includeToJson: false)
  Uint8List? get bytes => throw _privateConstructorUsedError;
  @JsonKey(includeToJson: false)
  String? get localPath => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AssetCopyWith<Asset> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AssetCopyWith<$Res> {
  factory $AssetCopyWith(Asset value, $Res Function(Asset) then) =
      _$AssetCopyWithImpl<$Res, Asset>;
  @useResult
  $Res call(
      {@JsonKey(name: "AssetId")
          String id,
      @JsonKey(name: "Name")
          String? name,
      @JsonKey(name: "AssetAuthorName")
          String? authorName,
      @JsonKey(name: "Location")
          String? location,
      @JsonKey(name: "Extension")
          String? extension,
      @JsonKey(name: "FileSize")
          int fileSize,
      @JsonKey(toJson: bytesToNull, fromJson: nullToNull, includeToJson: false)
          Uint8List? bytes,
      @JsonKey(includeToJson: false)
          String? localPath});
}

/// @nodoc
class _$AssetCopyWithImpl<$Res, $Val extends Asset>
    implements $AssetCopyWith<$Res> {
  _$AssetCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = freezed,
    Object? authorName = freezed,
    Object? location = freezed,
    Object? extension = freezed,
    Object? fileSize = null,
    Object? bytes = freezed,
    Object? localPath = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      authorName: freezed == authorName
          ? _value.authorName
          : authorName // ignore: cast_nullable_to_non_nullable
              as String?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      extension: freezed == extension
          ? _value.extension
          : extension // ignore: cast_nullable_to_non_nullable
              as String?,
      fileSize: null == fileSize
          ? _value.fileSize
          : fileSize // ignore: cast_nullable_to_non_nullable
              as int,
      bytes: freezed == bytes
          ? _value.bytes
          : bytes // ignore: cast_nullable_to_non_nullable
              as Uint8List?,
      localPath: freezed == localPath
          ? _value.localPath
          : localPath // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AssetCopyWith<$Res> implements $AssetCopyWith<$Res> {
  factory _$$_AssetCopyWith(_$_Asset value, $Res Function(_$_Asset) then) =
      __$$_AssetCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "AssetId")
          String id,
      @JsonKey(name: "Name")
          String? name,
      @JsonKey(name: "AssetAuthorName")
          String? authorName,
      @JsonKey(name: "Location")
          String? location,
      @JsonKey(name: "Extension")
          String? extension,
      @JsonKey(name: "FileSize")
          int fileSize,
      @JsonKey(toJson: bytesToNull, fromJson: nullToNull, includeToJson: false)
          Uint8List? bytes,
      @JsonKey(includeToJson: false)
          String? localPath});
}

/// @nodoc
class __$$_AssetCopyWithImpl<$Res> extends _$AssetCopyWithImpl<$Res, _$_Asset>
    implements _$$_AssetCopyWith<$Res> {
  __$$_AssetCopyWithImpl(_$_Asset _value, $Res Function(_$_Asset) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = freezed,
    Object? authorName = freezed,
    Object? location = freezed,
    Object? extension = freezed,
    Object? fileSize = null,
    Object? bytes = freezed,
    Object? localPath = freezed,
  }) {
    return _then(_$_Asset(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      authorName: freezed == authorName
          ? _value.authorName
          : authorName // ignore: cast_nullable_to_non_nullable
              as String?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      extension: freezed == extension
          ? _value.extension
          : extension // ignore: cast_nullable_to_non_nullable
              as String?,
      fileSize: null == fileSize
          ? _value.fileSize
          : fileSize // ignore: cast_nullable_to_non_nullable
              as int,
      bytes: freezed == bytes
          ? _value.bytes
          : bytes // ignore: cast_nullable_to_non_nullable
              as Uint8List?,
      localPath: freezed == localPath
          ? _value.localPath
          : localPath // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_Asset extends _Asset with DiagnosticableTreeMixin {
  _$_Asset(
      {@JsonKey(name: "AssetId")
          required this.id,
      @JsonKey(name: "Name")
          this.name,
      @JsonKey(name: "AssetAuthorName")
          this.authorName,
      @JsonKey(name: "Location")
          this.location,
      @JsonKey(name: "Extension")
          this.extension,
      @JsonKey(name: "FileSize")
          required this.fileSize,
      @JsonKey(toJson: bytesToNull, fromJson: nullToNull, includeToJson: false)
          this.bytes,
      @JsonKey(includeToJson: false)
          this.localPath})
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
  final String? location;
  @override
  @JsonKey(name: "Extension")
  final String? extension;
  @override
  @JsonKey(name: "FileSize")
  final int fileSize;
  @override
  @JsonKey(toJson: bytesToNull, fromJson: nullToNull, includeToJson: false)
  final Uint8List? bytes;
  @override
  @JsonKey(includeToJson: false)
  final String? localPath;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Asset(id: $id, name: $name, authorName: $authorName, location: $location, extension: $extension, fileSize: $fileSize, bytes: $bytes, localPath: $localPath)';
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
      ..add(DiagnosticsProperty('bytes', bytes))
      ..add(DiagnosticsProperty('localPath', localPath));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Asset &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.authorName, authorName) ||
                other.authorName == authorName) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.extension, extension) ||
                other.extension == extension) &&
            (identical(other.fileSize, fileSize) ||
                other.fileSize == fileSize) &&
            const DeepCollectionEquality().equals(other.bytes, bytes) &&
            (identical(other.localPath, localPath) ||
                other.localPath == localPath));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      authorName,
      location,
      extension,
      fileSize,
      const DeepCollectionEquality().hash(bytes),
      localPath);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AssetCopyWith<_$_Asset> get copyWith =>
      __$$_AssetCopyWithImpl<_$_Asset>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AssetToJson(
      this,
    );
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
          final String? location,
      @JsonKey(name: "Extension")
          final String? extension,
      @JsonKey(name: "FileSize")
          required final int fileSize,
      @JsonKey(toJson: bytesToNull, fromJson: nullToNull, includeToJson: false)
          final Uint8List? bytes,
      @JsonKey(includeToJson: false)
          final String? localPath}) = _$_Asset;
  _Asset._() : super._();

  factory _Asset.fromJson(Map<String, dynamic> json) = _$_Asset.fromJson;

  @override
  @JsonKey(name: "AssetId")
  String get id;
  @override
  @JsonKey(name: "Name")
  String? get name;
  @override
  @JsonKey(name: "AssetAuthorName")
  String? get authorName;
  @override
  @JsonKey(name: "Location")
  String? get location;
  @override
  @JsonKey(name: "Extension")
  String? get extension;
  @override
  @JsonKey(name: "FileSize")
  int get fileSize;
  @override
  @JsonKey(toJson: bytesToNull, fromJson: nullToNull, includeToJson: false)
  Uint8List? get bytes;
  @override
  @JsonKey(includeToJson: false)
  String? get localPath;
  @override
  @JsonKey(ignore: true)
  _$$_AssetCopyWith<_$_Asset> get copyWith =>
      throw _privateConstructorUsedError;
}
