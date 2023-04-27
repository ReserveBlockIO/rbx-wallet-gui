import 'dart:convert';
import 'dart:typed_data';

import 'package:rbx_wallet/core/app_constants.dart';
import 'package:rbx_wallet/features/adnr/models/adnr_response.dart';
import 'package:rbx_wallet/features/nft/models/web_nft.dart';
import 'package:rbx_wallet/features/web/models/web_address.dart';
import 'package:rbx_wallet/utils/toast.dart';
import '../../features/keygen/models/keypair.dart';

import '../../features/nft/models/nft.dart';
import '../../features/node/models/masternode.dart';
import '../../features/transactions/models/web_transaction.dart';
import '../../features/web/models/paginated_response.dart';
import '../../features/web/models/web_block.dart';
import '../env.dart';
import 'base_service.dart';
import 'package:dio/dio.dart';
import '../../features/web/utils/raw_transaction.dart';

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

  Future<List<Nft>> listNfts(String ownerAddress) async {
    try {
      final response = await getJson('/nft/', params: {'owner_address': ownerAddress});

      // final items = response['results'] as List<dynamic>;

      final List<Nft> results = response['results'].map<Nft>((json) => WebNft.fromJson(json).smartContract).toList();
      return results;
      // return items.map((n) => Nft.fromJson(n['data'])).toList();
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
}
