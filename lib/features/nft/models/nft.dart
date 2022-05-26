import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rbx_wallet/features/asset/asset.dart';
import 'package:rbx_wallet/features/smart_contracts/features/evolve/evolve.dart';
import 'package:rbx_wallet/features/smart_contracts/features/evolve/evolve_phase.dart';
import 'package:rbx_wallet/features/smart_contracts/models/feature.dart';
import 'package:rbx_wallet/features/smart_contracts/models/multi_asset.dart';

part 'nft.freezed.dart';
part 'nft.g.dart';

@freezed
abstract class Nft with _$Nft {
  const Nft._();

  factory Nft({
    @JsonKey(name: "Name") required String name,
    @JsonKey(name: "Description") required String description,
    @JsonKey(name: "Address") required String address,
    @JsonKey(name: "MinterAddress") @Default("") String minterAddress,
    @JsonKey(name: "MinterName") @Default("") String minterName,
    @JsonKey(name: "SmartContractUID") required String id,
    @JsonKey(name: "Signature") String? signature,
    @JsonKey(name: "SmartContractAsset") required Asset primaryAsset,
    @JsonKey(name: "IsPublic") required bool isPublic,
    @JsonKey(name: "IsMinter") required bool isMinter,
    @JsonKey(name: "Features", defaultValue: [])
        required List<Map<String, dynamic>> features,
    String? code,
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
    if (!isMinter) return false;

    for (final feature in featureList) {
      if (feature.type == FeatureType.evolution) {
        final evolve = Evolve.fromCompiler({'phases': feature.data['phases']});
        if (evolve.type != EvolveType.time && !evolve.isDynamic) {
          return true;
        }
      }
      if (feature.type == FeatureType.fractionalization) {
        return true;
      }
    }

    return false;
  }

  bool get canManageEvolve {
    if (!isMinter) return false;
    return true;

    // not using this for now
    for (final feature in featureList) {
      if (feature.type == FeatureType.evolution) {
        final evolve = Evolve.fromCompiler({'phases': feature.data['phases']});
        if (evolve.type != EvolveType.time && !evolve.isDynamic) {
          return true;
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
    // return false;
    if (!canEvolve) {
      return false;
    }
    return false;
    //
    for (final feature in featureList) {
      if (feature.type == FeatureType.evolution) {
        if (feature.data['IsDynamic'] == true) {
          return true;
        }

        if (feature.data['isDynamic'] == true) {
          return true;
        }
      }
    }
    return false;
  }

  EvolvePhase get baseEvolutionPhase {
    return EvolvePhase(
      name: "Base",
      description: description,
      asset: primaryAsset,
      evolutionState: 0,
      isCurrentState:
          evolutionPhases.firstWhereOrNull((p) => p.isCurrentState == true) ==
                  null
              ? true
              : false,
    );
  }

  List<EvolvePhase> get evolutionPhases {
    if (!canEvolve) {
      return [];
    }

    final evolveFeature =
        featureList.firstWhereOrNull((f) => f.type == FeatureType.evolution);

    if (evolveFeature != null) {
      final evolve =
          Evolve.fromCompiler({'phases': evolveFeature.data['phases']});

      return evolve.phases;
    }

    return [];
  }

  EvolvePhase get currentEvolvePhase {
    final current =
        evolutionPhases.firstWhereOrNull((p) => p.isCurrentState == true);
    if (current == null) {
      return baseEvolutionPhase;
    }

    return current;
  }

  int get currentEvolvePhaseIndex {
    final current = evolutionPhases.indexWhere((p) => p.isCurrentState == true);

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
    return "https://rbx.network/nft/$id";
  }
}
