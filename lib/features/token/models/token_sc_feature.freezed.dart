// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'token_sc_feature.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TokenScFeature _$TokenScFeatureFromJson(Map<String, dynamic> json) {
  return _TokenScFeature.fromJson(json);
}

/// @nodoc
mixin _$TokenScFeature {
  @JsonKey(name: "TokenName")
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: "TokenTicker")
  String get ticker => throw _privateConstructorUsedError;
  @JsonKey(name: "TokenDecimalPlaces")
  int get decimalPlaces => throw _privateConstructorUsedError;
  @JsonKey(name: "TokenSupply", toJson: supplyToJson)
  double get supply => throw _privateConstructorUsedError;
  @JsonKey(name: "TokenBurnable")
  bool get burnable => throw _privateConstructorUsedError;
  @JsonKey(name: "TokenMintable")
  bool get mintable => throw _privateConstructorUsedError;
  @JsonKey(name: "TokenVoting")
  bool get voting => throw _privateConstructorUsedError;
  @JsonKey(name: "TokenImageURL")
  String? get imageUrl => throw _privateConstructorUsedError;
  @JsonKey(name: "TokenImageBase")
  String? get imageBase64 => throw _privateConstructorUsedError;
  @JsonKey(includeFromJson: false, includeToJson: false)
  Asset? get webAsset => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TokenScFeatureCopyWith<TokenScFeature> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TokenScFeatureCopyWith<$Res> {
  factory $TokenScFeatureCopyWith(
          TokenScFeature value, $Res Function(TokenScFeature) then) =
      _$TokenScFeatureCopyWithImpl<$Res, TokenScFeature>;
  @useResult
  $Res call(
      {@JsonKey(name: "TokenName") String name,
      @JsonKey(name: "TokenTicker") String ticker,
      @JsonKey(name: "TokenDecimalPlaces") int decimalPlaces,
      @JsonKey(name: "TokenSupply", toJson: supplyToJson) double supply,
      @JsonKey(name: "TokenBurnable") bool burnable,
      @JsonKey(name: "TokenMintable") bool mintable,
      @JsonKey(name: "TokenVoting") bool voting,
      @JsonKey(name: "TokenImageURL") String? imageUrl,
      @JsonKey(name: "TokenImageBase") String? imageBase64,
      @JsonKey(includeFromJson: false, includeToJson: false) Asset? webAsset});

  $AssetCopyWith<$Res>? get webAsset;
}

