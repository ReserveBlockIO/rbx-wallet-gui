import 'dart:convert';

import 'package:collection/collection.dart';

import '../../../core/models/paginated_response.dart';
import '../../../core/services/base_service.dart';
import '../../../core/singletons.dart';
import '../../../core/storage.dart';
import '../models/nft.dart';
import '../utils.dart';

class NftService extends BaseService {
  NftService() : super(apiBasePathOverride: "/scapi/scv1");

  Future<CliPaginatedResponse<Nft>> list(int page, {String search = ""}) async {
    if (page < 1) {
      page = 1;
    }

    final url = search.isNotEmpty ? "/GetAllSmartContracts/$page/$search" : "/GetAllSmartContracts/$page";

    final response = await getText(url, cleanPath: false);
    if (response == 'null') {
      return CliPaginatedResponse.empty();
    }

    try {
      final data = jsonDecode(response);

      final items = data['Results'];
      final count = data['Count'];

      final List<Nft> smartContracts = [];
      for (final item in items) {
        Nft nft = Nft.fromJson(item);
        nft = await setAssetPath(nft);

        smartContracts.add(nft);
      }

      return CliPaginatedResponse(page: page, count: count, results: smartContracts);
      // return smartContracts;
    } catch (e) {
      print(e);
      return CliPaginatedResponse.empty();
    }
  }

  Future<CliPaginatedResponse<Nft>> minted(int page, {String search = ""}) async {
    if (page < 1) {
      page = 1;
    }

    final url = search.isNotEmpty ? "/GetMintedSmartContracts/$page/$search" : "/GetMintedSmartContracts/$page";
    final response = await getText(url, cleanPath: false);

    if (response == 'null') {
      return CliPaginatedResponse.empty();
    }

    try {
      final data = jsonDecode(response);

      final items = data['Results'];
      final count = data['Count'];

      final List<Nft> smartContracts = [];
      for (final item in items) {
        Nft nft = Nft.fromJson(item);
        nft = await setAssetPath(nft);
        smartContracts.add(nft);
      }
      return CliPaginatedResponse(page: page, count: count, results: smartContracts);
    } catch (e) {
      return CliPaginatedResponse.empty();
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

  Future<Nft?> getNftData(String scId) async {
    try {
      final response = await getText('/GetSmartContractData/$scId');

      if (response.isNotEmpty) {
        try {
          final data = jsonDecode(response);
          Nft nft = Nft.fromJson(data);
          return nft;
        } catch (e) {
          print('problem loading nft from json');
          print(e);
        }
      }
    } catch (e) {
      print("Could not fetch data for $scId");
    }

    return null;
  }
}
