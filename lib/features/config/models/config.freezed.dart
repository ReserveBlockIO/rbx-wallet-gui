// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Config _$ConfigFromJson(Map<String, dynamic> json) {
  return _Config.fromJson(json);
}

/// @nodoc
mixin _$Config {
  @JsonKey(name: "Port", fromJson: stringToInt)
  int get port => throw _privateConstructorUsedError;
  @JsonKey(name: "APIPort", fromJson: stringToInt)
  int get apiPort => throw _privateConstructorUsedError;
  @JsonKey(name: "WalletUnlockTime", fromJson: stringToInt)
  int get walletUnlockTime => throw _privateConstructorUsedError;
  @JsonKey(name: "PasswordClearTime", fromJson: stringToInt)
  int get passwordClearTime => throw _privateConstructorUsedError;
  @JsonKey(name: "APICallURL")
  String? get apiCallUrl => throw _privateConstructorUsedError;
  @JsonKey(name: "TestNet", fromJson: stringToBool)
  bool get testnet => throw _privateConstructorUsedError;
  @JsonKey(name: "NFTTimeout", fromJson: stringToInt)
  int get nftTimeout => throw _privateConstructorUsedError;
  @JsonKey(name: "AutoDownloadNFTAsset", fromJson: stringToBool)
  bool get autoDownloadNftAsset => throw _privateConstructorUsedError;
  @JsonKey(name: "IgnoreIncomingNFTs", fromJson: stringToBool)
  bool get ignoreIncomingNfts => throw _privateConstructorUsedError;
  @JsonKey(name: "RejectAssetExtensionTypes", fromJson: stringToList)
  List<String> get rejectAssetExtensionTypes =>
      throw _privateConstructorUsedError;
  @JsonKey(name: "AllowedExtensionsTypes", fromJson: stringToList)
  List<String>? get allowedAssetExtensionTypes =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ConfigCopyWith<Config> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConfigCopyWith<$Res> {
  factory $ConfigCopyWith(Config value, $Res Function(Config) then) =
      _$ConfigCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: "Port", fromJson: stringToInt)
          int port,
      @JsonKey(name: "APIPort", fromJson: stringToInt)
          int apiPort,
      @JsonKey(name: "WalletUnlockTime", fromJson: stringToInt)
          int walletUnlockTime,
      @JsonKey(name: "PasswordClearTime", fromJson: stringToInt)
          int passwordClearTime,
      @JsonKey(name: "APICallURL")
          String? apiCallUrl,
      @JsonKey(name: "TestNet", fromJson: stringToBool)
          bool testnet,
      @JsonKey(name: "NFTTimeout", fromJson: stringToInt)
          int nftTimeout,
      @JsonKey(name: "AutoDownloadNFTAsset", fromJson: stringToBool)
          bool autoDownloadNftAsset,
      @JsonKey(name: "IgnoreIncomingNFTs", fromJson: stringToBool)
          bool ignoreIncomingNfts,
      @JsonKey(name: "RejectAssetExtensionTypes", fromJson: stringToList)
          List<String> rejectAssetExtensionTypes,
      @JsonKey(name: "AllowedExtensionsTypes", fromJson: stringToList)
          List<String>? allowedAssetExtensionTypes});
}

/// @nodoc
class _$ConfigCopyWithImpl<$Res> implements $ConfigCopyWith<$Res> {
  _$ConfigCopyWithImpl(this._value, this._then);

  final Config _value;
  // ignore: unused_field
  final $Res Function(Config) _then;

