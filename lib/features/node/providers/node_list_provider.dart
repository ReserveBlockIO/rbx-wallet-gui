import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../bridge/services/bridge_service.dart';
import '../../wallet/providers/wallet_list_provider.dart';
import '../models/node.dart';

class NodeListProvider extends StateNotifier<List<Node>> {
  final Ref ref;

  late final TextEditingController searchController;

  NodeListProvider(this.ref, [List<Node> nodes = const []]) : super(nodes) {
    searchController = TextEditingController();
  }

  Future<void> load() async {
    final items = await BridgeService().getMasterNodes();
    final myAddresses = ref.read(walletListProvider).map((w) => w.address).toList();

    final myItems = items.where((node) => myAddresses.contains(node.address)).toList();

    state = myItems;
  }
}

final nodeListProvider = StateNotifierProvider<NodeListProvider, List<Node>>(
  (ref) => NodeListProvider(ref),
);
