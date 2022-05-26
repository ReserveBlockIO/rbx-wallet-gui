import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rbx_wallet/features/asset/asset.dart';

part 'compiled_smart_contract.freezed.dart';
part 'compiled_smart_contract.g.dart';

@freezed
abstract class CompiledSmartContract with _$CompiledSmartContract {
  const CompiledSmartContract._();

  factory CompiledSmartContract({
    @JsonKey(name: "Name") required String name,
    @JsonKey(name: "MinterName") String? minterName,
    @JsonKey(name: "Description") required String description,
    @JsonKey(name: "Address") required String address,
    @JsonKey(name: "SmartContractUID") required String id,
    @JsonKey(name: "Signature") String? signature,
    @JsonKey(name: "SmartContractAsset") required Asset primaryAsset,
    @JsonKey(name: "IsPublic") required bool isPublic,
    @JsonKey(name: "IsPublished") required bool isPublished,
    @JsonKey(name: "Features") @Default([]) List<Map<String, dynamic>> features,
  }) = _CompiledSmartContract;

  factory CompiledSmartContract.fromJson(Map<String, dynamic> json) =>
      _$CompiledSmartContractFromJson(json);
}