  @override
  $Res call({
    Object? port = freezed,
    Object? apiPort = freezed,
    Object? walletUnlockTime = freezed,
    Object? passwordClearTime = freezed,
    Object? apiCallUrl = freezed,
    Object? testnet = freezed,
    Object? nftTimeout = freezed,
    Object? autoDownloadNftAsset = freezed,
    Object? ignoreIncomingNfts = freezed,
    Object? rejectAssetExtensionTypes = freezed,
    Object? allowedAssetExtensionTypes = freezed,
  }) {
    return _then(_value.copyWith(
      port: port == freezed
          ? _value.port
          : port // ignore: cast_nullable_to_non_nullable
              as int,
      apiPort: apiPort == freezed
          ? _value.apiPort
          : apiPort // ignore: cast_nullable_to_non_nullable
              as int,
      walletUnlockTime: walletUnlockTime == freezed
          ? _value.walletUnlockTime
          : walletUnlockTime // ignore: cast_nullable_to_non_nullable
              as int,
      passwordClearTime: passwordClearTime == freezed
          ? _value.passwordClearTime
          : passwordClearTime // ignore: cast_nullable_to_non_nullable
              as int,
      apiCallUrl: apiCallUrl == freezed
          ? _value.apiCallUrl
          : apiCallUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      testnet: testnet == freezed
          ? _value.testnet
          : testnet // ignore: cast_nullable_to_non_nullable
              as bool,
      nftTimeout: nftTimeout == freezed
          ? _value.nftTimeout
          : nftTimeout // ignore: cast_nullable_to_non_nullable
              as int,
      autoDownloadNftAsset: autoDownloadNftAsset == freezed
          ? _value.autoDownloadNftAsset
          : autoDownloadNftAsset // ignore: cast_nullable_to_non_nullable
              as bool,
      ignoreIncomingNfts: ignoreIncomingNfts == freezed
          ? _value.ignoreIncomingNfts
          : ignoreIncomingNfts // ignore: cast_nullable_to_non_nullable
              as bool,
      rejectAssetExtensionTypes: rejectAssetExtensionTypes == freezed
          ? _value.rejectAssetExtensionTypes
          : rejectAssetExtensionTypes // ignore: cast_nullable_to_non_nullable
              as List<String>,
      allowedAssetExtensionTypes: allowedAssetExtensionTypes == freezed
          ? _value.allowedAssetExtensionTypes
          : allowedAssetExtensionTypes // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc
abstract class _$$_ConfigCopyWith<$Res> implements $ConfigCopyWith<$Res> {
  factory _$$_ConfigCopyWith(_$_Config value, $Res Function(_$_Config) then) =
      __$$_ConfigCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: "Port", fromJson: stringToInt)
          int port,
      @JsonKey(name: "APIPort", fromJson: stringToInt)
          int apiPort,
      @JsonKey(name: "WalletUnlockTime", fromJson: stringToInt)
          int walletUnlockTime,
      @JsonKey(name: "PasswordClearTime", fromJson: stringToInt)
          int passwordClearTime,
      @JsonKey(name: "APICallURL")
          String? apiCallUrl,
      @JsonKey(name: "TestNet", fromJson: stringToBool)
          bool testnet,
      @JsonKey(name: "NFTTimeout", fromJson: stringToInt)
          int nftTimeout,
      @JsonKey(name: "AutoDownloadNFTAsset", fromJson: stringToBool)
          bool autoDownloadNftAsset,
      @JsonKey(name: "IgnoreIncomingNFTs", fromJson: stringToBool)
          bool ignoreIncomingNfts,
      @JsonKey(name: "RejectAssetExtensionTypes", fromJson: stringToList)
          List<String> rejectAssetExtensionTypes,
      @JsonKey(name: "AllowedExtensionsTypes", fromJson: stringToList)
          List<String>? allowedAssetExtensionTypes});
}

/// @nodoc
class __$$_ConfigCopyWithImpl<$Res> extends _$ConfigCopyWithImpl<$Res>
    implements _$$_ConfigCopyWith<$Res> {
  __$$_ConfigCopyWithImpl(_$_Config _value, $Res Function(_$_Config) _then)
      : super(_value, (v) => _then(v as _$_Config));

  @override
  _$_Config get _value => super._value as _$_Config;

  @override
  $Res call({
    Object? port = freezed,
    Object? apiPort = freezed,
    Object? walletUnlockTime = freezed,
    Object? passwordClearTime = freezed,
    Object? apiCallUrl = freezed,
    Object? testnet = freezed,
    Object? nftTimeout = freezed,
    Object? autoDownloadNftAsset = freezed,
    Object? ignoreIncomingNfts = freezed,
    Object? rejectAssetExtensionTypes = freezed,
    Object? allowedAssetExtensionTypes = freezed,
  }) {
    return _then(_$_Config(
      port: port == freezed
          ? _value.port
          : port // ignore: cast_nullable_to_non_nullable
              as int,
      apiPort: apiPort == freezed
          ? _value.apiPort
          : apiPort // ignore: cast_nullable_to_non_nullable
              as int,
      walletUnlockTime: walletUnlockTime == freezed
          ? _value.walletUnlockTime
          : walletUnlockTime // ignore: cast_nullable_to_non_nullable
              as int,
      passwordClearTime: passwordClearTime == freezed
          ? _value.passwordClearTime
          : passwordClearTime // ignore: cast_nullable_to_non_nullable
              as int,
      apiCallUrl: apiCallUrl == freezed
          ? _value.apiCallUrl
          : apiCallUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      testnet: testnet == freezed
          ? _value.testnet
          : testnet // ignore: cast_nullable_to_non_nullable
              as bool,
      nftTimeout: nftTimeout == freezed
          ? _value.nftTimeout
          : nftTimeout // ignore: cast_nullable_to_non_nullable
              as int,
      autoDownloadNftAsset: autoDownloadNftAsset == freezed
          ? _value.autoDownloadNftAsset
          : autoDownloadNftAsset // ignore: cast_nullable_to_non_nullable
              as bool,
      ignoreIncomingNfts: ignoreIncomingNfts == freezed
          ? _value.ignoreIncomingNfts
          : ignoreIncomingNfts // ignore: cast_nullable_to_non_nullable
              as bool,
      rejectAssetExtensionTypes: rejectAssetExtensionTypes == freezed
          ? _value._rejectAssetExtensionTypes
          : rejectAssetExtensionTypes // ignore: cast_nullable_to_non_nullable
              as List<String>,
      allowedAssetExtensionTypes: allowedAssetExtensionTypes == freezed
          ? _value._allowedAssetExtensionTypes
          : allowedAssetExtensionTypes // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Config extends _Config with DiagnosticableTreeMixin {
  _$_Config(
      {@JsonKey(name: "Port", fromJson: stringToInt)
          this.port = 3338,
      @JsonKey(name: "APIPort", fromJson: stringToInt)
          this.apiPort = API_PORT_DEFAULT,
      @JsonKey(name: "WalletUnlockTime", fromJson: stringToInt)
          this.walletUnlockTime = WALLET_UNLOCK_TIME_DEFAULT,
      @JsonKey(name: "PasswordClearTime", fromJson: stringToInt)
          this.passwordClearTime = PASSWORD_CLEAR_TIME_DEFAULT,
      @JsonKey(name: "APICallURL")
          this.apiCallUrl = API_CALL_URL_DEFAULT,
      @JsonKey(name: "TestNet", fromJson: stringToBool)
          this.testnet = false,
      @JsonKey(name: "NFTTimeout", fromJson: stringToInt)
          this.nftTimeout = NFT_TIMEOUT_DEFAULT,
      @JsonKey(name: "AutoDownloadNFTAsset", fromJson: stringToBool)
          this.autoDownloadNftAsset = AUTO_DOWNLOAD_NFT_ASSET_DEFAULT,
      @JsonKey(name: "IgnoreIncomingNFTs", fromJson: stringToBool)
          this.ignoreIncomingNfts = IGNORE_INCOMING_NFTS_DEFAULT,
      @JsonKey(name: "RejectAssetExtensionTypes", fromJson: stringToList)
          final List<String>
              rejectAssetExtensionTypes = DEFAULT_REJECTED_EXTENIONS,
      @JsonKey(name: "AllowedExtensionsTypes", fromJson: stringToList)
          final List<String>?
              allowedAssetExtensionTypes = ALLOWED_EXTENSION_TYPES_DEFAULT})
      : _rejectAssetExtensionTypes = rejectAssetExtensionTypes,
        _allowedAssetExtensionTypes = allowedAssetExtensionTypes,
        super._();

  factory _$_Config.fromJson(Map<String, dynamic> json) =>
      _$$_ConfigFromJson(json);

  @override
  @JsonKey(name: "Port", fromJson: stringToInt)
  final int port;
  @override
  @JsonKey(name: "APIPort", fromJson: stringToInt)
  final int apiPort;
  @override
  @JsonKey(name: "WalletUnlockTime", fromJson: stringToInt)
  final int walletUnlockTime;
  @override
  @JsonKey(name: "PasswordClearTime", fromJson: stringToInt)
  final int passwordClearTime;
  @override
  @JsonKey(name: "APICallURL")
  final String? apiCallUrl;
  @override
  @JsonKey(name: "TestNet", fromJson: stringToBool)
  final bool testnet;
  @override
  @JsonKey(name: "NFTTimeout", fromJson: stringToInt)
  final int nftTimeout;
  @override
  @JsonKey(name: "AutoDownloadNFTAsset", fromJson: stringToBool)
  final bool autoDownloadNftAsset;
  @override
  @JsonKey(name: "IgnoreIncomingNFTs", fromJson: stringToBool)
  final bool ignoreIncomingNfts;
  final List<String> _rejectAssetExtensionTypes;
  @override
  @JsonKey(name: "RejectAssetExtensionTypes", fromJson: stringToList)
  List<String> get rejectAssetExtensionTypes {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_rejectAssetExtensionTypes);
  }

  final List<String>? _allowedAssetExtensionTypes;
  @override
  @JsonKey(name: "AllowedExtensionsTypes", fromJson: stringToList)
  List<String>? get allowedAssetExtensionTypes {
    final value = _allowedAssetExtensionTypes;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Config(port: $port, apiPort: $apiPort, walletUnlockTime: $walletUnlockTime, passwordClearTime: $passwordClearTime, apiCallUrl: $apiCallUrl, testnet: $testnet, nftTimeout: $nftTimeout, autoDownloadNftAsset: $autoDownloadNftAsset, ignoreIncomingNfts: $ignoreIncomingNfts, rejectAssetExtensionTypes: $rejectAssetExtensionTypes, allowedAssetExtensionTypes: $allowedAssetExtensionTypes)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Config'))
      ..add(DiagnosticsProperty('port', port))
      ..add(DiagnosticsProperty('apiPort', apiPort))
      ..add(DiagnosticsProperty('walletUnlockTime', walletUnlockTime))
      ..add(DiagnosticsProperty('passwordClearTime', passwordClearTime))
      ..add(DiagnosticsProperty('apiCallUrl', apiCallUrl))
      ..add(DiagnosticsProperty('testnet', testnet))
      ..add(DiagnosticsProperty('nftTimeout', nftTimeout))
      ..add(DiagnosticsProperty('autoDownloadNftAsset', autoDownloadNftAsset))
      ..add(DiagnosticsProperty('ignoreIncomingNfts', ignoreIncomingNfts))
      ..add(DiagnosticsProperty(
          'rejectAssetExtensionTypes', rejectAssetExtensionTypes))
      ..add(DiagnosticsProperty(
          'allowedAssetExtensionTypes', allowedAssetExtensionTypes));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Config &&
            const DeepCollectionEquality().equals(other.port, port) &&
            const DeepCollectionEquality().equals(other.apiPort, apiPort) &&
            const DeepCollectionEquality()
                .equals(other.walletUnlockTime, walletUnlockTime) &&
            const DeepCollectionEquality()
                .equals(other.passwordClearTime, passwordClearTime) &&
            const DeepCollectionEquality()
                .equals(other.apiCallUrl, apiCallUrl) &&
            const DeepCollectionEquality().equals(other.testnet, testnet) &&
            const DeepCollectionEquality()
                .equals(other.nftTimeout, nftTimeout) &&
            const DeepCollectionEquality()
                .equals(other.autoDownloadNftAsset, autoDownloadNftAsset) &&
            const DeepCollectionEquality()
                .equals(other.ignoreIncomingNfts, ignoreIncomingNfts) &&
            const DeepCollectionEquality().equals(
                other._rejectAssetExtensionTypes, _rejectAssetExtensionTypes) &&
            const DeepCollectionEquality().equals(
                other._allowedAssetExtensionTypes,
                _allowedAssetExtensionTypes));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(port),
      const DeepCollectionEquality().hash(apiPort),
      const DeepCollectionEquality().hash(walletUnlockTime),
      const DeepCollectionEquality().hash(passwordClearTime),
      const DeepCollectionEquality().hash(apiCallUrl),
      const DeepCollectionEquality().hash(testnet),
      const DeepCollectionEquality().hash(nftTimeout),
      const DeepCollectionEquality().hash(autoDownloadNftAsset),
      const DeepCollectionEquality().hash(ignoreIncomingNfts),
      const DeepCollectionEquality().hash(_rejectAssetExtensionTypes),
      const DeepCollectionEquality().hash(_allowedAssetExtensionTypes));

  @JsonKey(ignore: true)
  @override
  _$$_ConfigCopyWith<_$_Config> get copyWith =>
      __$$_ConfigCopyWithImpl<_$_Config>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ConfigToJson(this);
  }
}

abstract class _Config extends Config {
  factory _Config(
      {@JsonKey(name: "Port", fromJson: stringToInt)
          final int port,
      @JsonKey(name: "APIPort", fromJson: stringToInt)
          final int apiPort,
      @JsonKey(name: "WalletUnlockTime", fromJson: stringToInt)
          final int walletUnlockTime,
      @JsonKey(name: "PasswordClearTime", fromJson: stringToInt)
          final int passwordClearTime,
      @JsonKey(name: "APICallURL")
          final String? apiCallUrl,
      @JsonKey(name: "TestNet", fromJson: stringToBool)
          final bool testnet,
      @JsonKey(name: "NFTTimeout", fromJson: stringToInt)
          final int nftTimeout,
      @JsonKey(name: "AutoDownloadNFTAsset", fromJson: stringToBool)
          final bool autoDownloadNftAsset,
      @JsonKey(name: "IgnoreIncomingNFTs", fromJson: stringToBool)
          final bool ignoreIncomingNfts,
      @JsonKey(name: "RejectAssetExtensionTypes", fromJson: stringToList)
          final List<String> rejectAssetExtensionTypes,
      @JsonKey(name: "AllowedExtensionsTypes", fromJson: stringToList)
          final List<String>? allowedAssetExtensionTypes}) = _$_Config;
  _Config._() : super._();

  factory _Config.fromJson(Map<String, dynamic> json) = _$_Config.fromJson;

  @override
  @JsonKey(name: "Port", fromJson: stringToInt)
  int get port => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "APIPort", fromJson: stringToInt)
  int get apiPort => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "WalletUnlockTime", fromJson: stringToInt)
  int get walletUnlockTime => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "PasswordClearTime", fromJson: stringToInt)
  int get passwordClearTime => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "APICallURL")
  String? get apiCallUrl => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "TestNet", fromJson: stringToBool)
  bool get testnet => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "NFTTimeout", fromJson: stringToInt)
  int get nftTimeout => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "AutoDownloadNFTAsset", fromJson: stringToBool)
  bool get autoDownloadNftAsset => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "IgnoreIncomingNFTs", fromJson: stringToBool)
  bool get ignoreIncomingNfts => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "RejectAssetExtensionTypes", fromJson: stringToList)
  List<String> get rejectAssetExtensionTypes =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "AllowedExtensionsTypes", fromJson: stringToList)
  List<String>? get allowedAssetExtensionTypes =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_ConfigCopyWith<_$_Config> get copyWith =>
      throw _privateConstructorUsedError;
}
