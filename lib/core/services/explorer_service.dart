import 'package:rbx_wallet/core/services/base_service.dart';
import 'package:rbx_wallet/features/node/models/masternode.dart';

class ExplorerService extends BaseService {
  ExplorerService()
      : super(
          hostOverride: 'https://rbx-explorer-service.herokuapp.com/api',
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
}
