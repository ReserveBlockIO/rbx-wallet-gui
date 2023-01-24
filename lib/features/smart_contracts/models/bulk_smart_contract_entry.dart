import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rbx_wallet/features/smart_contracts/features/evolve/evolve.dart';

import '../../asset/asset.dart';
import '../features/royalty/royalty.dart';

part 'bulk_smart_contract_entry.freezed.dart';

@freezed
class BulkSmartContractEntry with _$BulkSmartContractEntry {
  const BulkSmartContractEntry._();

  factory BulkSmartContractEntry({
    required String name,
    required String description,
    required String creatorName,
    Asset? primaryAsset,
    @Default(1) int quantity,
    Royalty? royalty,
    @Default([]) List<Asset> additionalAssets,
    @Default(Evolve()) Evolve evolve,
  }) = _BulkSmartContractEntry;

  factory BulkSmartContractEntry.empty() {
    return BulkSmartContractEntry(
      name: "",
      description: "",
      creatorName: "",
      quantity: 1,
    );
  }
}
