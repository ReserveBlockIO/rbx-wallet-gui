import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/features/bridge/services/bridge_service.dart';
import 'package:rbx_wallet/features/node/models/node_info.dart';

class NodeInfoProvider extends StateNotifier<List<NodeInfo>> {
  final Reader read;

  NodeInfoProvider(this.read, [List<NodeInfo> nodes = const []]) : super(nodes);

  Future<void> load() async {
    state = await BridgeService().getPeerInfo();
  }
}

final nodeInfoProvider =
    StateNotifierProvider<NodeInfoProvider, List<NodeInfo>>(
  (ref) => NodeInfoProvider(ref.read),
);
