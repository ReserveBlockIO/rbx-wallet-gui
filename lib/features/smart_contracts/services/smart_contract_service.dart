import 'dart:convert';
import 'dart:io';

import 'package:rbx_wallet/core/services/base_service.dart';
import 'package:rbx_wallet/core/singletons.dart';
import 'package:rbx_wallet/core/storage.dart';
import 'package:rbx_wallet/features/smart_contracts/models/compiled_smart_contract.dart';
import 'package:rbx_wallet/features/smart_contracts/models/compiler_response.dart';
import 'package:rbx_wallet/features/smart_contracts/models/detailed_smart_contract.dart';
import 'package:rbx_wallet/features/smart_contracts/models/smart_contract.dart';
import 'package:collection/collection.dart';
import 'package:rbx_wallet/utils/generators.dart';
import 'package:rbx_wallet/utils/toast.dart';

class SmartContractService extends BaseService {
  SmartContractService() : super(apiBasePathOverride: "/scapi/scv1");

  // http://localhost:7292/scapi/scv1/GetAllSmartContracts

  Future<List<CompiledSmartContract>> listSmartContractsOLD() async {
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
      final url = '/GetSingleSmartContract/$id';
      final response = await getText(url);
      final data = jsonDecode(response);
      return DetailedSmartContract.fromJson(data[0]);
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<CompilerResponse?> compileSmartContract(
      Map<String, dynamic> payload) async {
    final Map<String, dynamic> p = {...payload}..remove('hash');

    print("------------");
    print("--/CreateSmartContract PAYLOAD--");
    print(jsonEncode(p));
    print("------------");

    try {
      final response =
          await postJson("/CreateSmartContract", params: p, timeout: 99999999);

      // print("==============");
      // print(jsonEncode(response['data'][0]));
      // print("==============");

      final csc = CompilerResponse.fromJson(response['data'][0]);
      return csc;
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

  void deleteFromStorage(SmartContract smartContract) {
    final existing = loadRawFromStorage();

    final updated = [
      ...existing
        ..removeWhere((element) => element['draftId'] == smartContract.draftId)
    ];

    singleton<Storage>().setList(Storage.LOCAL_SMART_CONTRACTS, updated);
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
      print("-------------ID $id------------");
      final response =
          await getText("/MintSmartContract/$id", timeout: 99999999);

      if (response == "Smart contract has been published to mempool") {
        return true;
      }
      return false;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> transfer(String id, String address, String? url) async {
    try {
      final text = await getText(
        url != null && url.isNotEmpty
            ? "/TransferNFT/$id/$address/$url"
            : "/TransferNFT/$id/$address",
        timeout: 99999,
      );

      final Map<String, dynamic> data = jsonDecode(text);
      if (!data.containsKey("Hash") &&
          data['Hash'] != null &&
          data['Hash'] != "") {
        return false;
      }

      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> evolve(String id, String toAddress, int stage) async {
    try {
      await getText("/EvolveSpecific/$id/$toAddress/$stage");

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

  Future<bool> associateAsset(String nftId, String assetPath) async {
    try {
      assetPath = assetPath.replaceAll("/", "%2F").replaceAll("\\", "%5C");
      final url = "/AssociateNFTAsset/$nftId/$assetPath";

      final response = await getText(url, cleanPath: false, timeout: 99999999);
      final data = jsonDecode(response);

      print(response);

      if (data['Result'] == "Success") {
        Toast.message(data['Message']);

        return true;
      }

      Toast.error(data['Message']);
      return false;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> downloadAssets(String nftId) async {
    try {
      final data =
          await getText("/DownloadNftAssets/$nftId", timeout: 99999999);
      print(data);
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<String?> getAssetPath(String scId, String filename) async {
    try {
      final path = "/GetNFTAssetLocation/$scId/$filename";
      final location = await getText(path, cleanPath: false);
      if (location == "Error") return null;
      if (location == "NA") return null;
      return location;
    } catch (e) {
      print(e);
      return null;
    }
  }
}
