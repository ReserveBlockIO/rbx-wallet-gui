import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/features/bridge/services/bridge_service.dart';
import 'package:rbx_wallet/features/genesis/models/genesis_block.dart';

class GenesisBlockProvider extends StateNotifier<GenesisBlock?> {
  final Reader read;

  GenesisBlockProvider(this.read, [GenesisBlock? genesisBlock])
      : super(genesisBlock);

  Future<void> load() async {
    final gb = await BridgeService().genesisBlock();
    print(gb);
    state = gb;
  }
}

final genesisBlockProvider =
    StateNotifierProvider<GenesisBlockProvider, GenesisBlock?>(
  (ref) {
    return GenesisBlockProvider(ref.read);
  },
);
