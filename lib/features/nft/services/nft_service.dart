import 'dart:convert';

import 'package:rbx_wallet/core/services/base_service.dart';
import 'package:rbx_wallet/core/singletons.dart';
import 'package:rbx_wallet/core/storage.dart';
import 'package:rbx_wallet/features/asset/asset.dart';
import 'package:rbx_wallet/features/nft/models/nft.dart';
import 'package:collection/collection.dart';
import 'package:rbx_wallet/features/nft/utils.dart';
import 'package:rbx_wallet/features/smart_contracts/features/evolve/evolve_phase.dart';
import 'package:rbx_wallet/features/smart_contracts/models/feature.dart';
import 'package:rbx_wallet/features/smart_contracts/services/smart_contract_service.dart';

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
        Nft nft = Nft.fromJson(item);
        nft = await setAssetPath(nft);

        smartContracts.add(nft);
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
        Nft nft = Nft.fromJson(item);
        nft = await setAssetPath(nft);
        smartContracts.add(nft);
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
      nft = nft.copyWith(code: data[0]['SmartContractCode'], currentOwner: data[0]['CurrentOwner']);
      nft = await setAssetPath(nft);
      return nft;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<bool> togglePrivate(String id) async {
    try {
      await getText('/ChangeNFTPublicState/$id');
      return true;
    } catch (e) {
      return false;
    }
  }

  List<String> loadSavedIds() {
    return singleton<Storage>().getStringList(Storage.MANAGABLE_NFT_IDS) ?? [];
  }

  void saveId(String id) {
    final saved = singleton<Storage>().getStringList(Storage.MANAGABLE_NFT_IDS) ?? [];

    final exists = saved.firstWhereOrNull((i) => i == id) != null;

    if (!exists) {
      singleton<Storage>().setStringList(
        Storage.MANAGABLE_NFT_IDS,
        [...saved, id],
      );
    }
  }

  Future<List<Nft>> getSaved() async {
    final ids = loadSavedIds();

    final List<Nft> nfts = [];
    for (final id in ids) {
      try {
        final response = await getText('/GetSmartContractData/$id');

        if (response.isNotEmpty) {
          try {
            final data = jsonDecode(response);
            Nft nft = Nft.fromJson(data);
            nfts.add(nft);
          } catch (e) {
            print('problem loading nft from json');
            print(e);
          }
        }
      } catch (e) {
        print("Could not fetch data for $id");
      }
    }

    return nfts;
  }
}
