import '../../features/nft/models/nft.dart';
import '../../features/node/models/masternode.dart';
import '../../features/transactions/models/web_transaction.dart';
import '../../features/web/models/paginated_response.dart';
import '../../features/web/models/web_block.dart';
import '../env.dart';
import 'base_service.dart';

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

  Future<double> getBalance(String publicKey) async {
    try {
      final response = await getJson('/addresses/$publicKey');

      return response['balance'];
    } catch (e) {
      // print(e);
      return 0.0;
    }
  }

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

  Future<List<Nft>> listNfts() async {
    try {
      final response = await getJson('/nfts');

      final items = response['results'] as List<dynamic>;

      return items.map((n) => Nft.fromJson(n['data'])).toList();
    } catch (e) {
      print(e);
      return [];
    }
  }

  Future<Nft?> retrieveNft(String id) async {
    try {
      final response = await getJson('/nfts/$id');

      return Nft.fromJson(response['data']);
    } catch (e) {
      print(e);
      return null;
    }
  }
}
