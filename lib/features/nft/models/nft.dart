import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rbx_wallet/core/env.dart';
import 'package:rbx_wallet/features/asset/asset.dart';
import 'package:rbx_wallet/features/asset/proxied_asset.dart';
import 'package:rbx_wallet/features/asset/web_asset.dart';
import 'package:rbx_wallet/features/smart_contracts/features/evolve/evolve.dart';
import 'package:rbx_wallet/features/smart_contracts/features/evolve/evolve_phase.dart';
import 'package:rbx_wallet/features/smart_contracts/models/feature.dart';
import 'package:rbx_wallet/features/smart_contracts/models/multi_asset.dart';
import 'package:collection/collection.dart';

part 'nft.freezed.dart';
part 'nft.g.dart';

nullToNull(dynamic blah) => null;

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
    @JsonKey(name: "IsPublic") required bool isPublic,
    @JsonKey(name: "IsPublished") required bool isPublished,
    @JsonKey(name: "IsMinter") required bool isMinter,
    @JsonKey(name: "Features", defaultValue: []) required List<Map<String, dynamic>> features,
    @JsonKey(defaultValue: false) required bool isProcessing,
    String? code,
    @JsonKey(toJson: nullToNull, fromJson: nullToNull) ProxiedAsset? proxiedAsset,
    @JsonKey(toJson: nullToNull, fromJson: nullToNull) List<ProxiedAsset>? additionalProxiedAssets,
    @JsonKey(toJson: nullToNull, fromJson: nullToNull) @Default([]) List<Asset> additionalLocalAssets,
    @JsonKey(toJson: nullToNull, fromJson: nullToNull) @Default([]) List<EvolvePhase> updatedEvolutionPhases,
    @JsonKey(defaultValue: false) required bool assetsAvailable,
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
      evolutionState: 0,
      isCurrentState: evolutionPhases.firstWhereOrNull((p) => p.isCurrentState == true) == null ? true : false,
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

  ProxiedAsset? get currentEvolveAssetWeb {
    return proxiedAsset;

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
}
