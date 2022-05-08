import 'package:freezed_annotation/freezed_annotation.dart';

part 'compiled_smart_contract.freezed.dart';
part 'compiled_smart_contract.g.dart';

@freezed
abstract class CompiledSmartContract with _$CompiledSmartContract {
  const CompiledSmartContract._();

  factory CompiledSmartContract({
    required String uuid,
  }) = _CompiledSmartContract;

  factory CompiledSmartContract.fromJson(Map<String, dynamic> json) =>
      _$CompiledSmartContractFromJson(json);
}
