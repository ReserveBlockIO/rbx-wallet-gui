import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rbx_wallet/core/app_constants.dart';
import 'package:rbx_wallet/features/asset/asset.dart';
import 'package:rbx_wallet/features/smart_contracts/features/evolve/evolve.dart';
import 'package:rbx_wallet/features/smart_contracts/features/royalty/royalty.dart';
import 'package:rbx_wallet/features/smart_contracts/features/ticket/ticket.dart';
import 'package:rbx_wallet/features/smart_contracts/models/compiler_payload.dart';
import 'package:rbx_wallet/features/smart_contracts/models/detailed_smart_contract.dart';
import 'package:rbx_wallet/features/smart_contracts/models/feature.dart';
import 'package:rbx_wallet/features/smart_contracts/models/multi_asset.dart';
import 'package:rbx_wallet/features/smart_contracts/models/rarity.dart';
import 'package:rbx_wallet/features/smart_contracts/models/stat.dart';
import 'package:rbx_wallet/features/wallet/models/wallet.dart';

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
    @Default("") String code,
    @Default(false) bool isCompiled,
    @Default(false) bool isPublished,
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

    return features;
  }

  Map<String, dynamic> serializeForCompiler(String timezoneName) {
    final List<Map<String, dynamic>> features = [];

    for (final r in royalties) {
      final f = {'FeatureName': Royalty.compilerEnum, 'FeatureFeatures': r.serializeForCompiler()};
      features.add(f);
    }

    for (final e in evolves) {
      final f = {'FeatureName': Evolve.compilerEnum, 'FeatureFeatures': e.serializeForCompiler(minterName, timezoneName)};

      features.add(f);
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

    final payload = CompilerPayload(
      name: name,
      minterName: minterName,
      description: description,
      asset: primaryAsset!.copyWith(authorName: minterName),
      features: features,
      uuid: "00000000-0000-0000-0000-000000000000",
      isPublic: false,
      minterAddress: owner.address,
      isMinter: true,
      hash: "",
    );

    final data = payload.toJson();

    return data;
  }
}
