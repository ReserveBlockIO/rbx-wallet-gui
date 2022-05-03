import 'package:freezed_annotation/freezed_annotation.dart';
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
    @Default([]) List<Feature> features,
    @Default([]) List<Stat> stats,
  }) = _SmartContract;
}
