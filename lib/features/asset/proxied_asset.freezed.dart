// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'proxied_asset.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ProxiedAsset {
  String get key => throw _privateConstructorUsedError;
  int get fileSize => throw _privateConstructorUsedError;
  String get fileName => throw _privateConstructorUsedError;
  String get authorName => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProxiedAssetCopyWith<ProxiedAsset> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProxiedAssetCopyWith<$Res> {
  factory $ProxiedAssetCopyWith(
          ProxiedAsset value, $Res Function(ProxiedAsset) then) =
      _$ProxiedAssetCopyWithImpl<$Res, ProxiedAsset>;
  @useResult
  $Res call({String key, int fileSize, String fileName, String authorName});
}

/// @nodoc
class _$ProxiedAssetCopyWithImpl<$Res, $Val extends ProxiedAsset>
    implements $ProxiedAssetCopyWith<$Res> {
  _$ProxiedAssetCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? key = null,
    Object? fileSize = null,
    Object? fileName = null,
    Object? authorName = null,
  }) {
    return _then(_value.copyWith(
      key: null == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String,
      fileSize: null == fileSize
          ? _value.fileSize
          : fileSize // ignore: cast_nullable_to_non_nullable
              as int,
      fileName: null == fileName
          ? _value.fileName
          : fileName // ignore: cast_nullable_to_non_nullable
              as String,
      authorName: null == authorName
          ? _value.authorName
          : authorName // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ProxiedAssetCopyWith<$Res>
    implements $ProxiedAssetCopyWith<$Res> {
  factory _$$_ProxiedAssetCopyWith(
          _$_ProxiedAsset value, $Res Function(_$_ProxiedAsset) then) =
      __$$_ProxiedAssetCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String key, int fileSize, String fileName, String authorName});
}

/// @nodoc
class __$$_ProxiedAssetCopyWithImpl<$Res>
    extends _$ProxiedAssetCopyWithImpl<$Res, _$_ProxiedAsset>
    implements _$$_ProxiedAssetCopyWith<$Res> {
  __$$_ProxiedAssetCopyWithImpl(
      _$_ProxiedAsset _value, $Res Function(_$_ProxiedAsset) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? key = null,
    Object? fileSize = null,
    Object? fileName = null,
    Object? authorName = null,
  }) {
    return _then(_$_ProxiedAsset(
      key: null == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String,
      fileSize: null == fileSize
          ? _value.fileSize
          : fileSize // ignore: cast_nullable_to_non_nullable
              as int,
      fileName: null == fileName
          ? _value.fileName
          : fileName // ignore: cast_nullable_to_non_nullable
              as String,
      authorName: null == authorName
          ? _value.authorName
          : authorName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_ProxiedAsset extends _ProxiedAsset {
  _$_ProxiedAsset(
      {required this.key,
      required this.fileSize,
      required this.fileName,
      required this.authorName})
      : super._();

  @override
  final String key;
  @override
  final int fileSize;
  @override
  final String fileName;
  @override
  final String authorName;

  @override
  String toString() {
    return 'ProxiedAsset(key: $key, fileSize: $fileSize, fileName: $fileName, authorName: $authorName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProxiedAsset &&
            (identical(other.key, key) || other.key == key) &&
            (identical(other.fileSize, fileSize) ||
                other.fileSize == fileSize) &&
            (identical(other.fileName, fileName) ||
                other.fileName == fileName) &&
            (identical(other.authorName, authorName) ||
                other.authorName == authorName));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, key, fileSize, fileName, authorName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ProxiedAssetCopyWith<_$_ProxiedAsset> get copyWith =>
      __$$_ProxiedAssetCopyWithImpl<_$_ProxiedAsset>(this, _$identity);
}

abstract class _ProxiedAsset extends ProxiedAsset {
  factory _ProxiedAsset(
      {required final String key,
      required final int fileSize,
      required final String fileName,
      required final String authorName}) = _$_ProxiedAsset;
  _ProxiedAsset._() : super._();

  @override
  String get key;
  @override
  int get fileSize;
  @override
  String get fileName;
  @override
  String get authorName;
  @override
  @JsonKey(ignore: true)
  _$$_ProxiedAssetCopyWith<_$_ProxiedAsset> get copyWith =>
      throw _privateConstructorUsedError;
}
