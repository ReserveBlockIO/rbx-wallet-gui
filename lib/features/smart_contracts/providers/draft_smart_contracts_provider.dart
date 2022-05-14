import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/features/smart_contracts/models/smart_contract.dart';
import 'package:rbx_wallet/features/smart_contracts/services/smart_contract_service.dart';

class DraftsSmartContractProvider extends StateNotifier<List<SmartContract>> {
  final Reader read;

  DraftsSmartContractProvider(
    this.read, [
    List<SmartContract> smartContracts = const [],
  ]) : super(smartContracts) {
    load();
  }

  Future<void> load() async {
    final smartContracts = SmartContractService().loadFromStorage();
    state = smartContracts;
  }
}

final draftsSmartContractProvider =
    StateNotifierProvider<DraftsSmartContractProvider, List<SmartContract>>(
  (ref) => DraftsSmartContractProvider(ref.read),
);
