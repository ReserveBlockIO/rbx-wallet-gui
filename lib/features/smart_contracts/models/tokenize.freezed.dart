// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tokenize.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Tokenize _$TokenizeFromJson(Map<String, dynamic> json) {
  return _Tokenize.fromJson(json);
}

/// @nodoc
mixin _$Tokenize {
  @JsonKey(name: "AssetName")
  String get assetName => throw _privateConstructorUsedError;
  @JsonKey(name: "AssetTicker")
  String get assetTicker => throw _privateConstructorUsedError;
  @JsonKey(name: "KeyRevealed")
  bool get keyRevealed => throw _privateConstructorUsedError;
  @JsonKey(name: "KeyRevealedRequestHash")
  String? get keyRevealedRequestHash => throw _privateConstructorUsedError;
  @JsonKey(name: "ImageBase")
  String? get imageBase => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TokenizeCopyWith<Tokenize> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TokenizeCopyWith<$Res> {
  factory $TokenizeCopyWith(Tokenize value, $Res Function(Tokenize) then) =
      _$TokenizeCopyWithImpl<$Res, Tokenize>;
  @useResult
  $Res call(
      {@JsonKey(name: "AssetName") String assetName,
      @JsonKey(name: "AssetTicker") String assetTicker,
      @JsonKey(name: "KeyRevealed") bool keyRevealed,
      @JsonKey(name: "KeyRevealedRequestHash") String? keyRevealedRequestHash,
      @JsonKey(name: "ImageBase") String? imageBase});
}

/// @nodoc
class _$TokenizeCopyWithImpl<$Res, $Val extends Tokenize>
    implements $TokenizeCopyWith<$Res> {
  _$TokenizeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? assetName = null,
    Object? assetTicker = null,
    Object? keyRevealed = null,
    Object? keyRevealedRequestHash = freezed,
    Object? imageBase = freezed,
  }) {
    return _then(_value.copyWith(
      assetName: null == assetName
          ? _value.assetName
          : assetName // ignore: cast_nullable_to_non_nullable
              as String,
      assetTicker: null == assetTicker
          ? _value.assetTicker
          : assetTicker // ignore: cast_nullable_to_non_nullable
              as String,
      keyRevealed: null == keyRevealed
          ? _value.keyRevealed
          : keyRevealed // ignore: cast_nullable_to_non_nullable
              as bool,
      keyRevealedRequestHash: freezed == keyRevealedRequestHash
          ? _value.keyRevealedRequestHash
          : keyRevealedRequestHash // ignore: cast_nullable_to_non_nullable
              as String?,
      imageBase: freezed == imageBase
          ? _value.imageBase
          : imageBase // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TokenizeCopyWith<$Res> implements $TokenizeCopyWith<$Res> {
  factory _$$_TokenizeCopyWith(
          _$_Tokenize value, $Res Function(_$_Tokenize) then) =
      __$$_TokenizeCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "AssetName") String assetName,
      @JsonKey(name: "AssetTicker") String assetTicker,
      @JsonKey(name: "KeyRevealed") bool keyRevealed,
      @JsonKey(name: "KeyRevealedRequestHash") String? keyRevealedRequestHash,
      @JsonKey(name: "ImageBase") String? imageBase});
}

