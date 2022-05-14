import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rbx_wallet/features/asset/asset.dart';
import 'package:rbx_wallet/features/smart_contracts/features/evolve/evolve.dart';
import 'package:rbx_wallet/features/smart_contracts/features/royalty/royalty.dart';
import 'package:rbx_wallet/features/smart_contracts/models/feature.dart';

part 'nft.freezed.dart';
part 'nft.g.dart';

@freezed
abstract class Nft with _$Nft {
  const Nft._();

  factory Nft({
    @JsonKey(name: "Name") required String name,
    @JsonKey(name: "Description") required String description,
    @JsonKey(name: "Address") required String address,
    @JsonKey(name: "SmartContractUID") required String id,
    @JsonKey(name: "Signature") String? signature,
    @JsonKey(name: "SmartContractAsset") required Asset primaryAsset,
    @JsonKey(name: "IsPublic") required bool isPublic,
    @JsonKey(name: "Features", defaultValue: [])
        required List<Map<String, dynamic>> features,
    String? code,
  }) = _Nft;

  factory Nft.fromJson(Map<String, dynamic> json) => _$NftFromJson(json);

  List<Feature> get featureList {
    return features.map((f) => Feature.fromCompiler(f)).toList();
  }

  // List<Evolve> get evolves {
  //   final List<Evolve> items = [];
  //   for (final f in features) {
  //     if (f.keys.contains('FeatureName')) {
  //       if (f['FeatureName'] == Evolve.compilerEnum) {
  //         final item = Evolve.fromCompiler(f['FeatureFeatures']);
  //         items.add(item);
  //       }
  //     }
  //   }

  //   return items;
  // }

  // List<Royalty> get royalties {
  //   final List<Royalty> items = [];
  //   for (final f in features) {
  //     if (f.keys.contains('FeatureName')) {
  //       if (f['FeatureName'] == Evolve.compilerEnum) {
  //         final item = Royalty.fromCompiler(f['FeatureFeatures']);
  //         items.add(item);
  //       }
  //     }
  //   }

  //   return items;
  // }
}
