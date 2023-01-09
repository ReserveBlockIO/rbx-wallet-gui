import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:rbx_wallet/core/app_constants.dart';

part 'config.freezed.dart';
part 'config.g.dart';

stringToInt(String val) => int.parse(val);
stringToBool(String val) => val.toLowerCase() == "true";
stringToList(String val) => val.split(",");

@freezed
class Config with _$Config {
  const Config._();

  factory Config({
    @JsonKey(name: "Port", fromJson: stringToInt) @Default(3338) int port,
    @JsonKey(name: "APIPort", fromJson: stringToInt) @Default(7292) int apiPort,
    @JsonKey(name: "TestNet", fromJson: stringToBool) @Default(false) bool testnet,
    @JsonKey(name: "NFTTimeout", fromJson: stringToInt) @Default(15) int nftTimeout,
    @JsonKey(name: "AutoDownloadNFTAsset", fromJson: stringToBool) @Default(true) bool autoDownloadNftAsset,
    @JsonKey(name: "RejectAssetExtensionTypes", fromJson: stringToList) @Default(DEFAULT_REJECTED_EXTENIONS) List<String> rejectAssetExtensionTypes,
  }) = _Config;

  factory Config.fromJson(Map<String, dynamic> json) => _$ConfigFromJson(json);
}
