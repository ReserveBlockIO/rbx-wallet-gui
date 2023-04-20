// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'web_nft.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

WebNft _$WebNftFromJson(Map<String, dynamic> json) {
  return _WebNft.fromJson(json);
}

/// @nodoc
mixin _$WebNft {
  String get identifier => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  @JsonKey(name: "owner_address")
  String get ownerAddress => throw _privateConstructorUsedError;
  @JsonKey(name: "minter_name")
  String get minterName => throw _privateConstructorUsedError;
  @JsonKey(name: "primary_asset_name")
  String get primaryAssetName => throw _privateConstructorUsedError;
  @JsonKey(name: "primary_asset_size")
  int get primaryAssetSize => throw _privateConstructorUsedError;
  @JsonKey(name: "primary_asset_remote_key")
  String? get primaryAssetRemoteKey =>
      throw _privateConstructorUsedError; // @JsonKey(name: "additional_assets_remote_keys") List<String>? additionalAssetsRemoteKeys,
  @JsonKey(name: "smart_contract_data")
  String get smartContractDataString => throw _privateConstructorUsedError;
  @JsonKey(name: "minted_at")
  DateTime get mintedAt => throw _privateConstructorUsedError;
  @JsonKey(name: "assets_available")
  bool get assetsAvailable => throw _privateConstructorUsedError;
  @JsonKey(name: "data")
  String? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WebNftCopyWith<WebNft> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WebNftCopyWith<$Res> {
  factory $WebNftCopyWith(WebNft value, $Res Function(WebNft) then) =
      _$WebNftCopyWithImpl<$Res, WebNft>;
  @useResult
  $Res call(
      {String identifier,
      String name,
      String description,
      @JsonKey(name: "owner_address") String ownerAddress,
      @JsonKey(name: "minter_name") String minterName,
      @JsonKey(name: "primary_asset_name") String primaryAssetName,
      @JsonKey(name: "primary_asset_size") int primaryAssetSize,
      @JsonKey(name: "primary_asset_remote_key") String? primaryAssetRemoteKey,
      @JsonKey(name: "smart_contract_data") String smartContractDataString,
      @JsonKey(name: "minted_at") DateTime mintedAt,
      @JsonKey(name: "assets_available") bool assetsAvailable,
      @JsonKey(name: "data") String? data});
}

/// @nodoc
class _$WebNftCopyWithImpl<$Res, $Val extends WebNft>
    implements $WebNftCopyWith<$Res> {
  _$WebNftCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? identifier = null,
    Object? name = null,
    Object? description = null,
    Object? ownerAddress = null,
    Object? minterName = null,
    Object? primaryAssetName = null,
    Object? primaryAssetSize = null,
    Object? primaryAssetRemoteKey = freezed,
    Object? smartContractDataString = null,
    Object? mintedAt = null,
    Object? assetsAvailable = null,
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      identifier: null == identifier
          ? _value.identifier
          : identifier // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      ownerAddress: null == ownerAddress
          ? _value.ownerAddress
          : ownerAddress // ignore: cast_nullable_to_non_nullable
              as String,
      minterName: null == minterName
          ? _value.minterName
          : minterName // ignore: cast_nullable_to_non_nullable
              as String,
      primaryAssetName: null == primaryAssetName
          ? _value.primaryAssetName
          : primaryAssetName // ignore: cast_nullable_to_non_nullable
              as String,
      primaryAssetSize: null == primaryAssetSize
          ? _value.primaryAssetSize
          : primaryAssetSize // ignore: cast_nullable_to_non_nullable
              as int,
      primaryAssetRemoteKey: freezed == primaryAssetRemoteKey
          ? _value.primaryAssetRemoteKey
          : primaryAssetRemoteKey // ignore: cast_nullable_to_non_nullable
              as String?,
      smartContractDataString: null == smartContractDataString
          ? _value.smartContractDataString
          : smartContractDataString // ignore: cast_nullable_to_non_nullable
              as String,
      mintedAt: null == mintedAt
          ? _value.mintedAt
          : mintedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      assetsAvailable: null == assetsAvailable
          ? _value.assetsAvailable
          : assetsAvailable // ignore: cast_nullable_to_non_nullable
              as bool,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_WebNftCopyWith<$Res> implements $WebNftCopyWith<$Res> {
  factory _$$_WebNftCopyWith(_$_WebNft value, $Res Function(_$_WebNft) then) =
      __$$_WebNftCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String identifier,
      String name,
      String description,
      @JsonKey(name: "owner_address") String ownerAddress,
      @JsonKey(name: "minter_name") String minterName,
      @JsonKey(name: "primary_asset_name") String primaryAssetName,
      @JsonKey(name: "primary_asset_size") int primaryAssetSize,
      @JsonKey(name: "primary_asset_remote_key") String? primaryAssetRemoteKey,
      @JsonKey(name: "smart_contract_data") String smartContractDataString,
      @JsonKey(name: "minted_at") DateTime mintedAt,
      @JsonKey(name: "assets_available") bool assetsAvailable,
      @JsonKey(name: "data") String? data});
}

