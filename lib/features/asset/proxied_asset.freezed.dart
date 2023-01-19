// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

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
  $ProxiedAssetCopyWith<ProxiedAsset> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProxiedAssetCopyWith<$Res> {
  factory $ProxiedAssetCopyWith(ProxiedAsset value, $Res Function(ProxiedAsset) then) = _$ProxiedAssetCopyWithImpl<$Res>;
  $Res call({String key, int fileSize, String fileName, String authorName});
}

/// @nodoc
class _$ProxiedAssetCopyWithImpl<$Res> implements $ProxiedAssetCopyWith<$Res> {
  _$ProxiedAssetCopyWithImpl(this._value, this._then);

  final ProxiedAsset _value;
  // ignore: unused_field
  final $Res Function(ProxiedAsset) _then;

  @override
  $Res call({
    Object? key = freezed,
    Object? fileSize = freezed,
    Object? fileName = freezed,
    Object? authorName = freezed,
  }) {
    return _then(_value.copyWith(
      key: key == freezed
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String,
      fileSize: fileSize == freezed
          ? _value.fileSize
          : fileSize // ignore: cast_nullable_to_non_nullable
              as int,
      fileName: fileName == freezed
          ? _value.fileName
          : fileName // ignore: cast_nullable_to_non_nullable
              as String,
      authorName: authorName == freezed
          ? _value.authorName
          : authorName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_ProxiedAssetCopyWith<$Res> implements $ProxiedAssetCopyWith<$Res> {
  factory _$$_ProxiedAssetCopyWith(_$_ProxiedAsset value, $Res Function(_$_ProxiedAsset) then) = __$$_ProxiedAssetCopyWithImpl<$Res>;
  @override
  $Res call({String key, int fileSize, String fileName, String authorName});
}

/// @nodoc
class __$$_ProxiedAssetCopyWithImpl<$Res> extends _$ProxiedAssetCopyWithImpl<$Res> implements _$$_ProxiedAssetCopyWith<$Res> {
  __$$_ProxiedAssetCopyWithImpl(_$_ProxiedAsset _value, $Res Function(_$_ProxiedAsset) _then) : super(_value, (v) => _then(v as _$_ProxiedAsset));

  @override
  _$_ProxiedAsset get _value => super._value as _$_ProxiedAsset;

  @override
  $Res call({
    Object? key = freezed,
    Object? fileSize = freezed,
    Object? fileName = freezed,
    Object? authorName = freezed,
  }) {
    return _then(_$_ProxiedAsset(
      key: key == freezed
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String,
      fileSize: fileSize == freezed
          ? _value.fileSize
          : fileSize // ignore: cast_nullable_to_non_nullable
              as int,
      fileName: fileName == freezed
          ? _value.fileName
          : fileName // ignore: cast_nullable_to_non_nullable
              as String,
      authorName: authorName == freezed
          ? _value.authorName
          : authorName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_ProxiedAsset extends _ProxiedAsset {
  _$_ProxiedAsset({required this.key, required this.fileSize, required this.fileName, required this.authorName}) : super._();

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
            const DeepCollectionEquality().equals(other.key, key) &&
            const DeepCollectionEquality().equals(other.fileSize, fileSize) &&
            const DeepCollectionEquality().equals(other.fileName, fileName) &&
            const DeepCollectionEquality().equals(other.authorName, authorName));
  }

  @override
  int get hashCode => Object.hash(runtimeType, const DeepCollectionEquality().hash(key), const DeepCollectionEquality().hash(fileSize),
      const DeepCollectionEquality().hash(fileName), const DeepCollectionEquality().hash(authorName));

  @JsonKey(ignore: true)
  @override
  _$$_ProxiedAssetCopyWith<_$_ProxiedAsset> get copyWith => __$$_ProxiedAssetCopyWithImpl<_$_ProxiedAsset>(this, _$identity);
}

abstract class _ProxiedAsset extends ProxiedAsset {
  factory _ProxiedAsset({required final String key, required final int fileSize, required final String fileName, required final String authorName}) =
      _$_ProxiedAsset;
  _ProxiedAsset._() : super._();

  @override
  String get key => throw _privateConstructorUsedError;
  @override
  int get fileSize => throw _privateConstructorUsedError;
  @override
  String get fileName => throw _privateConstructorUsedError;
  @override
  String get authorName => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_ProxiedAssetCopyWith<_$_ProxiedAsset> get copyWith => throw _privateConstructorUsedError;
}
