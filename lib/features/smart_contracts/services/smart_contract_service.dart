import 'dart:convert';

import 'package:rbx_wallet/core/services/base_service.dart';
import 'package:rbx_wallet/core/singletons.dart';
import 'package:rbx_wallet/core/storage.dart';
import 'package:rbx_wallet/features/smart_contracts/models/compiled_smart_contract.dart';
import 'package:rbx_wallet/features/smart_contracts/models/compiler_response.dart';
import 'package:rbx_wallet/features/smart_contracts/models/detailed_smart_contract.dart';
import 'package:rbx_wallet/features/smart_contracts/models/smart_contract.dart';
import 'package:collection/collection.dart';
import 'package:rbx_wallet/utils/generators.dart';

class SmartContractService extends BaseService {
  SmartContractService() : super(apiBasePathOverride: "/scapi/scv1");

  // http://localhost:7292/scapi/scv1/GetAllSmartContracts

  Future<List<CompiledSmartContract>> listSmartContracts() async {
    try {
      final response = await getText(
        "/GetAllSmartContracts",
      );
      if (response == 'null') {
        return [];
      }
      final items = jsonDecode(response);

      final List<CompiledSmartContract> smartContracts = [];
      for (final item in items) {
        smartContracts.add(CompiledSmartContract.fromJson(item));
      }
      return smartContracts;
    } catch (e) {
      print(e);
      return [];
    }
  }

  Future<DetailedSmartContract?> retrieve(String id) async {
    try {
      final response = await getText('/GetSingleSmartContract/$id');
      final data = jsonDecode(response);
      return DetailedSmartContract.fromJson(data[0]);
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<CompilerResponse?> compileSmartContract(
    Map<String, dynamic> payload, {
    bool test = false,
  }) async {
    try {
      final response = await postJson(
        test ? "/SCPassTest" : "/CreateSmartContract",
        params: payload,
      );

      final csc = CompilerResponse.fromJson(response['data'][0]);
      return csc; //TODO: dynamic based on success
    } catch (e, stackTrace) {
      print('compileSmartContract error');
      print(e);
      print(stackTrace);
      return null;
    }
  }

  List<dynamic> loadRawFromStorage() {
    final items = singleton<Storage>().getList(Storage.LOCAL_SMART_CONTRACTS);

    if (items == null) {
      return [];
    }

    return items;
  }

  List<SmartContract> loadFromStorage() {
    final items = loadRawFromStorage();

    final List<SmartContract> smartContracts = [];
    for (final item in items) {
      smartContracts.add(SmartContract.fromJson(item));
    }

    return smartContracts;
  }

  void saveToStorage(SmartContract smartContract) {
    final existing = loadRawFromStorage();

    if (smartContract.draftId.isNotEmpty) {
      final _existing = loadFromStorage();
      final current =
          _existing.firstWhereOrNull((s) => s.draftId == smartContract.draftId);

      if (current != null) {
        final index =
            _existing.indexWhere((s) => s.draftId == smartContract.draftId);

        existing.removeAt(index);
        existing.insert(index, smartContract.toJson());
        singleton<Storage>().setList(Storage.LOCAL_SMART_CONTRACTS, existing);
        return;
      }
    }

    final sc = smartContract.copyWith(draftId: uniqueId());

    final updated = [...existing, sc.toJson()];

    singleton<Storage>().setList(Storage.LOCAL_SMART_CONTRACTS, updated);
  }

  Future<bool> mint(String id) async {
    try {
      final response = await getText("/MintSmartContract/$id");

      if (response == "Smart contract has been published to mempool") {
        return true;
      }
      return false;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> transfer(String id, String address) async {
    try {
      final response = await getText("/TransferNFT/$id/$address");
      print(response);
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> evolve(String id, String toAddress, int stage) async {
    try {
      final response = await getText("/EvolveSpecific/$id/$toAddress/$stage");
      print(response);

      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> burn(String id) async {
    try {
      await getText("/Burn/$id");
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
