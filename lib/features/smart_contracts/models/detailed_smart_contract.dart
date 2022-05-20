import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rbx_wallet/features/smart_contracts/models/compiled_smart_contract.dart';

part 'detailed_smart_contract.freezed.dart';
part 'detailed_smart_contract.g.dart';

@freezed
abstract class DetailedSmartContract with _$DetailedSmartContract {
  const DetailedSmartContract._();

  factory DetailedSmartContract({
    @JsonKey(name: "SmartContract")
        required CompiledSmartContract smartContract,
    @JsonKey(name: "SmartContractCode", defaultValue: "") required String code,
  }) = _DetailedSmartContract;

  factory DetailedSmartContract.fromJson(Map<String, dynamic> json) =>
      _$DetailedSmartContractFromJson(json);
}
