import 'package:rbx_wallet/core/services/base_service.dart';
import 'package:rbx_wallet/features/smart_contracts/models/compiled_smart_contract.dart';

class SmartContractService extends BaseService {
  SmartContractService() : super(apiBasePathOverride: "/scapi/scv1");

  Future<CompiledSmartContract?> compileSmartContract(
    Map<String, dynamic> payload, {
    bool test = false,
  }) async {
    try {
      final response = await postJson(
        test ? "/SCPassTest" : "/CreateSmartContract",
        params: payload,
      );

      print("***");
      print(response);
      print("***");

      final csc = CompiledSmartContract.fromJson(response);
      print(csc);
      return csc; //TODO: dynamic based on success
    } catch (e) {
      print(e);
      return null;
    }
  }
}
