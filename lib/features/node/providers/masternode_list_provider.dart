import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/services/explorer_service.dart';
import '../../../utils/toast.dart';
import '../models/masternode.dart';

class MasternodeListProvider extends StateNotifier<List<Masternode>> {
  final Reader read;

  late final TextEditingController searchController;

  MasternodeListProvider(this.read, [List<Masternode> nodes = const []]) : super(nodes) {
    searchController = TextEditingController();
  }

  Future<void> search() async {
    final results = await ExplorerService().searchValidators(searchController.text);

    if (results.isEmpty) {
      Toast.error("No validator found with name `${searchController.text}`.");
    }

    state = results;
  }

  void clear() {
    searchController.text = "";
    state = [];
  }
}

final masternodeListProvider = StateNotifierProvider<MasternodeListProvider, List<Masternode>>(
  (ref) => MasternodeListProvider(ref.read),
);