/// @nodoc
class __$$_WebNftCopyWithImpl<$Res>
    extends _$WebNftCopyWithImpl<$Res, _$_WebNft>
    implements _$$_WebNftCopyWith<$Res> {
  __$$_WebNftCopyWithImpl(_$_WebNft _value, $Res Function(_$_WebNft) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? identifier = null,
    Object? name = null,
    Object? description = null,
    Object? ownerAddress = null,
    Object? minterName = null,
    Object? primaryAssetName = null,
    Object? primaryAssetSize = null,
    Object? primaryAssetRemoteKey = freezed,
    Object? smartContractDataString = null,
    Object? mintedAt = null,
    Object? assetsAvailable = null,
    Object? data = freezed,
  }) {
    return _then(_$_WebNft(
      identifier: null == identifier
          ? _value.identifier
          : identifier // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      ownerAddress: null == ownerAddress
          ? _value.ownerAddress
          : ownerAddress // ignore: cast_nullable_to_non_nullable
              as String,
      minterName: null == minterName
          ? _value.minterName
          : minterName // ignore: cast_nullable_to_non_nullable
              as String,
      primaryAssetName: null == primaryAssetName
          ? _value.primaryAssetName
          : primaryAssetName // ignore: cast_nullable_to_non_nullable
              as String,
      primaryAssetSize: null == primaryAssetSize
          ? _value.primaryAssetSize
          : primaryAssetSize // ignore: cast_nullable_to_non_nullable
              as int,
      primaryAssetRemoteKey: freezed == primaryAssetRemoteKey
          ? _value.primaryAssetRemoteKey
          : primaryAssetRemoteKey // ignore: cast_nullable_to_non_nullable
              as String?,
      smartContractDataString: null == smartContractDataString
          ? _value.smartContractDataString
          : smartContractDataString // ignore: cast_nullable_to_non_nullable
              as String,
      mintedAt: null == mintedAt
          ? _value.mintedAt
          : mintedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      assetsAvailable: null == assetsAvailable
          ? _value.assetsAvailable
          : assetsAvailable // ignore: cast_nullable_to_non_nullable
              as bool,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_WebNft extends _WebNft {
  _$_WebNft(
      {required this.identifier,
      required this.name,
      required this.description,
      @JsonKey(name: "owner_address")
          required this.ownerAddress,
      @JsonKey(name: "minter_name")
          required this.minterName,
      @JsonKey(name: "primary_asset_name")
          required this.primaryAssetName,
      @JsonKey(name: "primary_asset_size")
          required this.primaryAssetSize,
      @JsonKey(name: "primary_asset_remote_key")
          this.primaryAssetRemoteKey,
      @JsonKey(name: "smart_contract_data")
          required this.smartContractDataString,
      @JsonKey(name: "minted_at")
          required this.mintedAt,
      @JsonKey(name: "assets_available")
          required this.assetsAvailable,
      @JsonKey(name: "data")
          this.data})
      : super._();

  factory _$_WebNft.fromJson(Map<String, dynamic> json) =>
      _$$_WebNftFromJson(json);

  @override
  final String identifier;
  @override
  final String name;
  @override
  final String description;
  @override
  @JsonKey(name: "owner_address")
  final String ownerAddress;
  @override
  @JsonKey(name: "minter_name")
  final String minterName;
  @override
  @JsonKey(name: "primary_asset_name")
  final String primaryAssetName;
  @override
  @JsonKey(name: "primary_asset_size")
  final int primaryAssetSize;
  @override
  @JsonKey(name: "primary_asset_remote_key")
  final String? primaryAssetRemoteKey;
// @JsonKey(name: "additional_assets_remote_keys") List<String>? additionalAssetsRemoteKeys,
  @override
  @JsonKey(name: "smart_contract_data")
  final String smartContractDataString;
  @override
  @JsonKey(name: "minted_at")
  final DateTime mintedAt;
  @override
  @JsonKey(name: "assets_available")
  final bool assetsAvailable;
  @override
  @JsonKey(name: "data")
  final String? data;

  @override
  String toString() {
    return 'WebNft(identifier: $identifier, name: $name, description: $description, ownerAddress: $ownerAddress, minterName: $minterName, primaryAssetName: $primaryAssetName, primaryAssetSize: $primaryAssetSize, primaryAssetRemoteKey: $primaryAssetRemoteKey, smartContractDataString: $smartContractDataString, mintedAt: $mintedAt, assetsAvailable: $assetsAvailable, data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_WebNft &&
            (identical(other.identifier, identifier) ||
                other.identifier == identifier) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.ownerAddress, ownerAddress) ||
                other.ownerAddress == ownerAddress) &&
            (identical(other.minterName, minterName) ||
                other.minterName == minterName) &&
            (identical(other.primaryAssetName, primaryAssetName) ||
                other.primaryAssetName == primaryAssetName) &&
            (identical(other.primaryAssetSize, primaryAssetSize) ||
                other.primaryAssetSize == primaryAssetSize) &&
            (identical(other.primaryAssetRemoteKey, primaryAssetRemoteKey) ||
                other.primaryAssetRemoteKey == primaryAssetRemoteKey) &&
            (identical(
                    other.smartContractDataString, smartContractDataString) ||
                other.smartContractDataString == smartContractDataString) &&
            (identical(other.mintedAt, mintedAt) ||
                other.mintedAt == mintedAt) &&
            (identical(other.assetsAvailable, assetsAvailable) ||
                other.assetsAvailable == assetsAvailable) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      identifier,
      name,
      description,
      ownerAddress,
      minterName,
      primaryAssetName,
      primaryAssetSize,
      primaryAssetRemoteKey,
      smartContractDataString,
      mintedAt,
      assetsAvailable,
      data);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_WebNftCopyWith<_$_WebNft> get copyWith =>
      __$$_WebNftCopyWithImpl<_$_WebNft>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_WebNftToJson(
      this,
    );
  }
}

