import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';
import '../../token/models/token_sc_feature.dart';
import '../../sc_property/models/sc_property.dart';

import '../../../core/app_constants.dart';
import '../../asset/asset.dart';
import '../../wallet/models/wallet.dart';
import '../features/evolve/evolve.dart';
import '../features/royalty/royalty.dart';
import '../features/soul_bound/soul_bound.dart';
import '../features/ticket/ticket.dart';
import 'compiler_payload.dart';
import 'detailed_smart_contract.dart';
import 'feature.dart';
import 'fractional.dart';
import 'multi_asset.dart';
import 'pair.dart';
import 'rarity.dart';
import 'stat.dart';
import 'tokenization.dart';

part 'smart_contract.freezed.dart';
part 'smart_contract.g.dart';

@freezed
abstract class SmartContract with _$SmartContract {
  const SmartContract._();

  factory SmartContract({
    required Wallet owner,
    @Default("") String draftId,
    @Default("") String id,
    @Default("") String name,
    @Default("") String minterName,
    @Default("") String description,
    @Default("") String thumbnail,
    Asset? primaryAsset,
    @Default([]) List<Rarity> rarities,
    // @Default([]) List<Feature> features,
    @Default([]) List<Stat> stats,
    @Default([]) List<Royalty> royalties,
    @Default([]) List<Evolve> evolves,
    @Default([]) List<Ticket> tickets,
    @Default([]) List<MultiAsset> multiAssets,
    @Default([]) List<Tokenization> tokenizations,
    @Default([]) List<Fractional> fractionals,
    @Default([]) List<Pair> pairs,
    @Default([]) List<SoulBound> soulBounds,
    @Default(false) includesBtcTokenization,
    @Default("") String code,
    @Default(false) bool isCompiled,
    @Default(false) bool isPublished,
    @Default([]) List<ScProperty> properties,
    TokenScFeature? token,
  }) = _SmartContract;

  factory SmartContract.fromJson(Map<String, dynamic> json) => _$SmartContractFromJson(json);

  factory SmartContract.fromCompiled(
    DetailedSmartContract details,
    Wallet owner,
  ) {
    final sc = details.smartContract;

    // final owner = wallets.firstWhere(
    //   (w) => w.address == sc.address,
    // );

    final List<Evolve> evolves = [];
    final List<Royalty> royalties = [];
    final List<MultiAsset> multiAssets = [];

    for (final f in sc.features) {
      if (f.keys.contains('FeatureName')) {
        switch (f['FeatureName']) {
          case Evolve.compilerEnum:
            final item = Evolve.fromCompiler({'phases': f['FeatureFeatures']});

            evolves.add(item);
            break;
          case Royalty.compilerEnum:
            final item = Royalty.fromCompiler(f['FeatureFeatures']);
            royalties.add(item);

            break;
          case MultiAsset.compilerEnum:
            final item = MultiAsset.fromCompiler(f['FeatureFeatures']);
            multiAssets.add(item);
        }
      }
    }

    return SmartContract(
      owner: owner,
      id: details.smartContract.id,
      name: sc.name,
      description: sc.description,
      minterName: sc.minterName ?? "",
      primaryAsset: sc.primaryAsset,
      royalties: royalties,
      evolves: evolves,
      multiAssets: multiAssets,
      code: details.code,
      isCompiled: ALLOW_DOUBLE_MINTES ? false : true,
      isPublished: details.smartContract.isPublished,
    );
  }

  List<Feature> get features {
    List<Feature> features = [];
    for (final item in royalties) {
      features.add(Feature(type: FeatureType.royalty, data: item.toJson()));
    }

    for (final item in evolves) {
      features.add(Feature(type: FeatureType.evolution, data: item.toJson()));
    }

    for (final item in tickets) {
      features.add(Feature(type: FeatureType.ticket, data: item.toJson()));
    }

    for (final item in multiAssets) {
      features.add(Feature(type: FeatureType.multiAsset, data: item.toJson()));
    }

    for (final item in tokenizations) {
      features.add(Feature(type: FeatureType.tokenization, data: item.toJson()));
    }

    for (final item in fractionals) {
      features.add(Feature(type: FeatureType.fractionalization, data: item.toJson()));
    }

    for (final item in pairs) {
      features.add(Feature(type: FeatureType.pair, data: item.toJson()));
    }

    for (final item in soulBounds) {
      features.add(Feature(type: FeatureType.soulBound, data: item.toJson()));
    }

    if (includesBtcTokenization) {
      features.add(Feature(type: FeatureType.btcTokenization));
    }

    return features;
  }

  Map<String, dynamic> serializeForCompiler(String timezoneName) {
    final List<Map<String, dynamic>> features = [];

    for (final r in royalties) {
      final f = {'FeatureName': Royalty.compilerEnum, 'FeatureFeatures': r.serializeForCompiler()};
      features.add(f);
    }

    for (final e in evolves) {
      if (e.phases.isNotEmpty) {
        final f = {'FeatureName': Evolve.compilerEnum, 'FeatureFeatures': e.serializeForCompiler(minterName, timezoneName)};
        features.add(f);
      }
    }

    for (final t in tickets) {
      final f = {
        'FeatureName': Ticket.compilerEnum,
        'FeatureFeatures': t.serializeForCompiler(),
      };
      features.add(f);
    }

    for (final m in multiAssets) {
      final f = {'FeatureName': MultiAsset.compilerEnum, 'FeatureFeatures': m.serializeForCompiler(minterName)};
      features.add(f);
    }

    if (token != null) {
      final f = {
        'FeatureName': TokenScFeature.compilerEnum,
        'FeatureFeatures': token!.toJson(),
      };
      features.add(f);
    }

    Map<String, String>? propertiesOutput;
    if (properties.isNotEmpty) {
      propertiesOutput = {};
      for (final property in properties) {
        final name = property.name.replaceAll(":", "").replaceAll("<|>", "");
        final value = property.value.replaceAll(":", "").replaceAll("<|>", "");
        propertiesOutput[name] = value;
      }
    }

    final payload = CompilerPayload(
      name: name,
      minterName: minterName,
      description: description.replaceAll("\n", "\\n").replaceAll("\r", ""),
      asset: primaryAsset!.copyWith(authorName: minterName),
      features: features,
      uuid: "00000000-0000-0000-0000-000000000000",
      isPublic: false,
      minterAddress: owner.address,
      isMinter: true,
      hash: "",
      properties: propertiesOutput,
    );

    Map<String, dynamic> data = payload.toJson();

    if (properties.isEmpty) {
      data.remove('Properties');
    }

    print(jsonEncode(data));

    return data;
  }

  bool get primaryAssetRequired {
    for (final feature in features) {
      if ([
        FeatureType.multiAsset,
        FeatureType.tokenization,
      ].contains(feature.type)) {
        return false;
      }
    }

    return true;
  }
}
