import 'dart:convert';

import 'package:collection/collection.dart';

import '../../token/models/token_details.dart';
import '../../../utils/toast.dart';

import '../../../core/models/paginated_response.dart';
import '../../../core/services/base_service.dart';
import '../../../core/singletons.dart';
import '../../../core/storage.dart';
import '../models/nft.dart';
import '../utils.dart';

class NftService extends BaseService {
  NftService() : super(apiBasePathOverride: "/scapi/scv1");

  Future<CliPaginatedResponse<Nft>> list(
    int page, {
    String search = "",
    bool forTokens = false,
  }) async {
    if (page < 1) {
      page = 1;
    }

    late String url;

    if (forTokens) {
      // /{pageNumber}/{excludeToken?}/{tokensOnly?}/{**search}
      url = search.isNotEmpty ? "/GetAllSmartContracts/$page/false/true/$search" : "/GetAllSmartContracts/$page/false/true";
    } else {
      url = search.isNotEmpty ? "/GetAllSmartContracts/$page/true/false/$search" : "/GetAllSmartContracts/$page/true/false";
    }

    // COMBINES NFTs and Tokens (for now...)
    // url = search.isNotEmpty ? "/GetAllSmartContracts/$page/true/$search" : "/GetAllSmartContracts/$page/false";

    // final params = forTokens ? {'tokensOnly': true} : {'excludeToken': true};

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

  Future<String?> currentOwner(String id) async {
    final stateHeader = await getText('/GetCurrentSCOwner/$id', cleanPath: false);
    final stateData = jsonDecode(stateHeader);

    return stateData['OwnerAddress'];
  }

  Future<Nft?> retrieve(String id) async {
    try {
      final response = await getText('/GetSingleSmartContract/$id');
      final data = jsonDecode(response);

      if (data == null) {
        return null;
      }

      Nft nft = Nft.fromJson(data[0]['SmartContract']);
      nft = nft.copyWith(code: data[0]['SmartContractCode'], currentOwner: data[0]['CurrentOwner']);
      nft = await setAssetPath(nft);

      final stateHeader = await getText('/GetCurrentSCOwner/$id', cleanPath: false);
      final stateData = jsonDecode(stateHeader);

      if (stateData != null && stateData.containsKey("TokenDetails") && stateData['TokenDetails'] != null) {
        final tokenDetails = TokenDetails.fromJson(stateData['TokenDetails']);
        nft = nft.copyWith(tokenStateDetails: tokenDetails);
      }

      return nft;
    } catch (e, st) {
      print("NFT Retrieve error");
      print(e);
      print(st);
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
            final d = data['SmartContractMain'];
            Nft nft = Nft.fromJson(d).copyWith(currentOwner: data['CurrentOwner']);

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
          final d = data['SmartContractMain'];
          Nft nft = Nft.fromJson(d).copyWith(currentOwner: data['CurrentOwner']);
          final stateHeader = await getText('/GetCurrentSCOwner/$scId', cleanPath: false);

          final stateData = jsonDecode(stateHeader);

          if (stateData.containsKey("TokenDetails") && stateData['TokenDetails'] != null) {
            final tokenDetails = TokenDetails.fromJson(stateData['TokenDetails']);
            nft = nft.copyWith(tokenStateDetails: tokenDetails);
          }

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

  Future<bool> requestMediaFromBeacon(String scId) async {
    try {
      final response = await getText("/CallMediaFromBeacon/$scId", cleanPath: false);
      final data = jsonDecode(response);
      if (data["Success"] == true) {
        return true;
      }
      Toast.error(data["Message"] ?? "A problem occurred");
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> importFromNetwork(String scId) async {
    try {
      final response = await getText("/AddNFTDataFromNetwork/$scId", cleanPath: false);
      final Map<String, dynamic> data = jsonDecode(response);

      print(data);

      if (data["Success"] == true) {
        return true;
      }
      Toast.error(data["Message"]);
      return false;
    } catch (e) {
      print(e);
      Toast.error("A problem occurred");
      return false;
    }
  }

  Future<String?> proveOwnership(String scId) async {
    try {
      final response = await getText("/ProveOwnership/$scId", cleanPath: false);
      final Map<String, dynamic> data = jsonDecode(response);

      if (data["Success"] == true) {
        return data['OwnershipScript'];
      }
      Toast.error(data["Message"]);
      return null;
    } catch (e) {
      print(e);
      Toast.error("A problem occurred");
      return null;
    }
  }

  Future<bool?> verifyOwnership(String signature) async {
    try {
      final response = await getText("/VerifyOwnership/$signature", cleanPath: false);
      final Map<String, dynamic> data = jsonDecode(response);
      return data["Success"] == true;
    } catch (e) {
      print(e);
      Toast.error("A problem occurred");
      return null;
    }
  }
}
