import 'package:rbx_wallet/core/env.dart';
import 'package:rbx_wallet/core/services/base_service.dart';
import 'package:rbx_wallet/features/nft/models/nft.dart';
import 'package:rbx_wallet/features/node/models/masternode.dart';
import 'package:rbx_wallet/features/web/models/web_block.dart';

class ExplorerService extends BaseService {
  ExplorerService()
      : super(
          hostOverride: Env.explorerApiBaseUrl,
        );

  Future<List<Masternode>> searchValidators(String query) async {
    final response = await getJson('/masternodes', params: {'search': query});

    final results = response['results'];

    final List<Masternode> masternodes = [];
    for (final result in results) {
      masternodes.add(Masternode.fromJson(result));
    }

    return masternodes;
  }

  Future<double> getBalance(String publicKey) async {
    try {
      final response = await getJson('/addresses/$publicKey');

      return double.parse(response['balance']);
    } catch (e) {
      print(e);
      return 0.0;
    }
  }

  Future<WebBlock?> getLatestBlock() async {
    try {
      final response = await getJson('/blocks', params: {'limit': 1});

      if (response['results'] != null &&
          (response['results'] as List).isNotEmpty) {
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
