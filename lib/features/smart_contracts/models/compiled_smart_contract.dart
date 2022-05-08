import 'package:freezed_annotation/freezed_annotation.dart';

part 'compiled_smart_contract.freezed.dart';
part 'compiled_smart_contract.g.dart';

@freezed
abstract class CompiledSmartContract with _$CompiledSmartContract {
  const CompiledSmartContract._();

  factory CompiledSmartContract({
    // @JsonKey(name: "SmartContractCode") required String code,
    @JsonKey(name: "Success") required bool success,
    // @JsonKey(name: "SmartContractMain") required Map<String, dynamic> main,
  }) = _CompiledSmartContract;

  factory CompiledSmartContract.fromJson(Map<String, dynamic> json) =>
      _$CompiledSmartContractFromJson(json);
}
