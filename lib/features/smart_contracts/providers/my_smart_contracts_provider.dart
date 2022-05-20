import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/features/smart_contracts/models/compiled_smart_contract.dart';
import 'package:rbx_wallet/features/smart_contracts/services/smart_contract_service.dart';

class MySmartContractsProvider
    extends StateNotifier<List<CompiledSmartContract>> {
  final Reader read;

  MySmartContractsProvider(
    this.read, [
    List<CompiledSmartContract> smartContracts = const [],
  ]) : super(smartContracts) {
    load();
  }

  Future<void> load() async {
    final smartContracts = await SmartContractService().listSmartContracts();
    state = smartContracts;
  }
}

final mySmartContractsProvider = StateNotifierProvider<MySmartContractsProvider,
    List<CompiledSmartContract>>(
  (ref) => MySmartContractsProvider(ref.read),
);
