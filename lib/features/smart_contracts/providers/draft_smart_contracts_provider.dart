import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/smart_contract.dart';
import '../services/smart_contract_service.dart';

class DraftsSmartContractProvider extends StateNotifier<List<SmartContract>> {
  final Ref ref;

  DraftsSmartContractProvider(
    this.ref, [
    List<SmartContract> smartContracts = const [],
  ]) : super(smartContracts) {
    load();
  }

  Future<void> load() async {
    final smartContracts = SmartContractService().loadFromStorage();
    state = smartContracts;
  }
}

final draftsSmartContractProvider = StateNotifierProvider<DraftsSmartContractProvider, List<SmartContract>>(
  (ref) => DraftsSmartContractProvider(ref),
);
