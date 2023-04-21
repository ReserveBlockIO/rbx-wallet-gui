import 'dart:convert';

import 'package:archive/archive_io.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../../asset/proxied_asset.dart';
import 'nft.dart';

part 'web_nft.freezed.dart';
part 'web_nft.g.dart';

@freezed
abstract class WebNft with _$WebNft {
  const WebNft._();

  factory WebNft({
    required String identifier,
    required String name,
    required String description,
    @JsonKey(name: "minter_address") required String minterAddress,
    @JsonKey(name: "owner_address") required String ownerAddress,
    @JsonKey(name: "minter_name") required String minterName,
    @JsonKey(name: "primary_asset_name") required String primaryAssetName,
    @JsonKey(name: "primary_asset_size") required int primaryAssetSize,
    // @JsonKey(name: "additional_assets_remote_keys") List<String>? additionalAssetsRemoteKeys,
    @JsonKey(name: "smart_contract_data") required String smartContractDataString,
    @JsonKey(name: "minted_at") required DateTime mintedAt,
    @JsonKey(name: "primary_asset_remote_key") String? primaryAssetRemoteKey, //TODO handle
    @JsonKey(name: "assets_available") @Default(false) bool assetsAvailable, //TODO handle
    @JsonKey(name: "data") String? data,
    @JsonKey(name: "is_burned") required bool isBurned,
  }) = _WebNft;

  factory WebNft.fromJson(Map<String, dynamic> json) => _$WebNftFromJson(json);

  Map<String, dynamic> get smartContractData {
    final sanatizedString = smartContractDataString.replaceAll("'", '"');
    final Map<String, dynamic> data = jsonDecode(sanatizedString);
    if (data.containsKey('SmartContractMain')) {
      return data['SmartContractMain'];
    }

    return data;
  }

  Nft get smartContract {
    final List<ProxiedAsset> additionalProxiedAssets = [];

    if (smartContractData["Features"] != null) {
      for (var feature in smartContractData["Features"]) {
        if (feature['FeatureName'] == 2) {
          for (var asset in feature['FeatureFeatures']) {
            final fileName = asset['FileName'];

            if (primaryAssetRemoteKey != null) {
              final key = primaryAssetRemoteKey!.replaceAll(primaryAssetName, fileName);
              final a = ProxiedAsset(
                key: key,
                fileName: fileName,
                fileSize: asset['FileSize'],
                authorName: asset['AssetAuthorName'],
              );
              additionalProxiedAssets.add(a);
            }
          }
        }
      }
    }
    return Nft.fromJson(smartContractData).copyWith(
        currentOwner: ownerAddress,
        assetsAvailable: assetsAvailable,
        proxiedAsset: primaryAssetRemoteKey != null
            ? ProxiedAsset(
                key: primaryAssetRemoteKey!,
                fileName: primaryAssetName,
                fileSize: primaryAssetSize,
                authorName: minterName,
              )
            : null,
        additionalProxiedAssets: additionalProxiedAssets,
        code: getCode());
  }

  String get mintedAtLabel {
    return timeago.format(mintedAt, allowFromNow: true);
  }

  String get mintedAtLabelPrecise {
    return DateFormat.yMd().add_jm().format(mintedAt);
  }

  String? getCode() {
    if (data == null) {
      return null;
    }

    try {
      final Map<String, dynamic> obj = jsonDecode(data!).first;

      if (obj.containsKey("Data")) {
        final d = obj['Data'];

        final decodedB64 = base64Decode(d);

        final decodedGzip = GZipDecoder().decodeBytes(decodedB64);
        final str = utf8.decode(decodedGzip);
        return str;
      }
      return null;
    } catch (e) {
      print(e);
      return null;
    }
  }
}