/// @nodoc
class _$TokenScFeatureCopyWithImpl<$Res, $Val extends TokenScFeature>
    implements $TokenScFeatureCopyWith<$Res> {
  _$TokenScFeatureCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? ticker = null,
    Object? decimalPlaces = null,
    Object? supply = null,
    Object? burnable = null,
    Object? mintable = null,
    Object? voting = null,
    Object? imageUrl = freezed,
    Object? imageBase64 = freezed,
    Object? webAsset = freezed,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      ticker: null == ticker
          ? _value.ticker
          : ticker // ignore: cast_nullable_to_non_nullable
              as String,
      decimalPlaces: null == decimalPlaces
          ? _value.decimalPlaces
          : decimalPlaces // ignore: cast_nullable_to_non_nullable
              as int,
      supply: null == supply
          ? _value.supply
          : supply // ignore: cast_nullable_to_non_nullable
              as double,
      burnable: null == burnable
          ? _value.burnable
          : burnable // ignore: cast_nullable_to_non_nullable
              as bool,
      mintable: null == mintable
          ? _value.mintable
          : mintable // ignore: cast_nullable_to_non_nullable
              as bool,
      voting: null == voting
          ? _value.voting
          : voting // ignore: cast_nullable_to_non_nullable
              as bool,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      imageBase64: freezed == imageBase64
          ? _value.imageBase64
          : imageBase64 // ignore: cast_nullable_to_non_nullable
              as String?,
      webAsset: freezed == webAsset
          ? _value.webAsset
          : webAsset // ignore: cast_nullable_to_non_nullable
              as Asset?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AssetCopyWith<$Res>? get webAsset {
    if (_value.webAsset == null) {
      return null;
    }

    return $AssetCopyWith<$Res>(_value.webAsset!, (value) {
      return _then(_value.copyWith(webAsset: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_TokenScFeatureCopyWith<$Res>
    implements $TokenScFeatureCopyWith<$Res> {
  factory _$$_TokenScFeatureCopyWith(
          _$_TokenScFeature value, $Res Function(_$_TokenScFeature) then) =
      __$$_TokenScFeatureCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "TokenName") String name,
      @JsonKey(name: "TokenTicker") String ticker,
      @JsonKey(name: "TokenDecimalPlaces") int decimalPlaces,
      @JsonKey(name: "TokenSupply", toJson: supplyToJson) double supply,
      @JsonKey(name: "TokenBurnable") bool burnable,
      @JsonKey(name: "TokenMintable") bool mintable,
      @JsonKey(name: "TokenVoting") bool voting,
      @JsonKey(name: "TokenImageURL") String? imageUrl,
      @JsonKey(name: "TokenImageBase") String? imageBase64,
      @JsonKey(includeFromJson: false, includeToJson: false) Asset? webAsset});

  @override
  $AssetCopyWith<$Res>? get webAsset;
}

/// @nodoc
class __$$_TokenScFeatureCopyWithImpl<$Res>
    extends _$TokenScFeatureCopyWithImpl<$Res, _$_TokenScFeature>
    implements _$$_TokenScFeatureCopyWith<$Res> {
  __$$_TokenScFeatureCopyWithImpl(
      _$_TokenScFeature _value, $Res Function(_$_TokenScFeature) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? ticker = null,
    Object? decimalPlaces = null,
    Object? supply = null,
    Object? burnable = null,
    Object? mintable = null,
    Object? voting = null,
    Object? imageUrl = freezed,
    Object? imageBase64 = freezed,
    Object? webAsset = freezed,
  }) {
    return _then(_$_TokenScFeature(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      ticker: null == ticker
          ? _value.ticker
          : ticker // ignore: cast_nullable_to_non_nullable
              as String,
      decimalPlaces: null == decimalPlaces
          ? _value.decimalPlaces
          : decimalPlaces // ignore: cast_nullable_to_non_nullable
              as int,
      supply: null == supply
          ? _value.supply
          : supply // ignore: cast_nullable_to_non_nullable
              as double,
      burnable: null == burnable
          ? _value.burnable
          : burnable // ignore: cast_nullable_to_non_nullable
              as bool,
      mintable: null == mintable
          ? _value.mintable
          : mintable // ignore: cast_nullable_to_non_nullable
              as bool,
      voting: null == voting
          ? _value.voting
          : voting // ignore: cast_nullable_to_non_nullable
              as bool,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      imageBase64: freezed == imageBase64
          ? _value.imageBase64
          : imageBase64 // ignore: cast_nullable_to_non_nullable
              as String?,
      webAsset: freezed == webAsset
          ? _value.webAsset
          : webAsset // ignore: cast_nullable_to_non_nullable
              as Asset?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TokenScFeature extends _TokenScFeature {
  const _$_TokenScFeature(
      {@JsonKey(name: "TokenName")
          this.name = "Unnamed",
      @JsonKey(name: "TokenTicker")
          this.ticker = "unnamed",
      @JsonKey(name: "TokenDecimalPlaces")
          this.decimalPlaces = TOKEN_DEFAULT_DECIMAL_PLACES,
      @JsonKey(name: "TokenSupply", toJson: supplyToJson)
          this.supply = 0.0,
      @JsonKey(name: "TokenBurnable")
          this.burnable = false,
      @JsonKey(name: "TokenMintable")
          this.mintable = false,
      @JsonKey(name: "TokenVoting")
          this.voting = false,
      @JsonKey(name: "TokenImageURL")
          this.imageUrl,
      @JsonKey(name: "TokenImageBase")
          this.imageBase64,
      @JsonKey(includeFromJson: false, includeToJson: false)
          this.webAsset})
      : super._();

  factory _$_TokenScFeature.fromJson(Map<String, dynamic> json) =>
      _$$_TokenScFeatureFromJson(json);

  @override
  @JsonKey(name: "TokenName")
  final String name;
  @override
  @JsonKey(name: "TokenTicker")
  final String ticker;
  @override
  @JsonKey(name: "TokenDecimalPlaces")
  final int decimalPlaces;
  @override
  @JsonKey(name: "TokenSupply", toJson: supplyToJson)
  final double supply;
  @override
  @JsonKey(name: "TokenBurnable")
  final bool burnable;
  @override
  @JsonKey(name: "TokenMintable")
  final bool mintable;
  @override
  @JsonKey(name: "TokenVoting")
  final bool voting;
  @override
  @JsonKey(name: "TokenImageURL")
  final String? imageUrl;
  @override
  @JsonKey(name: "TokenImageBase")
  final String? imageBase64;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  final Asset? webAsset;

  @override
  String toString() {
    return 'TokenScFeature(name: $name, ticker: $ticker, decimalPlaces: $decimalPlaces, supply: $supply, burnable: $burnable, mintable: $mintable, voting: $voting, imageUrl: $imageUrl, imageBase64: $imageBase64, webAsset: $webAsset)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TokenScFeature &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.ticker, ticker) || other.ticker == ticker) &&
            (identical(other.decimalPlaces, decimalPlaces) ||
                other.decimalPlaces == decimalPlaces) &&
            (identical(other.supply, supply) || other.supply == supply) &&
            (identical(other.burnable, burnable) ||
                other.burnable == burnable) &&
            (identical(other.mintable, mintable) ||
                other.mintable == mintable) &&
            (identical(other.voting, voting) || other.voting == voting) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.imageBase64, imageBase64) ||
                other.imageBase64 == imageBase64) &&
            (identical(other.webAsset, webAsset) ||
                other.webAsset == webAsset));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, ticker, decimalPlaces,
      supply, burnable, mintable, voting, imageUrl, imageBase64, webAsset);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TokenScFeatureCopyWith<_$_TokenScFeature> get copyWith =>
      __$$_TokenScFeatureCopyWithImpl<_$_TokenScFeature>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TokenScFeatureToJson(
      this,
    );
  }
}

abstract class _TokenScFeature extends TokenScFeature {
  const factory _TokenScFeature(
      {@JsonKey(name: "TokenName")
          final String name,
      @JsonKey(name: "TokenTicker")
          final String ticker,
      @JsonKey(name: "TokenDecimalPlaces")
          final int decimalPlaces,
      @JsonKey(name: "TokenSupply", toJson: supplyToJson)
          final double supply,
      @JsonKey(name: "TokenBurnable")
          final bool burnable,
      @JsonKey(name: "TokenMintable")
          final bool mintable,
      @JsonKey(name: "TokenVoting")
          final bool voting,
      @JsonKey(name: "TokenImageURL")
          final String? imageUrl,
      @JsonKey(name: "TokenImageBase")
          final String? imageBase64,
      @JsonKey(includeFromJson: false, includeToJson: false)
          final Asset? webAsset}) = _$_TokenScFeature;
  const _TokenScFeature._() : super._();

  factory _TokenScFeature.fromJson(Map<String, dynamic> json) =
      _$_TokenScFeature.fromJson;

  @override
  @JsonKey(name: "TokenName")
  String get name;
  @override
  @JsonKey(name: "TokenTicker")
  String get ticker;
  @override
  @JsonKey(name: "TokenDecimalPlaces")
  int get decimalPlaces;
  @override
  @JsonKey(name: "TokenSupply", toJson: supplyToJson)
  double get supply;
  @override
  @JsonKey(name: "TokenBurnable")
  bool get burnable;
  @override
  @JsonKey(name: "TokenMintable")
  bool get mintable;
  @override
  @JsonKey(name: "TokenVoting")
  bool get voting;
  @override
  @JsonKey(name: "TokenImageURL")
  String? get imageUrl;
  @override
  @JsonKey(name: "TokenImageBase")
  String? get imageBase64;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  Asset? get webAsset;
  @override
  @JsonKey(ignore: true)
  _$$_TokenScFeatureCopyWith<_$_TokenScFeature> get copyWith =>
      throw _privateConstructorUsedError;
}
