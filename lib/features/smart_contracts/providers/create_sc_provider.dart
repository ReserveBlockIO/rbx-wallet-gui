import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/providers/session_provider.dart';
import 'package:rbx_wallet/features/smart_contracts/models/feature.dart';
import 'package:rbx_wallet/features/smart_contracts/models/rarity.dart';
import 'package:rbx_wallet/features/smart_contracts/models/smart_contract.dart';
import 'package:rbx_wallet/features/smart_contracts/models/stat.dart';
import 'package:rbx_wallet/features/wallet/models/wallet.dart';

class CreateScProvider extends StateNotifier<SmartContract> {
  final Reader read;

  CreateScProvider(this.read, SmartContract model) : super(model);

  void setOwner(Wallet wallet) {
    state = state.copyWith(owner: wallet);
  }

  void setName(String value) {
    state = state.copyWith(name: value);
  }

  void setDescription(String value) {
    state = state.copyWith(name: value);
  }
}

final createScProvider = StateNotifierProvider<CreateScProvider, SmartContract>(
  (ref) {
    final List<Rarity> rarities = [
      Rarity(name: "Basic", weight: 0.9, description: "Lorem ipsum"),
      Rarity(name: "Gold", weight: 0.1, description: "Lorem ipsum doller"),
    ];

    final List<Feature> features = [
      Feature(type: FeatureType.royalty),
      Feature(type: FeatureType.evolution),
    ];

    final List<Stat> stats = [
      Stat(label: "Background", value: "#CCCCCC", type: StatType.color),
      Stat(label: "HP", value: "100", type: StatType.color),
    ];

    final initial = SmartContract(
      owner: ref.read(sessionProvider).currentWallet!,
      rarities: rarities,
      features: features,
      stats: stats,
    );
    return CreateScProvider(ref.read, initial);
  },
);
