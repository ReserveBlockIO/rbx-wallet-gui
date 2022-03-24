import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/features/bridge/services/bridge_service.dart';
import 'package:rbx_wallet/features/node/models/node.dart';

class NodeListProvider extends StateNotifier<List<Node>> {
  final Reader read;

  NodeListProvider(this.read, [List<Node> nodes = const []]) : super(nodes);

  Future<void> load() async {
    state = await BridgeService().getMasterNodes();
  }
}

final nodeListProvider = StateNotifierProvider<NodeListProvider, List<Node>>(
  (ref) => NodeListProvider(ref.read),
);
