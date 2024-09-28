import 'package:freezed_annotation/freezed_annotation.dart';
import '../features/evolve/evolve.dart';

import '../../asset/asset.dart';
import '../../sc_property/models/sc_property.dart';
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
    @Default([]) List<ScProperty> properties,
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
