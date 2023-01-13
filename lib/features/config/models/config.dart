import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:rbx_wallet/core/app_constants.dart';
import 'package:rbx_wallet/features/config/constants.dart';
import 'package:collection/collection.dart';

part 'config.freezed.dart';
part 'config.g.dart';

stringToInt(String val) => int.parse(val);
stringToBool(String val) => val.toLowerCase() == "true";
stringToList(String val) => val.split(",");

@freezed
class Config with _$Config {
  const Config._();

  factory Config({
    @JsonKey(name: "Port", fromJson: stringToInt)
    @Default(3338)
        int port,
    @JsonKey(name: "APIPort", fromJson: stringToInt)
    @Default(API_PORT_DEFAULT)
        int apiPort,
    @JsonKey(name: "WalletUnlockTime", fromJson: stringToInt)
    @Default(WALLET_UNLOCK_TIME_DEFAULT)
        int walletUnlockTime,
    @JsonKey(name: "PasswordClearTime", fromJson: stringToInt)
    @Default(PASSWORD_CLEAR_TIME_DEFAULT)
        int passwordClearTime,
    @JsonKey(
      name: "APICallURL",
    )
    @Default(API_CALL_URL_DEFAULT)
        String? apiCallUrl,
    @JsonKey(
      name: "MotherAddress",
    )
    @Default(MOTHER_ADDRESS_DEFAULT)
        String? motherAddress,
    @JsonKey(
      name: "MotherPassword",
    )
    @Default(MOTHER_PASSWORD_DEFAULT)
        String? motherPassword,
    @JsonKey(name: "TestNet", fromJson: stringToBool)
    @Default(false)
        bool testnet,
    @JsonKey(name: "NFTTimeout", fromJson: stringToInt)
    @Default(NFT_TIMEOUT_DEFAULT)
        int nftTimeout,
    @JsonKey(name: "AutoDownloadNFTAsset", fromJson: stringToBool)
    @Default(AUTO_DOWNLOAD_NFT_ASSET_DEFAULT)
        bool autoDownloadNftAsset,
    @JsonKey(name: "IgnoreIncomingNFTs", fromJson: stringToBool)
    @Default(IGNORE_INCOMING_NFTS_DEFAULT)
        bool ignoreIncomingNfts,
    @JsonKey(name: "RejectAssetExtensionTypes", fromJson: stringToList)
    @Default(DEFAULT_REJECTED_EXTENIONS)
        List<String> rejectAssetExtensionTypes,
    @JsonKey(name: "AllowedExtensionsTypes", fromJson: stringToList)
    @Default(ALLOWED_EXTENSION_TYPES_DEFAULT)
        List<String>? allowedAssetExtensionTypes,
  }) = _Config;

  factory Config.fromJson(Map<String, dynamic> json) => _$ConfigFromJson(json);

  String get nonDefaultRejectExtensionTypes {
    List nonDefaults = rejectAssetExtensionTypes.where((e) => !DEFAULT_REJECTED_EXTENIONS.contains(e)).toList();
    return nonDefaults.join(',');
  }

  String get nonBannedExtensionTypes {
    var nonBanned = [];
    if (allowedAssetExtensionTypes != null) {
      nonBanned = allowedAssetExtensionTypes!.where((e) => !MALWARE_FILE_EXTENSIONS.contains(e)).toList();
    }
    return nonBanned.join(',');
  }

  bool get isApiPortDefault {
    return apiPort == API_PORT_DEFAULT || apiPort == -1;
  }

  bool get isApiCallUrlDefault {
    return apiCallUrl == API_CALL_URL_DEFAULT || apiCallUrl == '';
  }

  bool get isMotherAddressDefault {
    return motherAddress == MOTHER_ADDRESS_DEFAULT || motherAddress == '';
  }

  bool get isMotherPasswordDefault {
    return motherPassword == MOTHER_PASSWORD_DEFAULT || motherPassword == '';
  }

  bool get isWalletUnlockTimeDefault {
    return walletUnlockTime == WALLET_UNLOCK_TIME_DEFAULT || walletUnlockTime == -1;
  }

  bool get isNftTimeoutDefault {
    return nftTimeout == NFT_TIMEOUT_DEFAULT || nftTimeout == -1;
  }

  bool get isPasswordClearTimeDefault {
    return passwordClearTime == PASSWORD_CLEAR_TIME_DEFAULT || passwordClearTime == -1;
  }

  bool get isAutoDownloadingNftAssetDefault {
    return autoDownloadNftAsset == AUTO_DOWNLOAD_NFT_ASSET_DEFAULT;
  }

  bool get isIgnoreIncomingNftsDefault {
    return ignoreIncomingNfts == IGNORE_INCOMING_NFTS_DEFAULT;
  }

  bool get isRejectAssetExtensionTypesDefault {
    return ListEquality().equals(rejectAssetExtensionTypes, DEFAULT_REJECTED_EXTENIONS) || nonDefaultRejectExtensionTypes.isEmpty;
  }

  bool get isAllowedExtensionTypesDefault {
    if (allowedAssetExtensionTypes == null) return true;
    return allowedAssetExtensionTypes == ALLOWED_EXTENSION_TYPES_DEFAULT || nonBannedExtensionTypes.isEmpty;
  }
}
