import 'dart:convert';

import 'package:archive/archive_io.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';
import '../../sc_property/models/sc_property.dart';
import '../../smart_contracts/features/evolve/evolve_phase.dart';
import '../../asset/web_asset.dart';
import 'package:timeago/timeago.dart' as timeago;

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
    @JsonKey(name: "smart_contract_data") required String smartContractDataString,
    @JsonKey(name: "minted_at") required DateTime mintedAt,
    @JsonKey(name: "data") String? data,
    @JsonKey(name: "is_burned") required bool isBurned,
    @JsonKey(name: "asset_urls") Map<String, dynamic>? assetUrls,
    @JsonKey(name: "is_listed") @Default(false) bool isListed,
  }) = _WebNft;

  factory WebNft.fromJson(Map<String, dynamic> json) => _$WebNftFromJson(json);

  factory WebNft.empty() {
    return WebNft(
      identifier: '',
      name: '',
      description: '',
      minterAddress: '',
      ownerAddress: '',
      minterName: '',
      primaryAssetName: '',
      primaryAssetSize: 0,
      smartContractDataString: '',
      mintedAt: DateTime.now(),
      isBurned: false,
    );
  }

  Map<String, dynamic> get smartContractData {
    final Map<String, dynamic> data = jsonDecode(smartContractDataString);
    if (data.containsKey('SmartContractMain')) {
      return data['SmartContractMain'];
    }

    return data;
  }

  Nft get smartContract {
    //TODO: handle multiasset and evolves

    final List<WebAsset> additionalAssetsWeb = [];
    final List<WebAsset> evolveAssetsWeb = [];

    List<EvolvePhase> updatedEvolutionPhases = [];

    if (smartContractData["Features"] != null) {
      for (var feature in smartContractData["Features"]) {
        if (feature['FeatureName'] == 2) {
          for (var asset in feature['FeatureFeatures']) {
            final fileName = asset['FileName'];

            if (assetUrls != null && assetUrls!.containsKey(fileName)) {
              additionalAssetsWeb.add(WebAsset(location: assetUrls![fileName]));
            }
          }
        }

        try {
          if (feature['FeatureName'] == 0) {
            for (var phase in feature['FeatureFeatures']) {
              print(jsonEncode(phase));
              final fileName = phase['SmartContractAsset']["Name"];

              WebAsset? webAsset;
              if (assetUrls != null && assetUrls!.containsKey(fileName)) {
                webAsset = WebAsset(location: assetUrls![fileName]);
              }

              updatedEvolutionPhases.add(EvolvePhase(
                name: phase["Name"],
                description: phase["Description"],
                evolutionState: phase["EvolutionState"],
                isCurrentState: phase['IsCurrentState'] ?? false,
                dateTime: phase['EvolveDate'] != null && phase['EvolveDate'] is num
                    ? DateTime.fromMillisecondsSinceEpoch(phase['EvolveDate'] * 1000)
                    : null,
                blockHeight: phase['EvolveBlockHeight'],
                properties: phase['Properties'] != null ? phase['Properties'].map((p) => ScProperty.fromJson(p)).toList() : [],
                webAsset: webAsset,
              ));
            }
          }
        } catch (e, st) {
          print(e);
          print(st);
        }
      }
    }

    final primaryAssetFilename = smartContractData['SmartContractAsset']['Name'];
    final primaryAssetWeb =
        (assetUrls != null && assetUrls!.containsKey(primaryAssetFilename)) ? WebAsset(location: assetUrls![primaryAssetFilename]) : null;

    // final List<WebAsset> _evoAssetsWeb = primaryAssetWeb != null ? [primaryAssetWeb, ...evolveAssetsWeb] : [];

    // final initialPhase = EvolvePhase(
    //   name: name,
    //   description: description,
    //   webAsset: primaryAssetWeb
    // );

    return Nft.fromJson(smartContractData).copyWith(
      currentOwner: ownerAddress,
      primaryAssetWeb: primaryAssetWeb,
      additionalAssetsWeb: additionalAssetsWeb.isNotEmpty ? additionalAssetsWeb : null,
      // additionalProxiedAssets: additionalProxiedAssets,
      // evolveAssetsWeb: _evoAssetsWeb,
      updatedEvolutionPhases: [...updatedEvolutionPhases],
      code: getCode(),
    );
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
