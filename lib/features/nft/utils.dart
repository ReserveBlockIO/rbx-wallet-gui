import 'package:rbx_wallet/features/asset/asset.dart';
import 'package:rbx_wallet/features/nft/models/nft.dart';
import 'package:rbx_wallet/features/smart_contracts/features/evolve/evolve_phase.dart';
import 'package:rbx_wallet/features/smart_contracts/models/feature.dart';
import 'package:rbx_wallet/features/smart_contracts/services/smart_contract_service.dart';

Future<Nft> setAssetPath(Nft nft) async {
  final assetPath = await SmartContractService().getAssetPath(nft.id, nft.primaryAsset.fileName);

  if (assetPath != null) {
    final a = nft.primaryAsset.copyWith(localPath: assetPath);
    nft = nft.copyWith(primaryAsset: a);
  }

  final List<Asset> additionalAssets = [];

  for (final a in nft.additionalAssets) {
    final path = await SmartContractService().getAssetPath(nft.id, a.fileName);
    additionalAssets.add(a.copyWith(localPath: path));
  }

  nft = nft.copyWith(additionalLocalAssets: additionalAssets);

  for (final f in nft.featureList) {
    if (f.type == FeatureType.evolution) {
      final List<EvolvePhase> stages = [];
      for (final stage in nft.evolutionPhases) {
        if (stage.asset != null) {
          final p = await SmartContractService().getAssetPath(nft.id, stage.asset!.fileName);
          final a = stage.asset!.copyWith(localPath: p);
          stages.add(stage.copyWith(asset: a));
        } else {
          stages.add(stage);
        }
      }
      nft = nft.copyWith(updatedEvolutionPhases: stages);
    }
  }

  return nft;
}
