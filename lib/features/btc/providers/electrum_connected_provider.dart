import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/features/btc/services/btc_service.dart';

class ElectrumConnectedProvider extends StateNotifier<bool?> {
  ElectrumConnectedProvider() : super(null) {
    checkStatus();
  }

  Future<void> checkStatus() async {
    state = await BtcService().electrumConnectionState();
  }
}

final electrumConnectedProvider = StateNotifierProvider<ElectrumConnectedProvider, bool?>((ref) {
  return ElectrumConnectedProvider();
});
