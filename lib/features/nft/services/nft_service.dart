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

  Future<Nft?> retrieve(String id) async {
    try {
      final response = await getText('/GetSingleSmartContract/$id');
      final data = jsonDecode(response);
      Nft nft = Nft.fromJson(data[0]['SmartContract']);
      nft = nft.copyWith(code: data[0]['SmartContractCode']);
      return nft;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<bool> togglePrivate(String id) async {
    try {
      final response = await getText('/ChangeNFTPublicState/$id');
      print(response);
      return true;
    } catch (e) {
      return false;
    }
  }
}
