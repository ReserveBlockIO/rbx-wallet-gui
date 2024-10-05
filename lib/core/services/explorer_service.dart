import 'dart:typed_data';

import 'package:rbx_wallet/features/price/models/price_data.dart';
import '../../features/price/models/price_history_item.dart';
import '../../features/nft/models/web_nft.dart';
import '../../features/token/models/web_fungible_token.dart';
import '../../features/web/models/web_address.dart';
import '../../utils/toast.dart';

import '../../features/nft/models/nft.dart';
import '../../features/node/models/masternode.dart';
import '../../features/transactions/models/web_transaction.dart';
import '../../features/web/models/paginated_response.dart';
import '../../features/web/models/web_block.dart';
import '../env.dart';
import 'base_service.dart';
import 'package:dio/dio.dart';

class ExplorerService extends BaseService {
  ExplorerService()
      : super(
          hostOverride: Env.explorerApiBaseUrl,
        );

  Future<List<Masternode>> searchValidators(String query) async {
    try {
      final response = await getJson('/masternodes/name/$query/');

      final results = [response];

      final List<Masternode> masternodes = [];
      for (final result in results) {
        masternodes.add(Masternode.fromJson(result));
      }

      return masternodes;
    } catch (e) {
      print(e);
      return [];
    }
  }

  Future<WebAddress> getWebAddress(String address) async {
    try {
      final data = await getJson('/addresses/$address');
      return WebAddress.fromJson(data);
    } catch (e) {
      return WebAddress(address: address, balance: 0.0);
    }
  }

  // Future<double> getBalance(String address) async {
  //   try {
  //     final response = await getJson('/addresses/$address');

  //     return response['balance'];
  //   } catch (e) {
  //     // print(e);
  //     return 0.0;
  //   }
  // }

