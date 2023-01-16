import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/compiled_smart_contract.dart';

class MySmartContractsProvider extends StateNotifier<List<CompiledSmartContract>> {
  final Reader read;

  MySmartContractsProvider(
    this.read, [
    List<CompiledSmartContract> smartContracts = const [],
  ]) : super(smartContracts) {
    load();
  }

  Future<void> load() async {
    // final smartContracts = await SmartContractService().listSmartContracts();
    // state = smartContracts;
  }
}

final mySmartContractsProvider = StateNotifierProvider<MySmartContractsProvider, List<CompiledSmartContract>>(
  (ref) => MySmartContractsProvider(ref.read),
);
