import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../bridge/services/bridge_service.dart';
import '../models/genesis_block.dart';

class GenesisBlockProvider extends StateNotifier<GenesisBlock?> {
  final Ref ref;

  GenesisBlockProvider(this.ref, [GenesisBlock? genesisBlock]) : super(genesisBlock);

  Future<void> load() async {
    final gb = await BridgeService().genesisBlock();
    state = gb;
  }
}

final genesisBlockProvider = StateNotifierProvider<GenesisBlockProvider, GenesisBlock?>(
  (ref) {
    return GenesisBlockProvider(ref);
  },
);
