import 'dart:io';

import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rbx_wallet/core/app_constants.dart';
import 'package:rbx_wallet/features/token/models/token_details.dart';
import 'package:rbx_wallet/features/token/models/token_sc_feature.dart';
import '../../../core/utils.dart';
import '../../asset/web_asset.dart';
import '../../dst/providers/listed_nfts_provider.dart';
import '../../sc_property/models/sc_property.dart';
import '../../smart_contracts/features/royalty/royalty.dart';

import '../../../core/env.dart';
import '../../asset/asset.dart';
import '../../smart_contracts/features/evolve/evolve.dart';
import '../../smart_contracts/features/evolve/evolve_phase.dart';
import '../../smart_contracts/models/feature.dart';
import '../../smart_contracts/models/multi_asset.dart';

import '../../web_shop/providers/web_listed_nfts_provider.dart';

part 'nft.freezed.dart';
part 'nft.g.dart';

nullToNull(dynamic blah) => null;

propertiesFromJson(Map<String, dynamic>? properties) {
  if (properties == null) {
    return [];
  }

  final List<ScProperty> output = [];
  for (final kv in properties.entries) {
    final key = kv.key;
    final String? value = kv.value;
    if (value == null) continue;

    ScPropertyType type = ScPropertyType.text;

    if (key == BACKUP_URL_PROPERTY_NAME) {
      type = ScPropertyType.url;
    } else if (isNumeric(value)) {
      type = ScPropertyType.number;
    } else if (value.length == 7 && value.startsWith("#")) {
      type = ScPropertyType.color;
    }

    output.add(ScProperty(name: key, value: value, type: type));
  }

  return output;
}

@freezed
abstract class Nft with _$Nft {
  const Nft._();

  @JsonSerializable(explicitToJson: true)
  factory Nft({
    @JsonKey(name: "Name") required String name,
    @JsonKey(name: "Description") required String description,
    @JsonKey(name: "CurrentOwner") @Default("") String currentOwner,
    @JsonKey(name: "MinterAddress") @Default("") String minterAddress,
    @JsonKey(name: "MinterName") @Default("") String minterName,
    @JsonKey(name: "SmartContractUID") required String id,
    @JsonKey(name: "SmartContractAsset") required Asset primaryAsset,
    @JsonKey(ignore: true) WebAsset? primaryAssetWeb,
    @JsonKey(ignore: true) List<WebAsset>? additionalAssetsWeb,
    // @JsonKey(ignore: true) List<WebAsset>? evolveAssetsWeb,
    @JsonKey(name: "IsPublic") required bool isPublic,
    @JsonKey(name: "IsPublished") required bool isPublished,
    @JsonKey(name: "IsMinter") required bool isMinter,
    @JsonKey(name: "Features", defaultValue: []) required List<Map<String, dynamic>> features,
    @JsonKey(name: "Properties", fromJson: propertiesFromJson) @Default([]) List<ScProperty> properties,
    @JsonKey(name: "NextOwner") String? nextOwner,
    @JsonKey(name: "IsLocked") @Default(false) bool isLocked,
    @JsonKey(defaultValue: false) required bool isProcessing,
    String? code,
    // @JsonKey(ignore: true) List<ProxiedAsset>? additionalProxiedAssets,
    @JsonKey(ignore: true) @Default([]) List<Asset> additionalLocalAssets,
    @JsonKey(ignore: true) @Default([]) List<EvolvePhase> updatedEvolutionPhases,
    // @JsonKey(defaultValue: false) required bool assetsAvailable,
    // Map<String, dynamic>? assetUrls,
    @JsonKey(ignore: true) String? thumbsPath,
    @JsonKey(ignore: true) TokenDetails? tokenStateDetails,
  }) = _Nft;

  factory Nft.fromJson(Map<String, dynamic> json) => _$NftFromJson(json);

  List<Feature> get featureList {
    return features.map((f) => Feature.fromCompiler(f)).toList();
  }

  String? get featureListLabel {
    final values = featureList.map((f) => f.nameLabel);
    if (values.isNotEmpty) {
      return values.join(', ');
    }
    return null;
  }

  bool get isToken {
    for (final feature in featureList) {
      if (feature.type == FeatureType.token) {
        return true;
      }
    }

    return false;
  }

  TokenScFeature? get tokenDetails {
    if (!isToken) {
      return null;
    }
    for (final feature in featureList) {
      if (feature.type == FeatureType.token) {
        return TokenScFeature.fromJson(feature.data);
      }
    }

    return null;
  }

  bool get manageable {
    // if (!isMinter) return false;
    // if (!isPublished) return false;

    for (final feature in featureList) {
      if (feature.type == FeatureType.evolution) {
        final evolve = Evolve.fromCompiler({'phases': feature.data['phases']});
        if (evolve.phases.isNotEmpty) {
          if (evolve.phases.first.dateTime != null || evolve.phases.first.blockHeight != null) {
            return false;
          }
        }
        return true;
      }
      if (feature.type == FeatureType.fractionalization) {
        return true;
      }
    }

    return false;
  }

