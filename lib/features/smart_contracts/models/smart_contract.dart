import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rbx_wallet/core/app_constants.dart';
import 'package:rbx_wallet/features/asset/asset.dart';
import 'package:rbx_wallet/features/smart_contracts/features/evolve/evolve.dart';
import 'package:rbx_wallet/features/smart_contracts/features/royalty/royalty.dart';
import 'package:rbx_wallet/features/smart_contracts/features/ticket/ticket.dart';
import 'package:rbx_wallet/features/smart_contracts/models/compiled_smart_contract.dart';
import 'package:rbx_wallet/features/smart_contracts/models/compiler_payload.dart';
import 'package:rbx_wallet/features/smart_contracts/models/detailed_smart_contract.dart';
import 'package:rbx_wallet/features/smart_contracts/models/feature.dart';
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
    @Default("") String code,
    @Default(false) bool isCompiled,
    @Default(false) bool isPublished,
  }) = _SmartContract;

  factory SmartContract.fromJson(Map<String, dynamic> json) =>
      _$SmartContractFromJson(json);

  factory SmartContract.fromCompiled(
    DetailedSmartContract details,
    List<Wallet> wallets,
  ) {
    final sc = details.smartContract;

    final owner = wallets.firstWhere(
      (w) => w.address == sc.address,
    );

    final List<Evolve> evolves = [];
    final List<Royalty> royalties = [];

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
        }
      }
    }

    return SmartContract(
      owner: owner,
      name: sc.name,
      description: sc.description,
      minterName: sc.minterName,
      primaryAsset: sc.primaryAsset,
      royalties: royalties,
      evolves: evolves,
      code: details.code,
      isCompiled: ALLOW_DOUBLE_MINTES ? false : true,
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

    return features;
  }

  Map<String, dynamic> serializeForCompiler() {
    final List<Map<String, dynamic>> features = [];

    for (final r in royalties) {
      final f = {
        'FeatureName': Royalty.compilerEnum,
        'FeatureFeatures': r.serializeForCompiler()
      };
      features.add(f);
    }

    for (final e in evolves) {
      final f = {
        'FeatureName': Evolve.compilerEnum,
        'FeatureFeatures': e.serializeForCompiler()
      };
      features.add(f);
    }

    for (final t in tickets) {
      final f = {
        'FeatureName': Ticket.compilerEnum,
        'FeatureFeatures': t.serializeForCompiler(),
      };
      features.add(f);
    }

    final payload = CompilerPayload(
      name: name,
      minterName: minterName,
      description: description,
      address: owner.address,
      asset: primaryAsset!,
      features: features,
      uuid: "00000000-0000-0000-0000-000000000000",
      signature: null,
      isPublic: false,
    );

    final data = payload.toJson();

    return data;
  }
}
