// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

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
  @JsonKey(name: "MotherAddress")
  String? get motherAddress => throw _privateConstructorUsedError;
  @JsonKey(name: "MotherPassword")
  String? get motherPassword => throw _privateConstructorUsedError;
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
      _$ConfigCopyWithImpl<$Res, Config>;
  @useResult
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
      @JsonKey(name: "MotherAddress")
          String? motherAddress,
      @JsonKey(name: "MotherPassword")
          String? motherPassword,
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
class _$ConfigCopyWithImpl<$Res, $Val extends Config>
    implements $ConfigCopyWith<$Res> {
  _$ConfigCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? port = null,
    Object? apiPort = null,
    Object? walletUnlockTime = null,
    Object? passwordClearTime = null,
    Object? apiCallUrl = freezed,
    Object? motherAddress = freezed,
    Object? motherPassword = freezed,
    Object? testnet = null,
    Object? nftTimeout = null,
    Object? autoDownloadNftAsset = null,
    Object? ignoreIncomingNfts = null,
    Object? rejectAssetExtensionTypes = null,
    Object? allowedAssetExtensionTypes = freezed,
  }) {
    return _then(_value.copyWith(
      port: null == port
          ? _value.port
          : port // ignore: cast_nullable_to_non_nullable
              as int,
      apiPort: null == apiPort
          ? _value.apiPort
          : apiPort // ignore: cast_nullable_to_non_nullable
              as int,
      walletUnlockTime: null == walletUnlockTime
          ? _value.walletUnlockTime
          : walletUnlockTime // ignore: cast_nullable_to_non_nullable
              as int,
      passwordClearTime: null == passwordClearTime
          ? _value.passwordClearTime
          : passwordClearTime // ignore: cast_nullable_to_non_nullable
              as int,
      apiCallUrl: freezed == apiCallUrl
          ? _value.apiCallUrl
          : apiCallUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      motherAddress: freezed == motherAddress
          ? _value.motherAddress
          : motherAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      motherPassword: freezed == motherPassword
          ? _value.motherPassword
          : motherPassword // ignore: cast_nullable_to_non_nullable
              as String?,
      testnet: null == testnet
          ? _value.testnet
          : testnet // ignore: cast_nullable_to_non_nullable
              as bool,
      nftTimeout: null == nftTimeout
          ? _value.nftTimeout
          : nftTimeout // ignore: cast_nullable_to_non_nullable
              as int,
      autoDownloadNftAsset: null == autoDownloadNftAsset
          ? _value.autoDownloadNftAsset
          : autoDownloadNftAsset // ignore: cast_nullable_to_non_nullable
              as bool,
      ignoreIncomingNfts: null == ignoreIncomingNfts
          ? _value.ignoreIncomingNfts
          : ignoreIncomingNfts // ignore: cast_nullable_to_non_nullable
              as bool,
      rejectAssetExtensionTypes: null == rejectAssetExtensionTypes
          ? _value.rejectAssetExtensionTypes
          : rejectAssetExtensionTypes // ignore: cast_nullable_to_non_nullable
              as List<String>,
      allowedAssetExtensionTypes: freezed == allowedAssetExtensionTypes
          ? _value.allowedAssetExtensionTypes
          : allowedAssetExtensionTypes // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ConfigCopyWith<$Res> implements $ConfigCopyWith<$Res> {
  factory _$$_ConfigCopyWith(_$_Config value, $Res Function(_$_Config) then) =
      __$$_ConfigCopyWithImpl<$Res>;
  @override
  @useResult
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
      @JsonKey(name: "MotherAddress")
          String? motherAddress,
      @JsonKey(name: "MotherPassword")
          String? motherPassword,
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
class __$$_ConfigCopyWithImpl<$Res>
    extends _$ConfigCopyWithImpl<$Res, _$_Config>
    implements _$$_ConfigCopyWith<$Res> {
  __$$_ConfigCopyWithImpl(_$_Config _value, $Res Function(_$_Config) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? port = null,
    Object? apiPort = null,
    Object? walletUnlockTime = null,
    Object? passwordClearTime = null,
    Object? apiCallUrl = freezed,
    Object? motherAddress = freezed,
    Object? motherPassword = freezed,
    Object? testnet = null,
    Object? nftTimeout = null,
    Object? autoDownloadNftAsset = null,
    Object? ignoreIncomingNfts = null,
    Object? rejectAssetExtensionTypes = null,
    Object? allowedAssetExtensionTypes = freezed,
  }) {
    return _then(_$_Config(
      port: null == port
          ? _value.port
          : port // ignore: cast_nullable_to_non_nullable
              as int,
      apiPort: null == apiPort
          ? _value.apiPort
          : apiPort // ignore: cast_nullable_to_non_nullable
              as int,
      walletUnlockTime: null == walletUnlockTime
          ? _value.walletUnlockTime
          : walletUnlockTime // ignore: cast_nullable_to_non_nullable
              as int,
      passwordClearTime: null == passwordClearTime
          ? _value.passwordClearTime
          : passwordClearTime // ignore: cast_nullable_to_non_nullable
              as int,
      apiCallUrl: freezed == apiCallUrl
          ? _value.apiCallUrl
          : apiCallUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      motherAddress: freezed == motherAddress
          ? _value.motherAddress
          : motherAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      motherPassword: freezed == motherPassword
          ? _value.motherPassword
          : motherPassword // ignore: cast_nullable_to_non_nullable
              as String?,
      testnet: null == testnet
          ? _value.testnet
          : testnet // ignore: cast_nullable_to_non_nullable
              as bool,
      nftTimeout: null == nftTimeout
          ? _value.nftTimeout
          : nftTimeout // ignore: cast_nullable_to_non_nullable
              as int,
      autoDownloadNftAsset: null == autoDownloadNftAsset
          ? _value.autoDownloadNftAsset
          : autoDownloadNftAsset // ignore: cast_nullable_to_non_nullable
              as bool,
      ignoreIncomingNfts: null == ignoreIncomingNfts
          ? _value.ignoreIncomingNfts
          : ignoreIncomingNfts // ignore: cast_nullable_to_non_nullable
              as bool,
      rejectAssetExtensionTypes: null == rejectAssetExtensionTypes
          ? _value._rejectAssetExtensionTypes
          : rejectAssetExtensionTypes // ignore: cast_nullable_to_non_nullable
              as List<String>,
      allowedAssetExtensionTypes: freezed == allowedAssetExtensionTypes
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
      @JsonKey(name: "MotherAddress")
          this.motherAddress = MOTHER_ADDRESS_DEFAULT,
      @JsonKey(name: "MotherPassword")
          this.motherPassword = MOTHER_PASSWORD_DEFAULT,
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
  @JsonKey(name: "MotherAddress")
  final String? motherAddress;
  @override
  @JsonKey(name: "MotherPassword")
  final String? motherPassword;
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
    if (_rejectAssetExtensionTypes is EqualUnmodifiableListView)
      return _rejectAssetExtensionTypes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_rejectAssetExtensionTypes);
  }

  final List<String>? _allowedAssetExtensionTypes;
  @override
  @JsonKey(name: "AllowedExtensionsTypes", fromJson: stringToList)
  List<String>? get allowedAssetExtensionTypes {
    final value = _allowedAssetExtensionTypes;
    if (value == null) return null;
    if (_allowedAssetExtensionTypes is EqualUnmodifiableListView)
      return _allowedAssetExtensionTypes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Config(port: $port, apiPort: $apiPort, walletUnlockTime: $walletUnlockTime, passwordClearTime: $passwordClearTime, apiCallUrl: $apiCallUrl, motherAddress: $motherAddress, motherPassword: $motherPassword, testnet: $testnet, nftTimeout: $nftTimeout, autoDownloadNftAsset: $autoDownloadNftAsset, ignoreIncomingNfts: $ignoreIncomingNfts, rejectAssetExtensionTypes: $rejectAssetExtensionTypes, allowedAssetExtensionTypes: $allowedAssetExtensionTypes)';
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
      ..add(DiagnosticsProperty('motherAddress', motherAddress))
      ..add(DiagnosticsProperty('motherPassword', motherPassword))
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
            (identical(other.port, port) || other.port == port) &&
            (identical(other.apiPort, apiPort) || other.apiPort == apiPort) &&
            (identical(other.walletUnlockTime, walletUnlockTime) ||
                other.walletUnlockTime == walletUnlockTime) &&
            (identical(other.passwordClearTime, passwordClearTime) ||
                other.passwordClearTime == passwordClearTime) &&
            (identical(other.apiCallUrl, apiCallUrl) ||
                other.apiCallUrl == apiCallUrl) &&
            (identical(other.motherAddress, motherAddress) ||
                other.motherAddress == motherAddress) &&
            (identical(other.motherPassword, motherPassword) ||
                other.motherPassword == motherPassword) &&
            (identical(other.testnet, testnet) || other.testnet == testnet) &&
            (identical(other.nftTimeout, nftTimeout) ||
                other.nftTimeout == nftTimeout) &&
            (identical(other.autoDownloadNftAsset, autoDownloadNftAsset) ||
                other.autoDownloadNftAsset == autoDownloadNftAsset) &&
            (identical(other.ignoreIncomingNfts, ignoreIncomingNfts) ||
                other.ignoreIncomingNfts == ignoreIncomingNfts) &&
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
      port,
      apiPort,
      walletUnlockTime,
      passwordClearTime,
      apiCallUrl,
      motherAddress,
      motherPassword,
      testnet,
      nftTimeout,
      autoDownloadNftAsset,
      ignoreIncomingNfts,
      const DeepCollectionEquality().hash(_rejectAssetExtensionTypes),
      const DeepCollectionEquality().hash(_allowedAssetExtensionTypes));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ConfigCopyWith<_$_Config> get copyWith =>
      __$$_ConfigCopyWithImpl<_$_Config>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ConfigToJson(
      this,
    );
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
      @JsonKey(name: "MotherAddress")
          final String? motherAddress,
      @JsonKey(name: "MotherPassword")
          final String? motherPassword,
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
  int get port;
  @override
  @JsonKey(name: "APIPort", fromJson: stringToInt)
  int get apiPort;
  @override
  @JsonKey(name: "WalletUnlockTime", fromJson: stringToInt)
  int get walletUnlockTime;
  @override
  @JsonKey(name: "PasswordClearTime", fromJson: stringToInt)
  int get passwordClearTime;
  @override
  @JsonKey(name: "APICallURL")
  String? get apiCallUrl;
  @override
  @JsonKey(name: "MotherAddress")
  String? get motherAddress;
  @override
  @JsonKey(name: "MotherPassword")
  String? get motherPassword;
  @override
  @JsonKey(name: "TestNet", fromJson: stringToBool)
  bool get testnet;
  @override
  @JsonKey(name: "NFTTimeout", fromJson: stringToInt)
  int get nftTimeout;
  @override
  @JsonKey(name: "AutoDownloadNFTAsset", fromJson: stringToBool)
  bool get autoDownloadNftAsset;
  @override
  @JsonKey(name: "IgnoreIncomingNFTs", fromJson: stringToBool)
  bool get ignoreIncomingNfts;
  @override
  @JsonKey(name: "RejectAssetExtensionTypes", fromJson: stringToList)
  List<String> get rejectAssetExtensionTypes;
  @override
  @JsonKey(name: "AllowedExtensionsTypes", fromJson: stringToList)
  List<String>? get allowedAssetExtensionTypes;
  @override
  @JsonKey(ignore: true)
  _$$_ConfigCopyWith<_$_Config> get copyWith =>
      throw _privateConstructorUsedError;
}
