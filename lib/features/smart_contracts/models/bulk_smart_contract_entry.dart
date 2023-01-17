import 'package:freezed_annotation/freezed_annotation.dart';

import '../../asset/asset.dart';
import '../features/royalty/royalty.dart';

part 'bulk_smart_contract_entry.freezed.dart';

@freezed
class BulkSmartContractEntry with _$BulkSmartContractEntry {
  const BulkSmartContractEntry._();

  factory BulkSmartContractEntry({
    required String name,
    required String description,
    required String primaryAssetUrl,
    required String creatorName,
    Asset? primaryAsset,
    @Default(1) int quantity,
    Royalty? royalty,
    @Default([]) List<Asset> additionalAssets,
  }) = _BulkSmartContractEntry;

  factory BulkSmartContractEntry.empty() {
    return BulkSmartContractEntry(
      name: "",
      description: "",
      primaryAssetUrl: "",
      creatorName: "",
      quantity: 1,
    );
  }
}