  Future<WebTransaction?> retrieveTransaction(String hash) async {
    try {
      final data = await getJson('/transaction/$hash');
      return WebTransaction.fromJson(data);
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<PriceData?> retrievePriceData(String cointype) async {
    try {
      final result = await getJson('/cmc-price/$cointype');
      if (result.containsKey('success') && result['success'] == true) {
        return PriceData.fromJson(result['data']);
      }
      return null;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<List<PriceHistoryItem>> listPriceHistory(String cointype) async {
    try {
      final result = await getJson('/cmc-price/$cointype/history/');
      if (result.containsKey('success') && result['success'] == true) {
        final List<dynamic> data = result['data'];

        return data.map((e) => PriceHistoryItem(DateTime.fromMillisecondsSinceEpoch((e[1] * 1000).round()), e[0])).toList();
      }

      print(result[['message']]);
      return [];
    } catch (e) {
      print(e);
      return [];
    }
  }

  Future<PaginatedResponse<WebTransaction>> getTransactions({
    required int page,
    required String address,
    int limit = 10,
  }) async {
    try {
      final params = {
        'page': page,
        'limit': limit,
      };

      final response = await getJson('/transaction/address/$address', params: params);

      final List<WebTransaction> results = response['results'].map<WebTransaction>((json) => WebTransaction.fromJson(json)).toList();
      return PaginatedResponse(count: response['count'], page: response['page'], num_pages: response['num_pages'], results: results);
    } catch (e) {
      print("ERRR");
      print(e);
      return PaginatedResponse.empty();
    }
  }

  Future<WebBlock?> getLatestBlock() async {
    try {
      final response = await getJson('/blocks', params: {'limit': 1});

      if (response['results'] != null && (response['results'] as List).isNotEmpty) {
        return WebBlock.fromJson(response['results'].first);
      }
      return null;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<List<Nft>> listNfts(
    String ownerAddress, {
    int page = 1,
    String? search,
  }) async {
    try {
      final params = {
        'owner_address': ownerAddress,
        'page': page,
        'search': search ?? '',
      };

      final response = await getJson('/nft/', params: params);

      // final items = response['results'] as List<dynamic>;

      final List<Nft> results = response['results'].map<Nft>((json) => WebNft.fromJson(json).smartContract).toList();
      print(results);
      return results;
      // return items.map((n) => Nft.fromJson(n['data'])).toList();
    } catch (e) {
      print("listNfts Error");
      print(e);
      return [];
    }
  }

  Future<List<Nft>> listMintedNfts(
    String minterAddress, {
    int page = 1,
    String? search,
  }) async {
    try {
      final params = {
        'minter_address': minterAddress,
        'page': page,
        'search': search ?? '',
      };

      final response = await getJson('/nft/', params: params);

      // final items = response['results'] as List<dynamic>;

      final List<Nft> results = response['results'].map<Nft>((json) => WebNft.fromJson(json).smartContract).toList();
      return results;
      // return items.map((n) => Nft.fromJson(n['data'])).toList();
    } catch (e) {
      print(e);
      return [];
    }
  }

  Future<List<String>> listedNftIds(String ownerAddress) async {
    try {
      final response = await getJson('/nft/listed/$ownerAddress/');
      return response['results'].map<String>((id) => id.toString()).toList() as List<String>;
    } catch (e) {
      print(e);
      return [];
    }
  }

  Future<Nft?> retrieveNft(String id) async {
    try {
      final response = await getJson('/nft/$id');

      return WebNft.fromJson(response).smartContract;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<WebNft?> retrieveWebNft(String id) async {
    try {
      final response = await getJson('/nft/$id');

      return WebNft.fromJson(response);
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<bool> adnrAvailable(String adnr) async {
    try {
      await getJson('/addresses/adnr/$adnr');
      return false;
    } catch (e) {
      return true;
    }
  }

  Future<String?> uploadAsset(Uint8List bytes, String filename, String? ext) async {
    FormData body = FormData();

    final MultipartFile file = MultipartFile.fromBytes(bytes, filename: filename);
    MapEntry<String, MultipartFile> entry = MapEntry("file", file);

    body.files.add(entry);

    final response = await postFormData('/media/', data: body);

    if (!response.containsKey("url")) return null;

    return response['url'];
  }

  Future<int?> validatorCount() async {
    try {
      final response = await getJson('/masternodes/', params: {'limit': 0}, inspect: true);

      return response['count'];
    } catch (e) {
      print("Explorer masternodes");
      print(e);
      return null;
    }
  }

  Future<double> faucetInfo() async {
    try {
      final response = await getJson('/faucet/request');
      return response['max_amount'] ?? 0;
    } catch (e) {
      return 0;
    }
  }

  Future<String> faucetRequest(String phone, double amount, String address) async {
    final params = {
      'phone': phone,
      'amount': amount,
      'address': address,
    };

    print(params);
    try {
      final response = await postJson(
        '/faucet/request/',
        params: params,
        validateStatus: (status) {
          return status != null && status < 500;
        },
      );

      print(response);
      final data = response['data'];

      if (data['uuid'] != null) {
        return data['uuid'];
      }

      Toast.error(data['message']);
      throw Exception(data['message']);
    } catch (e) {
      Toast.error(e.toString());
      throw Exception(e);
    }
  }

  Future<String> faucetVerify(
    String uuid,
    String code,
  ) async {
    try {
      final response = await postJson(
        '/faucet/verify/',
        params: {
          'uuid': uuid,
          'verification_code': code,
        },
        validateStatus: (status) {
          return status != null && status < 500;
        },
      );

      final data = response['data'];

      if (data['hash'] != null) {
        return data['hash'];
      }

      throw Exception(data['message']);
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<List<WebFungibleTokenBalance>> getTokenBalances(String address) async {
    try {
      final response = await getJson("/addresses/${address.trim()}/tokens/");

      final List<dynamic> tokenDataList = response['tokens'];

      final List<WebFungibleTokenBalance> tokenBalances = [];
      for (final tokenData in tokenDataList) {
        final token = WebFungibleToken.fromJson(tokenData['token']);
        final balance = tokenData['balance'];

        tokenBalances.add(WebFungibleTokenBalance(address: response['address'], token: token, balance: balance));
      }

      return tokenBalances;
    } catch (e) {
      return [];
    }
  }
}
