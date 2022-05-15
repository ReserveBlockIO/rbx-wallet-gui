import 'dart:convert';

import 'package:rbx_wallet/core/services/base_service.dart';
import 'package:rbx_wallet/core/singletons.dart';
import 'package:rbx_wallet/core/storage.dart';
import 'package:rbx_wallet/features/nft/models/nft.dart';
import 'package:rbx_wallet/features/smart_contracts/models/compiler_response.dart';
import 'package:rbx_wallet/features/smart_contracts/models/detailed_smart_contract.dart';

class NftService extends BaseService {
  NftService() : super(apiBasePathOverride: "/scapi/scv1");

  Future<List<Nft>> list() async {
    final response = await getText(
      "/GetAllSmartContracts",
    );
    if (response == 'null') {
      return [];
    }

    try {
      final items = jsonDecode(response);

      final List<Nft> smartContracts = [];
      for (final item in items) {
        smartContracts.add(Nft.fromJson(item));
      }
      return smartContracts;
    } catch (e) {
      print(e);
      return [];
    }
  }

  Future<List<Nft>> minted() async {
    final response = await getText(
      "/GetMintedSmartContracts",
    );
    if (response == 'null') {
      return [];
    }

    try {
      final items = jsonDecode(response);

      final List<Nft> smartContracts = [];
      for (final item in items) {
        smartContracts.add(Nft.fromJson(item));
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
}
