import 'package:freezed_annotation/freezed_annotation.dart';

part 'bulk_smart_contract_entry.freezed.dart';

@freezed
class BulkSmartContractEntry with _$BulkSmartContractEntry {
  const BulkSmartContractEntry._();

  factory BulkSmartContractEntry({
    required String name,
    required String description,
    required String primaryAssetUrl,
    required String creatorName,
    @Default(1) int quantity,
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