/// @nodoc
class __$$_TokenizeCopyWithImpl<$Res>
    extends _$TokenizeCopyWithImpl<$Res, _$_Tokenize>
    implements _$$_TokenizeCopyWith<$Res> {
  __$$_TokenizeCopyWithImpl(
      _$_Tokenize _value, $Res Function(_$_Tokenize) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? assetName = null,
    Object? assetTicker = null,
    Object? keyRevealed = null,
    Object? keyRevealedRequestHash = freezed,
    Object? imageBase = freezed,
  }) {
    return _then(_$_Tokenize(
      assetName: null == assetName
          ? _value.assetName
          : assetName // ignore: cast_nullable_to_non_nullable
              as String,
      assetTicker: null == assetTicker
          ? _value.assetTicker
          : assetTicker // ignore: cast_nullable_to_non_nullable
              as String,
      keyRevealed: null == keyRevealed
          ? _value.keyRevealed
          : keyRevealed // ignore: cast_nullable_to_non_nullable
              as bool,
      keyRevealedRequestHash: freezed == keyRevealedRequestHash
          ? _value.keyRevealedRequestHash
          : keyRevealedRequestHash // ignore: cast_nullable_to_non_nullable
              as String?,
      imageBase: freezed == imageBase
          ? _value.imageBase
          : imageBase // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_Tokenize extends _Tokenize {
  const _$_Tokenize(
      {@JsonKey(name: "AssetName") required this.assetName,
      @JsonKey(name: "AssetTicker") required this.assetTicker,
      @JsonKey(name: "KeyRevealed") this.keyRevealed = false,
      @JsonKey(name: "KeyRevealedRequestHash") this.keyRevealedRequestHash,
      @JsonKey(name: "ImageBase") this.imageBase})
      : super._();

  factory _$_Tokenize.fromJson(Map<String, dynamic> json) =>
      _$$_TokenizeFromJson(json);

  @override
  @JsonKey(name: "AssetName")
  final String assetName;
  @override
  @JsonKey(name: "AssetTicker")
  final String assetTicker;
  @override
  @JsonKey(name: "KeyRevealed")
  final bool keyRevealed;
  @override
  @JsonKey(name: "KeyRevealedRequestHash")
  final String? keyRevealedRequestHash;
  @override
  @JsonKey(name: "ImageBase")
  final String? imageBase;

  @override
  String toString() {
    return 'Tokenize(assetName: $assetName, assetTicker: $assetTicker, keyRevealed: $keyRevealed, keyRevealedRequestHash: $keyRevealedRequestHash, imageBase: $imageBase)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Tokenize &&
            (identical(other.assetName, assetName) ||
                other.assetName == assetName) &&
            (identical(other.assetTicker, assetTicker) ||
                other.assetTicker == assetTicker) &&
            (identical(other.keyRevealed, keyRevealed) ||
                other.keyRevealed == keyRevealed) &&
            (identical(other.keyRevealedRequestHash, keyRevealedRequestHash) ||
                other.keyRevealedRequestHash == keyRevealedRequestHash) &&
            (identical(other.imageBase, imageBase) ||
                other.imageBase == imageBase));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, assetName, assetTicker,
      keyRevealed, keyRevealedRequestHash, imageBase);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TokenizeCopyWith<_$_Tokenize> get copyWith =>
      __$$_TokenizeCopyWithImpl<_$_Tokenize>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TokenizeToJson(
      this,
    );
  }
}

abstract class _Tokenize extends Tokenize {
  const factory _Tokenize(
      {@JsonKey(name: "AssetName")
          required final String assetName,
      @JsonKey(name: "AssetTicker")
          required final String assetTicker,
      @JsonKey(name: "KeyRevealed")
          final bool keyRevealed,
      @JsonKey(name: "KeyRevealedRequestHash")
          final String? keyRevealedRequestHash,
      @JsonKey(name: "ImageBase")
          final String? imageBase}) = _$_Tokenize;
  const _Tokenize._() : super._();

  factory _Tokenize.fromJson(Map<String, dynamic> json) = _$_Tokenize.fromJson;

  @override
  @JsonKey(name: "AssetName")
  String get assetName;
  @override
  @JsonKey(name: "AssetTicker")
  String get assetTicker;
  @override
  @JsonKey(name: "KeyRevealed")
  bool get keyRevealed;
  @override
  @JsonKey(name: "KeyRevealedRequestHash")
  String? get keyRevealedRequestHash;
  @override
  @JsonKey(name: "ImageBase")
  String? get imageBase;
  @override
  @JsonKey(ignore: true)
  _$$_TokenizeCopyWith<_$_Tokenize> get copyWith =>
      throw _privateConstructorUsedError;
}
