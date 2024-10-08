// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tokenize_btc_form_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TokenizeBtcFormState {
  bool get isProcessing => throw _privateConstructorUsedError;
  Asset? get asset => throw _privateConstructorUsedError;
  String? get vfxAddress => throw _privateConstructorUsedError;
  List<Asset> get additionalAssets => throw _privateConstructorUsedError;
  String? get imageBase64 => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TokenizeBtcFormStateCopyWith<TokenizeBtcFormState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TokenizeBtcFormStateCopyWith<$Res> {
  factory $TokenizeBtcFormStateCopyWith(TokenizeBtcFormState value,
          $Res Function(TokenizeBtcFormState) then) =
      _$TokenizeBtcFormStateCopyWithImpl<$Res, TokenizeBtcFormState>;
  @useResult
  $Res call(
      {bool isProcessing,
      Asset? asset,
      String? vfxAddress,
      List<Asset> additionalAssets,
      String? imageBase64});

  $AssetCopyWith<$Res>? get asset;
}

/// @nodoc
class _$TokenizeBtcFormStateCopyWithImpl<$Res,
        $Val extends TokenizeBtcFormState>
    implements $TokenizeBtcFormStateCopyWith<$Res> {
  _$TokenizeBtcFormStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isProcessing = null,
    Object? asset = freezed,
    Object? vfxAddress = freezed,
    Object? additionalAssets = null,
    Object? imageBase64 = freezed,
  }) {
    return _then(_value.copyWith(
      isProcessing: null == isProcessing
          ? _value.isProcessing
          : isProcessing // ignore: cast_nullable_to_non_nullable
              as bool,
      asset: freezed == asset
          ? _value.asset
          : asset // ignore: cast_nullable_to_non_nullable
              as Asset?,
      vfxAddress: freezed == vfxAddress
          ? _value.vfxAddress
          : vfxAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      additionalAssets: null == additionalAssets
          ? _value.additionalAssets
          : additionalAssets // ignore: cast_nullable_to_non_nullable
              as List<Asset>,
      imageBase64: freezed == imageBase64
          ? _value.imageBase64
          : imageBase64 // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AssetCopyWith<$Res>? get asset {
    if (_value.asset == null) {
      return null;
    }

    return $AssetCopyWith<$Res>(_value.asset!, (value) {
      return _then(_value.copyWith(asset: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_TokenizeBtcFormStateCopyWith<$Res>
    implements $TokenizeBtcFormStateCopyWith<$Res> {
  factory _$$_TokenizeBtcFormStateCopyWith(_$_TokenizeBtcFormState value,
          $Res Function(_$_TokenizeBtcFormState) then) =
      __$$_TokenizeBtcFormStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isProcessing,
      Asset? asset,
      String? vfxAddress,
      List<Asset> additionalAssets,
      String? imageBase64});

  @override
  $AssetCopyWith<$Res>? get asset;
}

/// @nodoc
class __$$_TokenizeBtcFormStateCopyWithImpl<$Res>
    extends _$TokenizeBtcFormStateCopyWithImpl<$Res, _$_TokenizeBtcFormState>
    implements _$$_TokenizeBtcFormStateCopyWith<$Res> {
  __$$_TokenizeBtcFormStateCopyWithImpl(_$_TokenizeBtcFormState _value,
      $Res Function(_$_TokenizeBtcFormState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isProcessing = null,
    Object? asset = freezed,
    Object? vfxAddress = freezed,
    Object? additionalAssets = null,
    Object? imageBase64 = freezed,
  }) {
    return _then(_$_TokenizeBtcFormState(
      isProcessing: null == isProcessing
          ? _value.isProcessing
          : isProcessing // ignore: cast_nullable_to_non_nullable
              as bool,
      asset: freezed == asset
          ? _value.asset
          : asset // ignore: cast_nullable_to_non_nullable
              as Asset?,
      vfxAddress: freezed == vfxAddress
          ? _value.vfxAddress
          : vfxAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      additionalAssets: null == additionalAssets
          ? _value._additionalAssets
          : additionalAssets // ignore: cast_nullable_to_non_nullable
              as List<Asset>,
      imageBase64: freezed == imageBase64
          ? _value.imageBase64
          : imageBase64 // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_TokenizeBtcFormState extends _TokenizeBtcFormState {
  _$_TokenizeBtcFormState(
      {this.isProcessing = false,
      this.asset,
      this.vfxAddress,
      final List<Asset> additionalAssets = const [],
      this.imageBase64})
      : _additionalAssets = additionalAssets,
        super._();

  @override
  @JsonKey()
  final bool isProcessing;
  @override
  final Asset? asset;
  @override
  final String? vfxAddress;
  final List<Asset> _additionalAssets;
  @override
  @JsonKey()
  List<Asset> get additionalAssets {
    if (_additionalAssets is EqualUnmodifiableListView)
      return _additionalAssets;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_additionalAssets);
  }

  @override
  final String? imageBase64;

  @override
  String toString() {
    return 'TokenizeBtcFormState(isProcessing: $isProcessing, asset: $asset, vfxAddress: $vfxAddress, additionalAssets: $additionalAssets, imageBase64: $imageBase64)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TokenizeBtcFormState &&
            (identical(other.isProcessing, isProcessing) ||
                other.isProcessing == isProcessing) &&
            (identical(other.asset, asset) || other.asset == asset) &&
            (identical(other.vfxAddress, vfxAddress) ||
                other.vfxAddress == vfxAddress) &&
            const DeepCollectionEquality()
                .equals(other._additionalAssets, _additionalAssets) &&
            (identical(other.imageBase64, imageBase64) ||
                other.imageBase64 == imageBase64));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isProcessing, asset, vfxAddress,
      const DeepCollectionEquality().hash(_additionalAssets), imageBase64);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TokenizeBtcFormStateCopyWith<_$_TokenizeBtcFormState> get copyWith =>
      __$$_TokenizeBtcFormStateCopyWithImpl<_$_TokenizeBtcFormState>(
          this, _$identity);
}

abstract class _TokenizeBtcFormState extends TokenizeBtcFormState {
  factory _TokenizeBtcFormState(
      {final bool isProcessing,
      final Asset? asset,
      final String? vfxAddress,
      final List<Asset> additionalAssets,
      final String? imageBase64}) = _$_TokenizeBtcFormState;
  _TokenizeBtcFormState._() : super._();

  @override
  bool get isProcessing;
  @override
  Asset? get asset;
  @override
  String? get vfxAddress;
  @override
  List<Asset> get additionalAssets;
  @override
  String? get imageBase64;
  @override
  @JsonKey(ignore: true)
  _$$_TokenizeBtcFormStateCopyWith<_$_TokenizeBtcFormState> get copyWith =>
      throw _privateConstructorUsedError;
}
