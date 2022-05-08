import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rbx_wallet/features/bridge/services/bridge_service.dart';
import 'package:rbx_wallet/features/smart_contracts/features/evolve/evolve.dart';
import 'package:rbx_wallet/features/smart_contracts/features/royalty/royalty.dart';
import 'package:rbx_wallet/features/smart_contracts/features/ticket/ticket.dart';
import 'package:rbx_wallet/features/smart_contracts/models/compiler_payload.dart';
import 'package:rbx_wallet/features/smart_contracts/models/feature.dart';
import 'package:rbx_wallet/features/smart_contracts/models/rarity.dart';
import 'package:rbx_wallet/features/smart_contracts/models/stat.dart';
import 'package:rbx_wallet/features/wallet/models/wallet.dart';

part 'smart_contract.freezed.dart';

@freezed
class SmartContract with _$SmartContract {
  const SmartContract._();

  factory SmartContract({
    required Wallet owner,
    @Default("") String name,
    @Default("") String description,
    @Default("") String thumbnail,
    @Default([]) List<Rarity> rarities,
    // @Default([]) List<Feature> features,
    @Default([]) List<Stat> stats,
    @Default([]) List<Royalty> royalties,
    @Default([]) List<Evolve> evolves,
    @Default([]) List<Ticket> tickets,
  }) = _SmartContract;

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
      features.add({"FeatureName": 1});
    }

    final payload = CompilerPayload(
      name: name,
      description: description,
      address: owner.address,
      assetId: "123",
      features: features,
      uuid: "00000000-0000-0000-0000-000000000000",
      signature: null,
      isPublic: true,
    );

    return payload.toJson();
  }
}