abstract class _WebNft extends WebNft {
  factory _WebNft(
      {required final String identifier,
      required final String name,
      required final String description,
      @JsonKey(name: "owner_address")
          required final String ownerAddress,
      @JsonKey(name: "minter_name")
          required final String minterName,
      @JsonKey(name: "primary_asset_name")
          required final String primaryAssetName,
      @JsonKey(name: "primary_asset_size")
          required final int primaryAssetSize,
      @JsonKey(name: "primary_asset_remote_key")
          final String? primaryAssetRemoteKey,
      @JsonKey(name: "smart_contract_data")
          required final String smartContractDataString,
      @JsonKey(name: "minted_at")
          required final DateTime mintedAt,
      @JsonKey(name: "assets_available")
          required final bool assetsAvailable,
      @JsonKey(name: "data")
          final String? data}) = _$_WebNft;
  _WebNft._() : super._();

  factory _WebNft.fromJson(Map<String, dynamic> json) = _$_WebNft.fromJson;

  @override
  String get identifier;
  @override
  String get name;
  @override
  String get description;
  @override
  @JsonKey(name: "owner_address")
  String get ownerAddress;
  @override
  @JsonKey(name: "minter_name")
  String get minterName;
  @override
  @JsonKey(name: "primary_asset_name")
  String get primaryAssetName;
  @override
  @JsonKey(name: "primary_asset_size")
  int get primaryAssetSize;
  @override
  @JsonKey(name: "primary_asset_remote_key")
  String? get primaryAssetRemoteKey;
  @override // @JsonKey(name: "additional_assets_remote_keys") List<String>? additionalAssetsRemoteKeys,
  @JsonKey(name: "smart_contract_data")
  String get smartContractDataString;
  @override
  @JsonKey(name: "minted_at")
  DateTime get mintedAt;
  @override
  @JsonKey(name: "assets_available")
  bool get assetsAvailable;
  @override
  @JsonKey(name: "data")
  String? get data;
  @override
  @JsonKey(ignore: true)
  _$$_WebNftCopyWith<_$_WebNft> get copyWith =>
      throw _privateConstructorUsedError;
}