  bool get canManageEvolve {
    if (!isMinter) return false;
    // return true;

    // not using this for now
    for (final feature in featureList) {
      if (feature.type == FeatureType.evolution) {
        final evolve = Evolve.fromCompiler({'phases': feature.data['phases']});

        for (final phase in evolve.phases) {
          if (phase.dateTime == null && phase.blockHeight == null) {
            return true;
          }
        }
      }
    }
    return false;
  }

  bool get canEvolve {
    for (final feature in featureList) {
      if (feature.type == FeatureType.evolution) {
        return true;
      }
    }
    return false;
  }

  Royalty? get royalty {
    for (final feature in featureList) {
      if (feature.type == FeatureType.royalty) {
        print(feature.data);
        return Royalty(
          id: '',
          type: feature.data['type'] == 0 ? RoyaltyType.fixed : RoyaltyType.percent,
          amount: feature.data['amount'],
          address: feature.data['address'],
        );
      }
    }
    return null;
  }

  bool get evolveIsDynamic {
    if (!canEvolve) {
      return false;
    }
    return false;
  }

  EvolvePhase get baseEvolutionPhase {
    return EvolvePhase(
      name: "Base",
      description: description,
      asset: primaryAsset,
      webAsset: primaryAssetWeb,
      evolutionState: 0,
      isCurrentState: evolutionPhases.firstWhereOrNull((p) => p.isCurrentState == true) == null ? true : false,
      properties: properties,
    );
  }

  List<EvolvePhase> get evolutionPhases {
    if (!canEvolve) {
      return [];
    }

    final evolveFeature = featureList.firstWhereOrNull((f) => f.type == FeatureType.evolution);

    if (evolveFeature != null) {
      final evolve = Evolve.fromCompiler({'phases': evolveFeature.data['phases']});

      return evolve.phases;
    }

    return [];
  }

  EvolvePhase get currentEvolvePhase {
    final current = updatedEvolutionPhases.firstWhereOrNull((p) => p.isCurrentState == true);

    if (current == null) {
      return baseEvolutionPhase;
    }

    return current;
  }

  int get currentEvolvePhaseIndex {
    final current = updatedEvolutionPhases.indexWhere((p) => p.isCurrentState == true);

    return current;
  }

  Asset get currentEvolveAsset {
    if (!canEvolve) {
      return primaryAsset;
    }

    if (currentEvolvePhase.asset != null) {
      return currentEvolvePhase.asset!;
    }

    return primaryAsset;
  }

  List<ScProperty> get currentEvolveProperties {
    if (!canEvolve) {
      return properties;
    }

    return currentEvolvePhase.properties;
  }

  WebAsset? get currentEvolveAssetWeb {
    if (!canEvolve) {
      return primaryAssetWeb;
    }

    if (currentEvolvePhase.webAsset != null) {
      return currentEvolvePhase.webAsset!;
    }

    return primaryAssetWeb;

    //TODO handle evolve asset stuff
    // if (!canEvolve) {
    //   return proxiedAsset;
    // }

    // if (currentEvolvePhase.asset != null) {
    //   return currentEvolvePhase.asset!;
    // }

    // return primaryAsset;
  }

  String get currentEvolveName {
    if (!canEvolve) {
      return name;
    }

    if (currentEvolvePhaseIndex == -1) {
      return name;
    }

    return "$name: ${currentEvolvePhase.name}";
  }

  String get currentEvolveDescription {
    if (!canEvolve) {
      return description;
    }

    return currentEvolvePhase.description;
  }

  List<Asset> get additionalAssets {
    final List<Asset> assets = [];

    for (final feature in featureList) {
      if (feature.type == FeatureType.multiAsset) {
        final multiAsset = MultiAsset.fromCompiler(feature.data['assets']);
        for (final a in multiAsset.assets) {
          assets.add(a);
        }
      }
    }

    return assets;
  }

  String get explorerUrl {
    return "${Env.baseExplorerUrl}nfts/$id";
  }

  String get truncatedName {
    const maxLength = 16;
    if (maxLength >= name.length) {
      return name;
    }
    return name.replaceRange(maxLength, name.length, "...");
  }

  Future<bool> areFilesReady() async {
    if (primaryAsset.localPath == null) {
      print("Primary null");
      return false;
    }

    final size = await File(primaryAsset.localPath!).length();
    if (size < primaryAsset.fileSize) {
      print("Primary size");

      return false;
    }

    for (final a in additionalLocalAssets) {
      if (a.localPath == null) {
        print("additional null ${a.fileName}");

        return false;
      }
      final size = await File(a.localPath!).length();
      if (size < a.fileSize) {
        print("additional size ${a.fileName}");

        return false;
      }
    }
    return true;
  }

  bool isListed(WidgetRef ref) {
    if (kIsWeb) {
      if (ref.read(webListedNftsProvider).contains(id)) {
        return true;
      }
    } else {
      if (ref.read(listedNftsProvider).contains(id)) {
        return true;
      }
    }
    return false;
  }
}
